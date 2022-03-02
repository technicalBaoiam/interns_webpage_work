import 'package:BOAIAM/Page/setting_page.dart';
import 'package:flutter/material.dart';
import 'About_Us.dart';
import 'Help_widget.dart';
import 'customer_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:BOAIAM/provider/theme_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final text = Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
        ? 'DarkTheme'
        : 'LightTheme';
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xff37d5d6), Color(0xff36096d)]),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_cart_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person)),
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Text(" Settings"),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Text(" About Us"),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Text(" Help "),
                )
              ],
              onSelected: (item) => SelectedItem(context, item),
            )
          ],
        ),
        drawer: Container(
          child: Drawer(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: ListView(
                children: [
                  const DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xff37d5d6), Color(0xff36096d)])),
                      child: Icon(Icons.android_outlined)),
                  const ListTile(
                    leading: Icon(Icons.tag_faces),
                    title: Text("Extra Curricular Activity"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.image_search),
                    title: Text("Traking Report"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.lightbulb_outline_rounded),
                    title: Text("Querty/Doubt Session"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.assignment_returned_rounded),
                    title: Text("My download"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.group),
                    title: Text("Scholarships"),
                  ),
                  const ListTile(
                    leading: Icon(Icons.emoji_events_sharp),
                    title: Text("Events"),
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text("Customer Support"),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Customer()));
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(18),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                  ),
                  items: [1, 2, 3].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/add$i.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff0F66B7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Book a Demo Session",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff0F66B7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Professional Courses",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff0F66B7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "7 Days Free Trial",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color(0xff0F66B7),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Internship Training",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  "Upcomming Live Classes",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/live_class.png"),
                      fit: BoxFit.fill,
                    ),
                    gradient: LinearGradient(
                      colors: const [
                        Color(0xff28124C),
                        Color(0xff1FA5F1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "New Courses",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/courses.png"),
                      fit: BoxFit.fill,
                    ),
                    gradient: LinearGradient(
                      colors: const [
                        Color(0xff28124C),
                        Color(0xff1FA5F1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SelectedItem(BuildContext context, item) {
    switch (item) {
      case 0:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Setting()));
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutUS()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Help()));
        break;
    }
  }
}
