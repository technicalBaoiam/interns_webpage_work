import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image, desc;
  const OnboardingPage({Key? key, required this.image, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/$image.png',
          ),
          SizedBox(height: 20),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 23,
            ),
          ),
        ],
      ),
    );
  }
}
