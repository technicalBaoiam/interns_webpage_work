import 'package:BOAIAM/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class AboutUS extends StatelessWidget {
  const AboutUS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xff37d5d6), Color(0xff36096d)]),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(DashboardPage());
          },
          icon: const Icon(
            Icons.navigate_before,
            size: 42,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "About Us",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
      ),
      body: Container(
        // color: Colors.grey.shade200,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                height: 150,
                width: 250,
                child: Image.asset(
                  'assets/logo.png',
                  scale: 1,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 16, right: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Baoiam application is a platform to full for your academic as well as professional needs ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Text(
                    "Baoiam app allow you for the live interactive classes,doubt sessions,access free study material, mock test and assessments and much more.",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                " Follows  us on",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: _fbURL,
                    icon: Image.asset(
                      'assets/fb1.png',
                      scale: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: _instaURL,
                    icon: Image.asset(
                      'assets/insta1.png',
                      scale: 1,
                    ),
                  ),
                  IconButton(
                    onPressed: _twitterURL,
                    icon: Image.asset(
                      'assets/twitter.png',
                      scale: 1,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

_fbURL() async {
  const url =
      'https://www.facebook.com/people/%F0%9D%98%BD%F0%9D%98%BC%F0%9D%99%8A-%F0%9D%99%84%F0%9D%98%BC%F0%9D%99%88-%F0%9D%98%89%F0%9D%98%A6-%F0%9D%98%88-%F0%9D%98%96%F0%9D%98%AF%F0%9D%98%A6-%F0%9D%98%90%F0%9D%98%AF-%F0%9D%98%88-%F0%9D%98%94%F0%9D%98%AA%F0%9D%98%AD%F0%9D%98%AD%F0%9D%98%AA%F0%9D%98%B0%F0%9D%98%AF/100064896061625/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instaURL() async {
  const url = 'https://instagram.com/beaoneinamillion?utm_medium=copy_link';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_twitterURL() async {
  const url = 'https://twitter.com/BAOIAM1';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
