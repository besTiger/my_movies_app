import 'package:flutter/material.dart';
import '../../../models/actors.dart';
import '../../../services/actors_api.dart';
import 'actor_item_widget.dart';

class ActorList extends StatelessWidget {
  final int movieId;

  const ActorList({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Actors>>(
      future: ActorsApi.fetchActors(movieId: movieId),
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (final actor in actors) ActorItem(actor: actor),
                  ],
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
}
