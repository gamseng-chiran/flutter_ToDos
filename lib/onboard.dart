import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do/constant.dart';
import 'package:to_do/list.dart';
import 'package:to_do/main.dart';
import 'package:to_do/onboardmodel.dart';


class OnBoard extends StatefulWidget {
  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      text: "Welcome",
      button: Color(0xFF4756DF)
    ),
    OnboardModel(
      text: "Keep your note",
      button: Color(0xFF4756DF)
    ),
    OnboardModel(
      text: "Easy and handy",
      button: Color(0xFF4756DF)
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    print("Shared pref called");
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoard', isViewed);
    print(prefs.getInt('onBoard'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        backgroundColor: kwhite,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Stack(
                children: [
                  Container(
                    child: Center(
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            screens[index].text,
                            style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
            onPressed: () {
                    _storeOnboardInfo();
                    Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => MyHomePage()));
            },
            child: Text(
                    "Skip",
                    style: TextStyle(
                      color: kgreen,
                    ),
            ),
          ),

          InkWell(
                            onTap: () async {
                              print(index);
                              if (index == screens.length - 1) {
                                await _storeOnboardInfo();
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()));
                              }

                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              );
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
                              decoration: BoxDecoration(
                                  color: kgreen,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Row(mainAxisSize: MainAxisSize.min, children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kwhite),
                                ),
                                SizedBox(
                                  width: 15.0,
                                ),
                                Icon(
                                  Icons.arrow_forward_sharp,
                                  color: kwhite,
                                )
                              ]),
                            ),
                          )
                            ],
                            ),
                    
                  )
                ],
              );
            }),
      ),
    );
  }
}