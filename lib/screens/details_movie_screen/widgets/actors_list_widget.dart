import 'package:flutter/material.dart';

import '../../../models/actors.dart';
import 'actor_item_widget.dart';

class ActorsList extends StatelessWidget {
  final List<Actors> actors;

  const ActorsList({super.key, required this.actors});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 2,
      right: 2,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actors.length,
          itemBuilder: (context, index) {
            return ActorItem(actor: actors[index]);
          },
        ),
      ),
    );
  }
}