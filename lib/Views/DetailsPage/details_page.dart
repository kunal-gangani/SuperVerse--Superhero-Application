import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superhero_application/Model/superheros_model.dart';
import 'package:superhero_application/Controllers/json_controllers.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    SuperheroesModel superhero = Get.arguments as SuperheroesModel;
    JsonControllers jsonController = Get.find<JsonControllers>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          superhero.name,
          style: GoogleFonts.permanentMarker(
            fontSize: 28,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 10,
        shadowColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Obx(() => IconButton(
                icon: Icon(
                  jsonController.isSuperheroFavorite(superhero)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: jsonController.isSuperheroFavorite(superhero)
                      ? Colors.black
                      : Colors.white,
                ),
                onPressed: () {
                  jsonController.addToFav(superhero);
                },
              )),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(superhero.backgroundImage),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          // Superhero Details
          SingleChildScrollView(
            child: Column(
              children: [
                // Profile Image
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(superhero.profileImage),
                  ),
                ),
                Text(
                  superhero.name,
                  style: GoogleFonts.permanentMarker(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Real Name: ${superhero.realName}",
                  style: GoogleFonts.bangers(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSection("Powers", superhero.powers),
                _buildSection("Weaknesses", superhero.weaknesses),
                ListTile(
                  title: Text(
                    "Affiliation: ${superhero.affiliation.name}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "First Appearance: ${superhero.firstAppearance}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.permanentMarker(
              fontSize: 20,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 8),
          ...items.map(
            (item) => Text(
              "- $item",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
