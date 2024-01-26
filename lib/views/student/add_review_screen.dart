import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/text_field_manager.dart';
import 'package:home_tutor/views/widgets/general_text_field.dart';

class SRateTeacherScreen extends StatefulWidget {
  final String teacherId;
  final String teacherName;
  final String teacherProfile;
  const SRateTeacherScreen({
    Key? key,
    required this.teacherId,
    required this.teacherName,
    required this.teacherProfile,
  }) : super(key: key);

  @override
  State<SRateTeacherScreen> createState() => _RateNowSreenState();
}

class _RateNowSreenState extends State<SRateTeacherScreen> {
  final _reviewController =
      TextFieldManager("Write here...", mandatory: true, length: 500);
  double rating = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kWhiteColor,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 20),
              Text(
                "Thank you!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: Colors.orange.shade400,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "for using our service.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.w600,
                  letterSpacing: 0.3,
                  color: kPrimaryColor,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "How was your experience\nwith",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: Colors.black45,
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  child: Image.network(
                    widget.teacherProfile,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    errorBuilder: ((context, error, stackTrace) {
                      return const Icon(Icons.error_outline);
                    }),
                  )),
              const SizedBox(height: 8),
              Text(
                widget.teacherName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.3,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              RatingBar.builder(
                initialRating: 3,
                itemSize: 35,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 5),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rate) {
                  setState(() {
                    rating = rate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      "Rate: ${rating} / 5",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ADD YOUR REVIEW",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GeneralTextField(
                tfManager: _reviewController,
                paddingHorizontal: 1,
                maxLines: 8,
                isObscure: RxBool(false),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    if (mounted) {
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Send your Feedback",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
