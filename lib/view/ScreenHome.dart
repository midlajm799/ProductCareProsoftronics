import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/view/drawer/AboutUs.dart';
import 'package:hardware_pro/view/drawer/Account.dart';
import 'package:hardware_pro/view/complaint/screen_reg_complaints.dart';
import 'package:hardware_pro/view/notifications.dart';
import 'package:hardware_pro/view/shop/screen_shop.dart';
import 'package:hardware_pro/view/warrenty/screen_RegisterWarranty.dart';
import 'package:hardware_pro/view/warrenty/splashScreen.dart';
import 'package:hardware_pro/view/warrenty/viewRegisterdWarrenty.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _ScreenShopRegState();
}

class _ScreenShopRegState extends State<MainPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final hieght = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 250, 246, 246),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 240, top: 30),
            //   child: IconButton(
            //       onPressed: () {}, icon: const Icon(Icons.arrow_back_ios)),
            // ),
            SizedBox(
              height: 50,
              width: 250,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 234, 230, 230),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const ScreenAccount();
                      },
                    ));
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.person_crop_circle_fill,
                          color: Color.fromARGB(255, 80, 80, 80),
                        ),
                        Text(
                          "Account",
                          style: TextStyle(
                              color: Color.fromARGB(255, 53, 52, 52),
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: 250,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 234, 230, 230),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const ScreenAboutUs();
                    },
                  ));
                },
                child: const Text(
                  "About us",
                  style: TextStyle(
                      color: Color.fromARGB(255, 53, 52, 52),
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            // ignore: prefer_const_constructors
            Expanded(
              child: const SizedBox(
                height: 15,
              ),
            ),
            SizedBox(
                height: 50,
                width: 250,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: const Color.fromARGB(255, 182, 12, 0)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            title: const Center(child: Text("Signout..?")),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(color: Colors.red),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    auth.signOutFromMAil(context);
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.green),
                                  ))
                            ],
                          );
                        },
                      );
                    },
                    child: const Text(
                      "LOGOUT",
                      style: TextStyle(color: Colors.white),
                    ))),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenNotification();
                  },
                ));
              },
              icon: const Icon(
                CupertinoIcons.bell,
                size: 30,
                color: Color.fromARGB(255, 0, 0, 0),
              ))
        ],
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 100),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenShop();
                  },
                ));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 194, 13, 0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: width * .8,
                height: hieght * .13,
                child: const Padding(
                  padding: EdgeInsets.only(top: 10,left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Shop",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        CupertinoIcons.cart,
                        color: Colors.white,
                        size: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ViewRegisterdWarrenty();
                  },
                ));
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 157, 9),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: width * .8,
                height: hieght * .13,
                child: const Padding(
                  padding: EdgeInsets.only(right: 119, top: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Register Warranty",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 140),
                        child: Icon(
                          Icons.app_registration_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const ScreenRegComplaints();
                  },
                ));
              },
              child: Container(
                width: width * .8,
                height: hieght * .13,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 43, 50, 88),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: const Padding(
                  padding: EdgeInsets.only(left: 10, right: 90, top: 10),
                  child: Column(
                    children: [
                      Text(
                        "Register Complaints",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5, right: 150),
                        child: Icon(
                          Icons.sms_failed_outlined,
                          color: Colors.white,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
