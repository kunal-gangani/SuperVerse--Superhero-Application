import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superhero_application/Controllers/json_controllers.dart';
import 'package:superhero_application/Model/superheros_model.dart';
import 'package:superhero_application/Routes/routes.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final JsonControllers jsonController = Get.find<JsonControllers>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Favourites',
          style: GoogleFonts.permanentMarker(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.redAccent.shade700,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Obx(() {
            var favorites = jsonController.favorites;

            if (favorites.isEmpty) {
              return Center(
                child: Text(
                  'No Favorites Yet',
                  style: GoogleFonts.permanentMarker(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              );
            }

            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                SuperheroesModel superhero = favorites[index];

                return ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(superhero.profileImage),
                  ),
                  title: Text(
                    superhero.name,
                    style: GoogleFonts.permanentMarker(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    superhero.realName,
                    style: GoogleFonts.bangers(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                  onTap: () {
                    Get.toNamed(
                      Routes.detailsPage,
                      arguments: superhero,
                    );
                  },
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
