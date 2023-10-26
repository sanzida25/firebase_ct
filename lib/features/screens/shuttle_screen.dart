import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ct/features/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class ShuttleScreen extends StatefulWidget {
  const ShuttleScreen({super.key});

  @override
  State<ShuttleScreen> createState() => _ShuttleScreenState();

}
class _ShuttleScreenState extends State<ShuttleScreen> {
//for registering data to firebase from textfield

  @override
  void dispose(){
    textFieldController.dispose();
    textFieldController1.dispose();
    textFieldController2.dispose();
    textFieldController3.dispose();
    textFieldController4.dispose();
    super.dispose();
  }

  Future book() async{
    addDetails(
      textFieldController.text.trim(),
      textFieldController1.text.trim(),
      textFieldController2.text.trim() ,
      textFieldController3.text.trim(),
      textFieldController4.text.trim(),
    );
  }

  Future addDetails(
      String from, String to, String seats, String time,String date) async{
    await FirebaseFirestore.instance.collection('Client').add({
      'From': from,
      'To': to,
      'Seats': seats,
      'Time': time,
      'Date': date,
    });
    print("Booked succesfully");
  }

// for textfield information
  final textFieldController = TextEditingController();
  final textFieldController1 = TextEditingController();
  final textFieldController2 = TextEditingController();
  final textFieldController3 = TextEditingController();
  final textFieldController4 = TextEditingController();

  List<String> items = [
    "Dhanmondi",
    "Gulshan",
    "Uttara",
    "Bashundhara",
    "Wari"
  ];
  List<String> items1 = [
    "Dhanmondi",
    "Gulshan",
    "Uttara",
    "Bashundhara",
    "Wari"
  ];
  List<String> items3 = [
    "1",
    "2",
    "3",
    "4",
    "5"
  ];
  List<String> items4 = [
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
  List<String> items5 = [
    "3 November 2023",
    "4 November 2023",
    "5 November 2023",
  ];

  bool displayfromitems = false;
  bool displayfromitems1 = false;
  bool displayfromitems2 = false;
  bool displayfromitems3 = false;
  bool displayfromitems4 = false;

  void selectItem(String item) {
    setState(() {
      textFieldController.text = item;
    });
  }
  void selectItem1(String item) {
    setState(() {
      textFieldController1.text = item;
    });
  }
  void selectItem2(String item) {
    setState(() {
      textFieldController2.text = item;
    });
  }
  void selectItem3(String item) {
    setState(() {
      textFieldController3.text = item;
    });
  }
  void selectItem4(String item) {
    setState(() {
      textFieldController4.text = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
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
                              "Welcome aboard!",
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
                            "Where do you want to go?",
                            style: GoogleFonts.poppins(
                              textStyle: Theme.of(context).textTheme.headline3,
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  //),
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
                      controller: textFieldController,
                      decoration:
                      InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Enter your location',
                        hintText: 'Pickup Location',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              displayfromitems = !displayfromitems;
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
            displayfromitems
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index]),
                    onTap: () {
                      selectItem(items[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),

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
                      controller: textFieldController1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Enter your destination',
                        hintText: 'Dropoff Location',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              displayfromitems1 = !displayfromitems1;
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
            displayfromitems1
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
                itemCount: items1.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items1[index]),
                    onTap: () {
                      selectItem1(items1[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),

            //seats

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
                      Icons.event_seat,
                      color: Colors.black38,
                    ),
                    SizedBox(width:   10,),
                    Text(
                      'SEATS',
                      style: GoogleFonts.poppins(
                        textStyle:
                        Theme.of(context).textTheme.headlineSmall,
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
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
                      controller: textFieldController2,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(width: 3, color: Colors.deepPurpleAccent), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        labelText: 'Number of seats',
                        hintText: 'Seats',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              displayfromitems2 = !displayfromitems2;
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
            displayfromitems2
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
                itemCount: items3.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items3[index]),
                    onTap: () {
                      selectItem2(items3[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),

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
                      controller: textFieldController3,
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
                              displayfromitems3 = !displayfromitems3;
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

            displayfromitems3
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
                itemCount: items4.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items4[index]),
                    onTap: () {
                      selectItem3(items4[index]);
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
                      controller: textFieldController4,
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
                              displayfromitems4 = !displayfromitems4;
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

            displayfromitems4
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
                itemCount: items5.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items5[index]),
                    onTap: () {
                      selectItem4(items5[index]);
                    },
                  );
                },
              ),
            ):
            SizedBox(),


            SizedBox(height: 0,),
            Padding(padding: const EdgeInsets.only(top: 10),
              child: GestureDetector(
                onTap: book,
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 52, 222),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child:  Center(
                    child:
                    Text('BOOK',
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


