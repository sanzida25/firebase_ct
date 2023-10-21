import 'package:firebase_ct/features/screens/delivery_screen.dart';
import 'package:firebase_ct/features/screens/shuttle_screen.dart';
import 'package:flutter/material.dart';


import 'package:firebase_ct/dropDown.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //bool rememberMe = false;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              // const Image(
              //   image: AssetImage(
              //       "assets/buslogo.png"
              //   ),
              //   height: 170,
              //   width: 170,
              //   alignment: Alignment.bottomCenter,
              // ),
              // TextButton(
              //   onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen(),
              //     ),
              //     );
              //   },
              //   style: ButtonStyle(
              //       foregroundColor: MaterialStateProperty.all(Colors.purple[900])
              //   ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShuttleScreen(),
                ),
                );
              },
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 51, 222),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child:  Text(
                      'Shuttle',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              //   child: const Text(
              //       'Shuttle',
              //       style: TextStyle(fontSize: 20)
              //   ),
              // ),
              // TextButton(
              //   onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryScreen(),
              //     ),
              //     );
              //   },
              //   style: ButtonStyle(
              //       foregroundColor: MaterialStateProperty.all(Colors.purple[900])
              //   ),
              //   child: const Text(
              //       'Delivery Service',
              //       style: TextStyle(fontSize: 20)
              //   ),
              // ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DeliveryScreen(),
                ),
                );
              },
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 108, 51, 222),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child:  Text(
                      'Delivery Service',
                      style: TextStyle(
                        color: Colors.white,
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




