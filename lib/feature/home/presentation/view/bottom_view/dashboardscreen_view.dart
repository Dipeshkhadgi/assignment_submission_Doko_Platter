import 'dart:io';

import 'package:doko_platter/feature/auth/presentation/view_model/profile/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}



class UserInfoCard extends StatelessWidget {
  final String username;
  final String email;
  final String imageUrl;

  const UserInfoCard({
    super.key,
    required this.username,
    required this.email,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: imageUrl.isNotEmpty
                  ? (imageUrl.startsWith('http') ||
                          imageUrl.startsWith('https'))
                      ? NetworkImage(imageUrl)
                      : FileImage(File(imageUrl))
                  : const AssetImage('assets/images/default_profile.png')
                      as ImageProvider,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final bool isFavourite;
  final VoidCallback onSeeMore;
  final VoidCallback onFavouriteToggle;

  const RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isFavourite,
    required this.onSeeMore,
    required this.onFavouriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isFavourite ? Icons.favorite : Icons.favorite_border,
                    color: isFavourite
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: onFavouriteToggle,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSeeMore,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Changed color to green
                      foregroundColor:
                          Colors.white, // Set the text color to white
                      elevation: 4, // Optional: Add elevation for shadow effect
                    ),
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RecipeDetailsPage extends StatelessWidget {
  final String recipeTitle;
  final String recipeDescription;
  final String recipeImageUrl;

  const RecipeDetailsPage({
    super.key,
    required this.recipeTitle,
    required this.recipeDescription,
    required this.recipeImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeTitle),
        backgroundColor: const Color(0xFF7F6BC1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(recipeImageUrl, height: 200, fit: BoxFit.cover),
              const SizedBox(height: 20),
              Text(
                recipeTitle,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                recipeDescription,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
