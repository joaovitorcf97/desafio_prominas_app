import 'package:flutter/material.dart';

import '../material_page.dart';

class Disciplenes extends StatelessWidget {
  final String title;
  final String description;
  final String url;

  const Disciplenes({
    super.key,
    required this.title,
    required this.description,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124,
      margin: const EdgeInsets.only(
        left: 16,
        top: 16,
        right: 16,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFED8A6F),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.all(28),
                child: const Image(
                  image: AssetImage('assets/images/mortarboard.png'),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Flexible(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[600]),
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text('Nota: '),
                        Text(
                          '9.5',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MaterialPDFPage(url: url),
                          ),
                        );
                      },
                      child: const Text('Ler material'),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
