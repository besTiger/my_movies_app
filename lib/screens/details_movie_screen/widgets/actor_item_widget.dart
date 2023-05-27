import 'package:flutter/material.dart';

import '../../../models/actors.dart';

class ActorItem extends StatelessWidget {
  final Actors actor;

  const ActorItem({super.key, required this.actor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 36,
              backgroundImage: NetworkImage(
                actor.profileUrl,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: SizedBox(
              width: 100,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  actor.name,
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
