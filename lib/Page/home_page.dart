import 'dart:io';
import 'package:BOAIAM/modals/onboarding_model.dart';
import 'login.dart';
import 'package:flutter/material.dart';
import 'onboarding_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<OnboardingModel> onboardingPages;
  int pageIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  GestureDetector pageIndexIndicator(int page, bool isCurrPage) {
    return GestureDetector(
      onTap: () {
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: isCurrPage ? 6 : 6,
        width: isCurrPage ? 15 : 6,
        decoration: BoxDecoration(
          color: isCurrPage ? Colors.grey : Colors.grey[300],
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    onboardingPages = getOnboardingPages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                pageController.animateToPage(onboardingPages.length - 1,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.easeInOut);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: PageView.builder(
          itemCount: onboardingPages.length,
          controller: pageController,
          onPageChanged: (val) {
            setState(() {
              pageIndex = val;
            });
          },
          itemBuilder: (context, index) => OnboardingPage(
            image: onboardingPages[index].image,
            desc: onboardingPages[index].desc,
          ),
        ),
      ),
      bottomSheet: pageIndex != onboardingPages.length - 1
          ? Container(
              height: 120,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < onboardingPages.length; i++)
                        pageIndexIndicator(i, pageIndex == i),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      pageController.animateToPage(pageIndex + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: Container(
                      height: Platform.isIOS ? 70 : 60,
                      margin: EdgeInsets.fromLTRB(18, 0, 18, 25),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Color(0xff824890),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      // child: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     GestureDetector(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           pageController.animateToPage(onboardingPages.length - 1,
                      //               duration: Duration(milliseconds: 1000),
                      //               curve: Curves.easeInOut);
                      //         },
                      //         child: Text(
                      //           'SKIP',
                      //           style: TextStyle(fontSize: 16),
                      //         ),
                      //       ),
                      //     ),
                      //     Row(
                      //       children: [
                      //         for (int i = 0; i < onboardingPages.length; i++)
                      //           pageIndexIndicator(i, pageIndex == i),
                      //       ],
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         pageController.animateToPage(pageIndex + 1,
                      //             duration: Duration(milliseconds: 500),
                      //             curve: Curves.easeInOut);
                      //       },
                      //       child: Text(
                      //         "NEXT",
                      //         style: TextStyle(fontSize: 16),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                ],
              ),
            )
          : GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: Container(
                height: Platform.isIOS ? 70 : 60,
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                  color: Color(0xff824890),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
