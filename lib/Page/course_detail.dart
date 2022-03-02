import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dashboard.dart';

class course extends StatefulWidget {
  const course({Key? key}) : super(key: key);

  @override
  State<course> createState() => _courseState();
}

class _courseState extends State<course> {
  TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  String dropdownvalue = '1';
  String dropdownvalue1 = 'PCM';
  String dropdownvalue2 = 'JEE';

  var items1 = ['PCM', 'PCMB', 'COMMERCE'];
  var items2 = ['JEE', 'NEET', 'CAT'];

  var items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    'other'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xff37d5d6), Color(0xff36096d)]),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 50),
                child: Container(
                  child: const Text(
                    "Help Us Personalize Your Learning Experience",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    margin: const EdgeInsets.only(
                        top: 30.0, left: 50, bottom: 5, right: 30),
                    child: const Text(
                      "Enter Your Name ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 50, bottom: 10, right: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: const TextField(
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(left: 10),
                        hintText: 'Name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 5),
                    margin: const EdgeInsets.only(
                        top: 10.0, left: 50, bottom: 5, right: 30),
                    child: const Text(
                      "Date Of Birth ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(
                        top: 5.0, left: 50, bottom: 20, right: 30),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ]),
                    child: TextField(
                      controller:
                          dateinput, //editing controller of this TextField
                      decoration: const InputDecoration(
                          suffix:
                              Icon(Icons.calendar_today), //icon of text field
                          hintText: " 2021-1-12-07",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold)),

                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            dateinput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 50, bottom: 5, right: 30),
                        child: const Text(
                          "Select Your Grade ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(
                            left: 50, top: 5.0, bottom: 20, right: 150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          isExpanded: true, // Initial Value
                          value: dropdownvalue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 50, bottom: 5, right: 30),
                        child: const Text(
                          "Select Your Stream ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(
                            left: 50, top: 5.0, bottom: 20, right: 150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          isExpanded: true, // Initial Value
                          value: dropdownvalue1,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items1.map((String items1) {
                            return DropdownMenuItem(
                              value: items1,
                              child: Text(items1),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue1 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.only(
                            top: 10.0, left: 50, bottom: 5, right: 30),
                        child: const Text(
                          "Select Your Target Exam ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 17),
                        ),
                      ),
                      Container(
                        width: 150,
                        padding: const EdgeInsets.only(left: 10),
                        margin: const EdgeInsets.only(
                            left: 50, top: 5.0, bottom: 20, right: 150),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          isExpanded: true, // Initial Value
                          value: dropdownvalue2,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: items2.map((String items2) {
                            return DropdownMenuItem(
                              value: items2,
                              child: Text(items2),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue2 = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(25),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DashboardPage()));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff37d5d6),
                          Color(0xff36096d).withOpacity(0.5)
                        ]),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 150,
                      height: 60,
                      alignment: Alignment.center,
                      child: const Text(
                        "START LEARNING",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
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
