import 'package:flutter/material.dart';
import '../../../models/description.dart';
import '../../../services/movie_api.dart';

class ActorList extends StatelessWidget {
  final int movieId;

  const ActorList({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Actor>>(
      future: MovieApi.fetchActors(movieId: movieId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text('Failed to fetch actors');
        } else {
          final actors = snapshot.data;
          if (actors != null && actors.isNotEmpty) {
            return SizedBox(
              height: 150,
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final actor in actors) _buildActorItem(actor),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text('No actors found');
          }
        }
      },
    );
  }

  Widget _buildActorItem(Actor actor) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(actor.profileUrl),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 100, // Adjust the width as needed
            child: Text(
              actor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
