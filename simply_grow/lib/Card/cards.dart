import 'dart:developer';

import 'package:simply_grow/api.dart';
import 'package:simply_grow/views/onboarding/authService.dart';
import 'package:simply_grow/widgets/loadingPage.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constant.dart';
import '../views/onboarding/authService.dart';

class CardView extends StatefulWidget {
  CardView({Key key}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  CardController controller;
  List<String> questions = [
    "List is Immutable",
    "Tuple is Immutable",
    "String is Mutable",
  ];
  List<String> answers = ["False", "True", "True"];
  List<String> userAnswers = ["True", "True", "True"];
  int currentIndex = 0;
  bool showResults = false;
  double _falseOpacity = 0.0;
  double _trueOpacity = 0.0;
  // AuthService authService = Get.find();
  var totalQuestions = 1;

  var correctAnswers = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ApiEndpoints.checkFlashResponseGiven(
    //         token: authService.userData.value.token,
    //         date: DateTime.now().format("Y-m-d"))
    //     .then((res) {
    //   log(res.toString());
    //   if (res.isEmpty) {
    //     ApiEndpoints.getFlashCards(authService.userData.value.token)
    //         .then((value) {
    //       setState(() {
    //         totalQuestions = value.length;
    //         questions = value.map((e) => e.question).toList();
    //         answers = value.map((e) => e.answer).toList();
    //         userAnswers = List.filled(value.length, "-1");
    //       });
    //     });
    //   } else {
    //     showResults = true;
    //     correctAnswers = int.parse(res[0].correctQuestions);
    //     totalQuestions = int.parse(res[0].totalQuestions);
    //     userAnswers = List.filled(correctAnswers, "1");
    //     answers = List.filled(correctAnswers, "1");
    //     setState(() {});
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffECEEFF),
      body: SafeArea(
          child: false //showResults
              ? _showResultWidget(context)
              : questions.isEmpty
                  ? LoadingPage()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff8346F0),
                          ),
                        ).px(10),
                        // if (showResults == false)
                        //   _makeProgressBar(currentIndex, questions.length),
                        20.heightBox,
                        Container(
                          height: MediaQuery.of(context).size.height * 0.76,
                          decoration: BoxDecoration(
                              color: Color(0xff8346F0),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.16),
                                    offset: Offset(3, 5),
                                    blurRadius: 13)
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: TinderSwapCard(
                                  swipeUp: false,
                                  swipeDown: false,
                                  orientation: AmassOrientation.BOTTOM,
                                  totalNum: questions.length,
                                  stackNum: 3,
                                  swipeEdge: 4.0,
                                  animDuration: 300,
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.82,
                                  maxHeight:
                                      MediaQuery.of(context).size.height * 0.5,
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                  minHeight:
                                      MediaQuery.of(context).size.height * 0.47,
                                  cardBuilder: (context, index) =>
                                      _cardWidget(questions[index]),
                                  cardController: controller = CardController(),
                                  swipeUpdateCallback:
                                      (DragUpdateDetails details,
                                          Alignment align) {
                                    /// Get swiping card's alignment
                                    //log(align.x.toString());
                                    if (align.x < 0) {
                                      // log(align.x.toString());
                                      _falseOpacity = ((align.x / 4).abs() >= 1
                                          ? 1.0
                                          : (align.x / 4).abs());
                                      setState(() {});
                                      //Card is LEFT swiping
                                    } else if (align.x > 0) {
                                      _trueOpacity = ((align.x / 4).abs() >= 1
                                          ? 1.0
                                          : (align.x / 4).abs());
                                      setState(() {});
                                      //Card is RIGHT swiping
                                    }
                                  },
                                  swipeCompleteCallback:
                                      (CardSwipeOrientation orientation,
                                          int index) {
                                    if (orientation ==
                                        CardSwipeOrientation.LEFT) {
                                      userAnswers[index] = "0";
                                      if (currentIndex < questions.length - 1) {
                                        currentIndex++;
                                      } else {
                                        showResults = true;
                                        _onComplete();
                                      }
                                      setState(() {});
                                    } else if (orientation ==
                                        CardSwipeOrientation.RIGHT) {
                                      userAnswers[index] = "1";
                                      if (currentIndex < questions.length - 1) {
                                        currentIndex++;
                                      } else {
                                        showResults = true;
                                        _onComplete();
                                      }
                                      setState(() {});
                                    }

                                    log(index.toString());
                                    _falseOpacity = 0.0;
                                    _trueOpacity = 0.0;

                                    setState(() {});

                                    /// Get orientation & index of swiped card!
                                  },
                                ),
                              ),
                              //20.heightBox,
                              _trueFalseRowbuilder(),
                              10.heightBox,
                            ],
                          ),
                        ).px16()
                      ],
                    )),
    );
  }

  void _onComplete() {
    correctAnswers = 0;
    userAnswers.forEachIndexed((index, element) {
      if (element == answers[index]) {
        correctAnswers++;
      }
    });
    log("Correct " + correctAnswers.toString());
    // var res = ApiEndpoints.saveFlashCardProgress(
    //   token: authService.userData.value.token,
    //   totalQuestions: totalQuestions.toString(),
    //   correctAnswers: correctAnswers.toString(),
    // );
  }

  Column _showResultWidget(BuildContext context) {
    correctAnswers = 0;
    userAnswers.forEachIndexed((index, element) {
      if (element == answers[index]) {
        correctAnswers++;
      }
    });
    log("Correct " + correctAnswers.toString());
    return Column(
      children: [
        Container(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Lottie.asset('images/confetti.json', repeat: false),
              Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      60.heightBox,
                      Text(
                        "Congratulations",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff905CE5),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "You have completed all the flash cards for today.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff905CE5),
                            fontWeight: FontWeight.bold),
                      ),
                      // 20.heightBox,
                      // CircularPercentIndicator(
                      //   radius: context.safePercentWidth * 40,
                      //   lineWidth: 13.0,
                      //   animation: true,
                      //   percent: correctAnswers / totalQuestions,
                      //   center: new Text(
                      //     "$correctAnswers/$totalQuestions",
                      //     style: new TextStyle(
                      //         fontWeight: FontWeight.w400,
                      //         fontSize: 25,
                      //         fontFamily: 'Roboto'),
                      //   ),
                      //   circularStrokeCap: CircularStrokeCap.round,
                      //   // progressColor: Utils.themeColor,
                      //   linearGradient: LinearGradient(
                      //     begin: Alignment.bottomLeft,
                      //     end: Alignment.topRight,
                      //     colors: [
                      //       Color(0xff982DF5),
                      //       Color(0xff0098FE),
                      //     ],
                      //   ),
                      //   // Vx.gray300,
                      //   backgroundColor: Color(0xff759AFF).withOpacity(0.11),
                      // ),
                      30.heightBox,
                      Text("Come back tomorrow for more exciting questions.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      20.heightBox,
                      Text(
                        "Go Back",
                        // style: Utils.subtitle2.copyWith(
                        //     color: Colors.black,
                        //     fontWeight: FontWeight.bold)
                      )
                          .py(10)
                          .px(22)
                          .box
                          .white
                          .outerShadowLg
                          .roundedLg
                          .make()
                          .onTap(() {
                        Get.back();
                      })
                    ],
                  ).px16()),
            ],
          ),
        ).expand(),
      ],
    );
  }

  Row _trueFalseRowbuilder() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 140,
          height: 44,
          child: Stack(
            children: [
              Container(
                width: 140,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: Offset(2, 7),
                        blurRadius: 7,
                      )
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      EvaIcons.close,
                      color: Vx.red400,
                      size: 28,
                    ),
                    Text(
                      "False",
                      style: TextStyle(
                          color: Vx.red400,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ).centered(),
              ),
              AnimatedOpacity(
                duration: 200.milliseconds,
                opacity: _falseOpacity,
                child: Container(
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                      color: Vx.red400,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(2, 7),
                          blurRadius: 7,
                        )
                      ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.close,
                        color: Colors.white,
                        size: 28,
                      ),
                      Text(
                        "False",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ).centered(),
                ),
              )
            ],
          ),
        ).onTap(() {
          controller.triggerLeft();
        }),
        Container(
          width: 140,
          height: 44,
          child: Stack(
            children: [
              Container(
                width: 140,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.16),
                        offset: Offset(2, 7),
                        blurRadius: 7,
                      )
                    ]),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      EvaIcons.checkmark,
                      color: Vx.green500,
                      size: 28,
                    ),
                    Text(
                      "True",
                      style: TextStyle(
                          color: Vx.green500,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ).centered(),
              ),
              AnimatedOpacity(
                duration: 200.milliseconds,
                opacity: _trueOpacity,
                child: Container(
                  width: 140,
                  height: 44,
                  decoration: BoxDecoration(
                      color: Vx.green500,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.16),
                          offset: Offset(2, 7),
                          blurRadius: 7,
                        )
                      ]),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        EvaIcons.checkmark,
                        color: Colors.white,
                        size: 28,
                      ),
                      Text(
                        "True",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            height: 1,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ).centered(),
                ),
              )
            ],
          ),
        ).onTap(() {
          controller.triggerRight();
        }),
      ],
    );
  }

  _makeProgressBar(int current, int total) {
    var totalWidth = MediaQuery.of(context).size.width - 32;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Question ${current + 1}",
              style: TextStyle(
                  fontSize: 22,
                  color: Color(0xff905CE5),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "/ ${total}",
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff905CE5),
                  fontWeight: FontWeight.bold),
            )
          ],
        ).px16(),
        6.heightBox,
        Container(
            height: 26,
            width: totalWidth,
            decoration: BoxDecoration(
              color: Color(0xff759AFF).withOpacity(0.11),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: 26,
                  width: ((current + 1) / (total)) * totalWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xff982DF5),
                        Color(0xff0098FE),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  _cardWidget(String question) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 9),
                blurRadius: 7,
                color: Colors.black.withOpacity(0.30))
          ]),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "images/watermark.png",
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              top: 28,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xff8346F0), width: 2)),
              )),
          Positioned(
              top: 10,
              left: 22,
              right: 22,
              bottom: 24,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 38,
                    decoration: BoxDecoration(
                      color: Color(0xff8346F0),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: "Data Structure"
                        .text
                        .bold
                        .white
                        .size(24)
                        .make()
                        .centered(),
                  ),
                  8.heightBox,
                  "Q.".text.bold.size(50).color(Color(0xff8346F0)).make(),
                  12.heightBox,
                  question.text.bold.size(34).black.make().expand()
                ],
              ))
        ],
      ),
    );
  }
}
