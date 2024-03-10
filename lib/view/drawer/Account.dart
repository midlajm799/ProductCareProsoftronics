import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/view/drawer/Address.dart';
import 'package:hardware_pro/view/drawer/order_history.dart';
import 'package:hardware_pro/view/drawer/profile.dart';

class ScreenAccount extends StatelessWidget {
  const ScreenAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 235, 232, 232),
                ),
                color: const Color.fromARGB(255, 244, 241, 241),
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            width: 450,
            height: 150,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    )),
                const Text(
                  "Account",
                  style: TextStyle(
                      color: Color.fromARGB(255, 76, 83, 126),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return const ScreenProfile();
                    },
                  ));
                },
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 86, 83, 83),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100, top: 10),
                        child: Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, right: 60),
                        child: Text(
                          "Profile",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScreenAddress();
                    },
                  ));
                },
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 91, 94, 110),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100, top: 10),
                        child: Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 50, top: 25),
                        child: Text(
                          "Address",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return OrderHistory();
                    },
                  ));
                },
                child: Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 76, 76, 56),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 100, top: 10),
                        child: Icon(
                          Icons.history,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 25, right: 60),
                        child: Text(
                          "Orders",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) {
              //         return ScreenAddress();
              //       },
              //     ));
              //   },
              //   child: Container(
              //     width: 150,
              //     height: 100,
              //     decoration: BoxDecoration(
              //         color: const Color.fromARGB(255, 91, 94, 110),
              //         borderRadius: BorderRadius.circular(20)),
              //     child: const Column(
              //       children: [
              //         Padding(
              //           padding: EdgeInsets.only(left: 100, top: 10),
              //           child: Icon(
              //             CupertinoIcons.location_solid,
              //             color: Colors.white,
              //             size: 35,
              //           ),
              //         ),
              //         Padding(
              //           padding: EdgeInsets.only(right: 50, top: 25),
              //           child: Text(
              //             "Address",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w500),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      )),
    );
  }
}
