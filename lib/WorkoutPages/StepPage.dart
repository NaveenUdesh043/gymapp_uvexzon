import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gymapp_uvexzon/ProfilePages/ProfilePage.dart';
import 'package:gymapp_uvexzon/common_utills/Step_Details.dart';
import 'package:gymapp_uvexzon/common_utills/roundBtn.dart';
import 'package:gymapp_uvexzon/utills/colours.dart';
import 'package:readmore/readmore.dart';


class ExercisesStepDetails extends StatefulWidget {
  final Map eObj;
  const ExercisesStepDetails({super.key, required this.eObj});

  @override
  State<ExercisesStepDetails> createState() => _ExercisesStepDetailsState();
}

class _ExercisesStepDetailsState extends State<ExercisesStepDetails> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
      "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
      "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
      "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
      "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PageColors.black,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: PageColors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Image.asset(
              "assets/images/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: PageColors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Image.asset(
                "assets/images/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: PageColors.black,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 25
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.48,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: PageColors.primaryG),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.asset(
                      "assets/images/workoutdetails.jpg",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                        color: PageColors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Image.asset(
                  //     "assets/img/Play.png",
                  //     width: 30,
                  //     height: 30,
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: PageColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(
                  color: PageColors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Descriptions",
                style: TextStyle(
                    color: PageColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 4,
              ),
              ReadMoreText(
                'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide',
                trimLines: 4,
                colorClickableText: PageColors.white,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More ...',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: PageColors.white,
                  fontSize: 12,
                ),
                moreStyle:
                const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: PageColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} Sets",
                      style: TextStyle(color: PageColors.gray, fontSize: 12),
                    ),
                  )
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr.length,
                itemBuilder: ((context, index) {
                  var sObj = stepArr[index] as Map? ?? {};

                  return StepDetailRow(
                    sObj: sObj,
                    isLast: stepArr.last == sObj,
                  );
                }),
              ),
              Text(
                "Custom Repetitions",
                style: TextStyle(
                    color: PageColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 150,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: PageColors.white.withOpacity(0.2),
                            width: 1
                        ),
                        bottom: BorderSide(
                            color: PageColors.white.withOpacity(0.2),
                            width: 1),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {},
                  childCount: 60,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/burn.png",
                          width: 15,
                          height: 15,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          " ${(index + 1) * 15} Calories Burn",
                          style: TextStyle(
                              color: PageColors.white,
                              fontSize: 10
                          ),
                        ),
                        Text(
                          " ${index + 1} ",
                          style: TextStyle(
                              color: PageColors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Text(
                          " times",
                          style: TextStyle(color: PageColors.white, fontSize: 16),
                        )
                      ],
                    );
                  },
                ),
              ),
              RoundBtnn(topic: "Save",
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfilePage()
                      ),
                    );
                  }),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
