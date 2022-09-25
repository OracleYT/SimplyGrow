import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:simply_grow/views/home/navigationWrapper.dart';
// import 'package:walk_with_you/style/theme.dart' as Theme;
import '../constant.dart';
import '../widgets/textField.dart';

class ColorsNew {
  const ColorsNew();

  static const Color loginGradientStart = Color(0xFFfbab66);
  static const Color loginGradientEnd = Color(0xFFf7418c);
}

// class TabIndicationPainter extends CustomPainter {
//   Paint painter = new Paint();
//   final double dxTarget;
//   final double dxEntry;
//   final double radius;
//   final double dy;

//   final PageController pageController;

//   TabIndicationPainter(
//       {this.dxTarget = 125.0,
//       this.dxEntry = 25.0,
//       this.radius = 21.0,
//       this.dy = 25.0,
//       this.pageController})
//       : super(repaint: pageController) {
//     painter = painter
//       ..color = Color(0xFFFFFFFF)
//       ..style = PaintingStyle.fill;
//   }

// }

class RelaxView extends StatefulWidget {
  const RelaxView({
    Key key,
  }) : super(key: key);

  @override
  _RelaxViewState createState() => _RelaxViewState();
}

class _RelaxViewState extends State<RelaxView> {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool success = false;

  TextEditingController signupEmailController = TextEditingController();
  TextEditingController signupNameController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController signupConfirmPasswordController =
      TextEditingController();

  PageController pageController;
  AnimationController animationController;

  TextEditingController name = TextEditingController();
  TextEditingController email2 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Color left = Colors.black;
  Color right = Colors.white;

  bool page = false;
  // void _onSignInButtonPress() {
  //   // final viewModel = ref.watch(IntroductionAnimationScreenViewModel.provider);

  //   viewModel.pageController.animateToPage(0,
  //       duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  // }

  // void _onSignUpButtonPress() {
  //   final viewModel = ref.watch(IntroductionAnimationScreenViewModel.provider);

  //   viewModel.pageController.animateToPage(1,
  //       duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  // }

  @override
  void initState() {
    pageController = PageController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    // widget.pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    // return
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 36, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text(
                  "Get Along ...",
                  style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 16, left: 64, right: 64),
                //   child: Text(
                //     "Join Challenges. Get Fit.\n Earn Rewards.",
                //     textAlign: TextAlign.center,
                //     style: TextStyle(
                //       color: Color.fromARGB(255, 166, 172, 179),
                //     ),
                //   ),
                // ),
                GestureDetector(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 12, left: 34, right: 34),
                      child: page == false // 0.4
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      // fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 166, 172,
                                          179) //Color.fromARGB(255, 18, 18, 18),
                                      ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  },
                                  child: const Text(
                                    "  Login here  ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 18, 18, 18),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(

                                      // fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 166, 172,
                                          179) //Color.fromARGB(255, 18, 18, 18),
                                      ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    pageController.animateToPage(0,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  },
                                  child: const Text(
                                    "  Sign Up  ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromARGB(255, 18, 18, 18),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                ),
                SizedBox(
                  // color: Colors.black,
                  width: MediaQuery.of(context).size.width,
                  height:
                      //MediaQuery.of(context).size.height >= 775.0
                      //     ? MediaQuery.of(context).size.height
                      // :
                      330.0,
                  child: PageView(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    onPageChanged: (i) {
                      if (i == 0) {
                        setState(() {
                          page = false;
                          // pageController.page;
                          right = Colors.white;
                          left = Colors.black;
                        });
                      } else if (i == 1) {
                        setState(() {
                          page = true;
                          // pageController.page;
                          right = Colors.black;
                          left = Colors.white;
                        });
                      }
                    },
                    children: <Widget>[
                      _buildSignUp(context),
                      _buildSignIn(context),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(231, 236, 243, 1),
                            Color.fromARGB(255, 212, 218, 225),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Text(
                      "Or",
                      style: TextStyle(
                          color: Color.fromARGB(255, 212, 218,
                              225), //Color.fromRGBO(231, 236, 243, 1),
                          fontSize: 16.0,
                          fontFamily: "WorkSansMedium"),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 212, 218, 225),
                            Color.fromRGBO(231, 236, 243, 1),
                          ],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    width: 100.0,
                    height: 1.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Conditional.single(
                  // context: context,
                  // conditionBuilder: (context) =>
                  // loginPageModel.supportsAppleSignIn,
                  // widgetBuilder: (context) => Column(
                  // children: [
                  Platform.isIOS
                      ? Padding(
                          padding: const EdgeInsets.only(
                              top: 22.0, right: 0.0, bottom: 12),
                          child: GestureDetector(
                            onTap: () async {
                              // success = await loginPageModel.appleSignIn();
                              // if (success == true) widget.next();
                            }, // => showInSnackBar("Facebook button pressed"),
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromRGBO(231, 236, 243, 1),
                                  )),
                              child: const Icon(
                                FontAwesomeIcons.apple,
                                color: Color.fromARGB(255, 46, 50, 54),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  //     ],
                  //   ),
                  //   fallbackBuilder: (context) => Container(),
                  // ),
                  Platform.isAndroid
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 0),
                          child: GestureDetector(
                            onTap: () async {
                              // success = await loginPageModel.googleSignIn();
                              // if (success == true) widget.next();
                            }, // => showInSnackBar("Google button pressed"),
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromRGBO(231, 236, 243, 1),
                                  )),
                              child: const Icon(
                                FontAwesomeIcons.google,
                                color: Color(0xFF0084ff),
                              ),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 58,
              width: 188,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xff132137),
              ),
              child: InkWell(
                // key: const ValueKey('Sign Up button'),
                onTap: () {
                  if (email2.text.isNotEmpty && password.text.isNotEmpty) {
                    // Utils.showLoading();
                    // AuthService authService = Get.put(AuthService());

                    // var res = await authService.login(
                    //     baseUrl, email.text, password.text);
                    // Utils.closeLoading();
                    // if (true) {
                    //   print("loggedin");
                    Utils.toast("Login Successful");
                    Get.to(() => NavigationWrapper());
                    // context.nextAndRemoveUntilPage(AuthWrapper());
                    // authService
                    //     .getToken(authService.userData.value.token);
                    // } else if (res == "fatal") {
                    //   Utils.toast("Fatal Error");
                    // } else {
                    //   Utils.toast("Credentials are not valid");
                    // }
                  } else {
                    Utils.toast("Please fill all the fields");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      // Icon(Icons.arrow_forward_rounded,
                      //     color: Colors.white),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    // final viewModel = ref.watch(LogInPageViewModel.provider);

    return Form(
        // key: viewModel.signInFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          padding: const EdgeInsets.only(top: 23.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 300.0,
                // height: 190.0,
                child: Column(
                  children: <Widget>[
                    CustomTextField(
                      hint: "Email ID",
                      icon: const Icon(Icons.email),
                      obsecure: false,
                      autofocus: false,
                      validator: (value) {
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = RegExp(pattern as String);

                        if ((value != null && value.trim().isEmpty) ||
                            value == null) {
                          return "Please enter your email";
                        } else if (!regex.hasMatch(value.trim())) {
                          return "Enter valid email address";
                        }

                        return null;
                      },
                      textController: email2,
                    ),

                    //SPACE
                    Container(
                      height: 12.0,
                    ),

                    //Password
                    CustomTextField(
                      hint: "Password",
                      icon: const Icon(Icons.lock),
                      obsecure: true,
                      autofocus: false,
                      validator: (value) {
                        if (value != null && value.trim().isEmpty) {
                          return "Password must not be blank";
                        } else if (value.trim().length < 8) {
                          return "Password must be longer than 7 characters";
                        }

                        return null;
                      },
                      textController: password,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildSignUp(BuildContext context) {
    return Form(
        // key: viewModel.signUpFormKey,
        child: Container(
      padding: const EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 300.0,
            // height: 300.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CustomTextField(
                  hint: "Name",
                  icon: const Icon(Icons.people),
                  obsecure: false,
                  autofocus: false,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Please enter your name";
                    } else if (value.length < 3) {
                      return "Name must be longer than 2 characters";
                    }

                    return null;
                  },
                  textController: name,
                ),

                //SPACE
                Container(
                  height: 12.0,
                ),

                //Email ID
                CustomTextField(
                  hint: "Email ID",
                  icon: const Icon(Icons.email),
                  obsecure: false,
                  autofocus: false,
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern as String);

                    if (value != null && value.isEmpty) {
                      return "Please enter your email ID";
                    } else if (!regex.hasMatch(value ?? '')) {
                      return "Enter valid email ID";
                    }

                    return null;
                  },
                  textController: email2,
                ),

                //SPACE
                Container(
                  height: 12.0,
                ),

                //Password
                CustomTextField(
                  hint: "Password",
                  icon: const Icon(Icons.lock),
                  obsecure: true,
                  autofocus: false,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Password can't be blank";
                    } else if (value.length < 8) {
                      return "Password must be longer than 7 characters";
                    }

                    return null;
                  },
                  textController: password,
                ),

                //SPACE

                //Register Button
                // Container(
                //   width: double.infinity,
                //   child: AppPrimaryButton(
                //     onPressed: () async {
                //       if (!hasClicked) {
                //         setState(() {
                //           hasClicked = true;
                //         });
                //       }

                //       if (_formKey.currentState!.validate()) {
                //         final _authService = locator<AuthService>();
                //         User? user = await _authService.emailRegister(
                //             fullNameTEC.text,
                //             emailIDTEC.text,
                //             passwordTEC.text);
                //         if (user != null) {
                //           // await FirebaseDataDao.b2bSection.getCompanyDetails();
                //           final _dialogManager = locator<DialogManager>();
                //           _dialogManager.showSnackBar(
                //               "Registration succesfull!",
                //               "Welcome ${user.email}");

                //           Navigator.of(context).pop();
                //           Navigator.of(context).pushReplacement(
                //               new MaterialPageRoute(
                //                   builder: (BuildContext context) =>
                //                       LoginPageMain(),
                //                   settings: RouteSettings(
                //                       name: ScreenNames.loginPageMain)));
                //         } else {
                //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //               content: Text("You already have a account!")));
                //         }
                //       }
                //     },
                //     text: "Continue",
                //   ),
                // ),
                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                //   child: TextField(
                //     focusNode: myFocusNodeName,
                //     controller: signupNameController,
                //     keyboardType: TextInputType.text,
                //     textCapitalization: TextCapitalization.words,
                //     style: TextStyle(
                //         fontFamily: "WorkSansSemiBold",
                //         fontSize: 16.0,
                //         color: Colors.black),
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       icon: Icon(
                //         FontAwesomeIcons.user,
                //         color: Colors.black,
                //       ),
                //       hintText: "Name",
                //       hintStyle: TextStyle(
                //           fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                //   child: TextField(
                //     focusNode: myFocusNodeEmail,
                //     controller: signupEmailController,
                //     keyboardType: TextInputType.emailAddress,
                //     style: TextStyle(
                //         fontFamily: "WorkSansSemiBold",
                //         fontSize: 16.0,
                //         color: Colors.black),
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       icon: Icon(
                //         FontAwesomeIcons.envelope,
                //         color: Colors.black,
                //       ),
                //       hintText: "Email Address",
                //       hintStyle: TextStyle(
                //           fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                //   child: TextField(
                //     focusNode: myFocusNodePassword,
                //     controller: signupPasswordController,
                //     obscureText: _obscureTextSignup,
                //     style: TextStyle(
                //         fontFamily: "WorkSansSemiBold",
                //         fontSize: 16.0,
                //         color: Colors.black),
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       icon: Icon(
                //         FontAwesomeIcons.lock,
                //         color: Colors.black,
                //       ),
                //       hintText: "Password",
                //       hintStyle: TextStyle(
                //           fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                //       suffixIcon: GestureDetector(
                //         onTap: _toggleSignup,
                //         child: Icon(
                //           _obscureTextSignup
                //               ? FontAwesomeIcons.eye
                //               : FontAwesomeIcons.eyeSlash,
                //           size: 15.0,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.only(
                //       top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
                //   child: TextField(
                //     controller: signupConfirmPasswordController,
                //     obscureText: _obscureTextSignupConfirm,
                //     style: TextStyle(
                //         fontFamily: "WorkSansSemiBold",
                //         fontSize: 16.0,
                //         color: Colors.black),
                //     decoration: InputDecoration(
                //       border: InputBorder.none,
                //       icon: Icon(
                //         FontAwesomeIcons.lock,
                //         color: Colors.black,
                //       ),
                //       hintText: "Confirmation",
                //       hintStyle: TextStyle(
                //           fontFamily: "WorkSansSemiBold", fontSize: 16.0),
                //       suffixIcon: GestureDetector(
                //         onTap: _toggleSignupConfirm,
                //         child: Icon(
                //           _obscureTextSignupConfirm
                //               ? FontAwesomeIcons.eye
                //               : FontAwesomeIcons.eyeSlash,
                //           size: 15.0,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
