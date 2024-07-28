import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    super.key,
  });

  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(
            image,
            width: 100,
            height: 100,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ...[
                  'Status: $status',
                  'Species: $species',
                  'Gender: $gender',
                ].map(
                  (descriptionText) => Text(
                    descriptionText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
