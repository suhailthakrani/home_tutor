import 'package:flutter/material.dart';

class SeeReviewsScreen extends StatefulWidget {
  const SeeReviewsScreen({super.key});

  @override
  State<SeeReviewsScreen> createState() => _SeeReviewsScreenState();
}

class _SeeReviewsScreenState extends State<SeeReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 30,
              child: Row(
                children: [
                  Text(
                    '12',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: ((context, index) {
                    return const SizedBox(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Baboo Herrani",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "3.4/5",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            " Such a lovely experience. The delivery person made the experience really enjoyable even in the current climate. They were so helpful from start to finish., offering great advise and going above a beyond to help me find the perfect dress.",
                            style: TextStyle(),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    );
                  })),
            ),
          ],
        ),
      ),
    );
  }
}