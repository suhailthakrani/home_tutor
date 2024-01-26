import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';

class SSeeReviewsScreen extends StatefulWidget {
  const SSeeReviewsScreen({super.key});

  @override
  State<SSeeReviewsScreen> createState() => _SSeeReviewsScreenState();
}

class _SSeeReviewsScreenState extends State<SSeeReviewsScreen> {
  List<String> names = [
    "Ali",
    "Danish",
    "Karan",
    "Shahzaib",
    "Shoaib",
    "Suman",
    "Aqsa",
    "Kamran",
    "Amjad",
    "Salam",
    "Farooq",
    "Saad",
    "Mohsin",
    "Aamir",
    "Hasan"
  ];
  List<String> reviews = [
    "You have established a positive classroom atmosphere. Let’s explore ways to further foster a growth mindset among students.",
    "Your use of multimedia resources effectively enhances lessons. Can you think of additional ways to integrate technology for interactive learning?",
    "Your lessons are well-structured. Consider incorporating more opportunities for inquiry-based learning.",
    "I’ve noticed that students enjoy your class discussions, although not all take part. Consider finding ways to encourage all students to participate actively.",
    "Your rapport with students is commendable. Do you think you can leverage that connection to motivate their curiosity?",
    "Your passion for teaching is evident. However, allowing students to ask clarifying questions will make the learning experience more interactive and engaging.",
    "You have a strong ability to identify struggling students. It will be great to design targeted interventions to support their needs.",
    "Your communication with parents is consistent. Consider incorporating positive anecdotes about student progress in your updates.",
    "Your instructional pacing is appropriate, but you can find ways to add more opportunities for enrichment tasks to challenge high-achieving students.",
    "You incorporate real-world connections effectively. Consider connecting students with guest speakers or field trips to deepen their understanding.",
    "Your ability to adapt to changes is commendable. Still, you can incorporate new teaching methodologies to enhance learning.",
    "Your classroom routines are effective, and to further make them even more impactful, consider using transition times to promote student self-assessment.",
    "You have solid classroom management skills. How can you further empower students to take ownership of their behavior?",
    "Your assessments are well-designed. Let’s explore formative assessment strategies to provide more immediate feedback to students.",
    "Your commitment to continuous improvement is admirable. However, setting specific professional development goals to enhance your teaching practices is beneficial."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        title: const Text(
          "Reviews and Ratings",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
            // Navigator.pushReplacement(
            //     context, MaterialPageRoute(builder: (context) => Student()));
          },
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.symmetric(vertical:16.0),
        child: Column(
          children: [
            ListView.separated(
              itemCount: names.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical:16,horizontal: 16),
                  decoration: const BoxDecoration(
                    color: kFieldGreyColor,
                    boxShadow:  [
                      BoxShadow(
                        color: kFieldGreyColor,
                        offset: Offset(2, 0)
                      ),
                    
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${names[index]}",
                              style:const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          RatingBarIndicator(
                            rating:
                                (Random().nextDouble() * 3 + 1).toPrecision(1),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 4,
                            itemSize: 20.0,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        reviews[index],
                        style:const TextStyle(
                          color: Colors.black45
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                );
              }), separatorBuilder: (_, int index) => const SizedBox(height: 8),
            ),
          ],
        ),
      ),
    );
  }
}
