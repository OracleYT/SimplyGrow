// import 'package:simply_grow/Screens/Likes_Screen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:simply_grow/app_theme.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailsScreen extends StatelessWidget {
  final List<String> _ids = [
    'FvkZ9C8UrdA',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFFF5F4EF),
          // borderRadius: BorderRadius.circular(40),
          image: DecorationImage(
            image: AssetImage("assets/images/ux_big.png"),
            fit: BoxFit.contain,
            alignment: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        // color: kBestSellerColor,
                        padding: const EdgeInsets.only(
                            left: 10, top: 5, right: 10, bottom: 5),
                        child: Text(
                          "Be sem IV".toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ClipRRect(
                    // clipBehavior: Clip.antiAlias,
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // borderRadius: BorderRadius.circular(30)
                      ),
                      width: double.infinity,
                      // height: 250,
                      // child: YoutubePlayer(
                      //   controller: YoutubePlayerController(
                      //     initialVideoId: _ids.first,
                      //     flags: const YoutubePlayerFlags(
                      //       mute: false,
                      //       autoPlay: true,
                      //       disableDragSeek: false,
                      //       loop: false,
                      //       isLive: false,
                      //       forceHD: false,
                      //       enableCaption: true,
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipPath(
                    clipper: BestSellerClipper(),
                    child: Container(
                      color: Colors.yellow,
                      padding: const EdgeInsets.only(
                          left: 10, top: 5, right: 20, bottom: 5),
                      child: Text(
                        "Discrete Mathematics".toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Vector Calculus",
                  ),
                  const SizedBox(height: 16),

                  // SizedBox(height: 20),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(
                  //         text: "\$50 ",
                  //         style: kHeadingextStyle.copyWith(fontSize: 32),
                  //       ),
                  //       TextSpan(
                  //         text: "\$70",
                  //         style: TextStyle(
                  //           color: kTextColor.withOpacity(.5),
                  //           decoration: TextDecoration.lineThrough,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Text("Course Content"),
                          SizedBox(height: 30),
                          CourseContent(
                            number: "01",
                            duration: 5.35,
                            title: "Welcome to the Course",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '02',
                            duration: 19.04,
                            title: "Design Thinking - Intro",
                            isDone: true,
                          ),
                          CourseContent(
                            number: '03',
                            duration: 15.35,
                            title: "Design Thinking Process",
                          ),
                          CourseContent(
                            number: '04',
                            duration: 5.35,
                            title: "Customer Perspective",
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 50,
                              color: Colors.black.withOpacity(.1),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            const SizedBox(width: 20),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: HexColorNew("#90CAC7"),
                                ),
                                child: const Text(
                                  "Buy Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CourseContent extends StatelessWidget {
  final String number;
  final double duration;
  final String title;
  final bool isDone;
  const CourseContent({
    this.number,
    this.duration,
    this.title,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: <Widget>[
          Text(
            number,
            style: TextStyle(
              color: Colors.black.withOpacity(.15),
              fontSize: 32,
            ),
          ),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$duration mins\n",
                  style: TextStyle(
                    color: Colors.black.withOpacity(.5),
                    fontSize: 18,
                  ),
                ),
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green.withOpacity(isDone ? 1 : .5),
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
            onTap: () {
              // Navigator.push(
              //   context,
              // MaterialPageRoute(builder: (context) => const LikesScreen()),
              // );
            },
          )
        ],
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 20, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}
