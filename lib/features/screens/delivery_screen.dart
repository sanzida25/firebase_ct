import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ct/features/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({super.key});

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();

}
class _DeliveryScreenState extends State<DeliveryScreen> {
//for registering data to firebase from textfield
//   final _fromController = TextEditingController();
//   final _toController = TextEditingController();
//   final _seatController = TextEditingController();
//   final _timeController = TextEditingController();
//   final _dateController = TextEditingController();

  @override
  void dispose(){
    textFieldController6.dispose();
    textFieldController7.dispose();
    //textFieldController8.dispose();
    textFieldController9.dispose();
    textFieldController10.dispose();
    // _dateController.dispose();
    super.dispose();
  }

  Future confirm() async{
    addDetails1(
      textFieldController6.text.trim(),
      textFieldController7.text.trim(),
      //int.parse(textFieldController2.text.trim()),
      //textFieldController8.text.trim() ,
      textFieldController9.text.trim(),
      textFieldController10.text.trim(),
    );
  }

  Future addDetails1(
      String from, String to, String time,String date) async{
    await FirebaseFirestore.instance.collection('DeliveryClient').add({
      'From': from,
      'To': to,
      //'Seats': seats,
      'Time': time,
      'Date': date,
    });
    print("Confirmed successfully");
  }

// for textfield information
  final textFieldController6 = TextEditingController();
  final textFieldController7 = TextEditingController();
  //final textFieldController8 = TextEditingController();
  final textFieldController9 = TextEditingController();
  final textFieldController10 = TextEditingController();

  // List<String> items6 = [
  //   "Dhanmondi",
  //   "Gulshan",
  //   "Uttara",
  //   "Bashundhara",
  //   "Wari"
  // ];
  // List<String> items7 = [
  //   "Dhanmondi",
  //   "Gulshan",
  //   "Uttara",
  //   "Bashundhara",
  //   "Wari"
  // ];
  // List<String> items8 = [
  //   "1",
  //   "2",
  //   "3",
  //   "4",
  //   "5"
  // ];
  List<String> items9 = [
    "7am",
    "9am",
    "11am",
    "1pm",
    "3pm",
    "5pm",
    "7pm",
    "9pm",
    "11pm",
  ];
  List<String> items10 = [
    "3 November 2023",
    "4 November 2023",
    "5 November 2023",
  ];

  bool displayfromitem6 = false;
  bool displayfromitems7 = false;
  //bool displayfromitems8 = false;
  bool displayfromitems9 = false;
  bool displayfromitems10 = false;

  void selectItem(String item) {
    setState(() {
      textFieldController6.text = item;
    });
  }
  void selectItem1(String item) {
    setState(() {
      textFieldController7.text = item;
    });
  }
  // void selectItem2(String item) {
  //   setState(() {
  //     textFieldController8.text = item;
  //   });
  // }
  void selectItem3(String item) {
    setState(() {
      textFieldController9.text = item;
    });
  }
  void selectItem4(String item) {
    setState(() {
      textFieldController10.text = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("NSU Shuttle"),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 180,
              // width: MediaQuery.of(context).size.width,
              // decoration: const BoxDecoration(
              //   borderRadius: BorderRadius.only(
              //     bottomLeft: Radius.circular(150),
              //     bottomRight: Radius.circular(10),
              //   ),
              //   gradient: LinearGradient(
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //     colors: [Color.fromARGB(255, 68, 66, 72),
              //       Color.fromARGB(255, 48, 45, 56),
              //       Color.fromARGB(255, 36, 30, 40),
              //       Color.fromARGB(255, 12, 1, 1),],
              //   ),
              // )  ,
              child: Column(
                children: [
                  // Positioned(
                  //   top: 50,
                  //   left: 10,
                  //   right: 10,
                   // child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //to go to back page
                            //Navigator.pop(context);
                            IconButton(
                              onPressed:() {
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>const HomeScreen(),
                                ),
                                );
                              },
                              icon: const Padding(
                                padding: EdgeInsets.only(top:20, right: 20),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size:30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top:20, right: 20),
                              child: Icon(
                                Icons.person,
                                size: 40,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          child: Padding(padding: EdgeInsets.only(top: 20,left: 20),
                            child: Text(
                              "Hello there!",
                              style: GoogleFonts.poppins(
                                textStyle: Theme.of(context).textTheme.headline2,
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                //fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 1,left: 50),
                          child: Text(
                            "Where do you want to deliver?",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline3,
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              //fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                 // ),
                ],
              ),
            ),

            Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 18,),
                    Icon(
                      Icons.location_pin,
                      color: Colors.black38,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'FROM ',
                      style: GoogleFonts.poppins(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],

                ),
                //SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child:
                    TextField(
                      controller: textFieldController6,
                      decoration:
                      InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Enter your location',
                        hintText: 'Pickup Location',
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //dropoff
            SizedBox(height: 0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 18,),
                    Icon(
                      Icons.location_pin,
                      color: Colors.black38,
                    ),
                    SizedBox(width:   10,),
                    Text(
                      'TO ',
                      style: GoogleFonts.poppins(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      controller: textFieldController7,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Enter your destination',
                        hintText: 'Dropoff Location',
                        ),
                      ),
                    ),
                  ),
                ],
            ),
            //time
            SizedBox(height: 0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 18,),
                    Icon(
                      Icons.schedule,
                      color: Colors.black38,
                    ),
                    SizedBox(width:   10,),
                    Text(
                      'TIME',
                      style: GoogleFonts.poppins(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      controller: textFieldController9,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Time',
                        hintText: 'Time',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              displayfromitems9 = !displayfromitems9;
                            });
                          },
                          child: Icon(Icons.arrow_downward),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            displayfromitems9
                ? Container(
              height: 150,
              width: 130,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ]
              ),
              child: ListView.builder(
                itemCount: items9.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items9[index]),
                    onTap: () {
                      selectItem3(items9[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),

            //date
            SizedBox(height: 0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 18,),
                    Icon(
                      Icons.calendar_month,
                      color: Colors.black38,
                    ),
                    SizedBox(width:   10,),
                    Text(
                      'Date',
                      style: GoogleFonts.poppins(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],

                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      controller: textFieldController10,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Date',
                        hintText: 'Date',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              displayfromitems10 = !displayfromitems10;
                            });
                          },
                          child: Icon(Icons.arrow_downward),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            displayfromitems10
                ? Container(
              height: 150,
              width: 130,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ]
              ),
              child: ListView.builder(
                itemCount: items10.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items10[index]),
                    onTap: () {
                      selectItem4(items10[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),


            SizedBox(height: 0,),
            Padding(padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: confirm,
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 52, 222),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Center(
                    child: Text('CONFIRM',
                      style: GoogleFonts.poppins(
                        //textStyle: Theme.of(context).textTheme.headlineSmall,
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        //fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}


