import 'package:BOAIAM/provider/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_service.dart';
import 'dashboard.dart';

class Help extends StatefulWidget {
  const Help({Key? key}) : super(key: key);

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final _formKey = GlobalKey<FormState>();

  var queryData = " ";
  var mobileNo = " ";
  var email = " ";
  final _firestore = FirebaseFirestore.instance;
  final queryDataController = TextEditingController();
  final numberController = TextEditingController();
  final emailController = TextEditingController();

  CollectionReference HelpData =
      FirebaseFirestore.instance.collection('helpData');
  Future<void> addUser() {
    return HelpData.add({
      'QueryEntered': queryData,
      'Mobile No.': mobileNo,
      'email': email,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("failed to add user:$error"));
  }

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
            size: 34,
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "HELP",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Theme.of(context).primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BuildEmail(emailController: emailController),
              buildphone(),
              query(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(25),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          queryData = queryDataController.text;
                          mobileNo = numberController.text;
                          email = emailController.text;

                          addUser();
                        });
                      }
                      const snackBar = SnackBar(
                        content: Text('Message Send Successfully'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Customer()));
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff37d5d6),
                            Color(0xff36096d).withOpacity(0.5)
                          ]),
                          borderRadius: BorderRadius.circular(20)),
                      child: Container(
                        width: 100,
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          "SEND",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildEmail extends StatelessWidget {
  final TextEditingController emailController;
  const BuildEmail({Key? key, required this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, top: 15),
          child: const Text(
            " Enter Email",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          height: 60,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Color(0xffebefff),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                )
              ]),
          child: TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please Enter email';
              } else if (!value.contains('@')) {
                return 'Please enter a valid email';
              }

              return null;
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff4c5166),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.black38)),
          ),
        ),
      ],
    );
  }
}

Widget buildphone() {
  final numberController = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15, top: 15),
        child: const Text(
          " Enter Phone No.",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 60,
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ]),
        child: TextFormField(
          controller: numberController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Number';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.phone,
                color: Color(0xff4c5166),
              ),
              hintText: 'Phone ',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      ),
    ],
  );
}

Widget query() {
  final queryDataController = TextEditingController();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15, top: 15),
        child: const Text(
          " Enter Your Query",
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Container(
        height: 60,
        margin: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Color(0xffebefff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ]),
        child: TextFormField(
          controller: queryDataController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Query';
            }
            return null;
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.question_answer,
                color: Color(0xff4c5166),
              ),
              hintText: 'query ',
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      ),
    ],
  );
}
