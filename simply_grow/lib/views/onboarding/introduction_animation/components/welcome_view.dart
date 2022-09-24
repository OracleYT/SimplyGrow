import 'package:flutter/material.dart';

class WelcomeView extends StatefulWidget {
  final AnimationController animationController;

  const WelcomeView({Key key, this.animationController}) : super(key: key);

  @override
  _WelcomeViewState createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    final _introductionanimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.0, -1.0))
            .animate(CurvedAnimation(
      parent: widget.animationController,
      curve: Interval(
        0.0,
        0.2,
        curve: Curves.fastOutSlowIn,
      ),
    ));
    return SlideTransition(
      position: _introductionanimation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 140,
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 36.0, bottom: 24.0, left: 32),
              //   child: Text(
              //     "Welcome,",
              //     textAlign: TextAlign.left,
              //     style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              //   ),
              // ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 56, right: 56),
              //   child: Text(
              //     "We welcome you to be a part of the Coding Jr",
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 56, right: 56),
                child: Text(
                  "Where the world learns to code",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // SizedBox(
              //   height: 58,
              // ),
            ],
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: InkWell(
                onTap: () {
                  widget.animationController.animateTo(0.2);
                },
                child: Container(
                  height: 58,
                  padding: EdgeInsets.only(
                    left: 56.0,
                    right: 56.0,
                    top: 16,
                    bottom: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: Color(0xff132137),
                  ),
                  child: Text(
                    "Let's begin",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
