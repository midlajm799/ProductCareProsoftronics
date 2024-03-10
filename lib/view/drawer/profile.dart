import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child:
              Consumer<FirestoreDatabase>(builder: (context, instence, child) {
            return FutureBuilder(
                future: instence
                    .fetchUserData(FirebaseAuth.instance.currentUser!.uid),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return showIndicator();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 235, 232, 232),
                            ),
                            color: const Color.fromARGB(255, 244, 241, 241),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(40))),
                        width: 450,
                        height: 150,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                )),
                            const Text(
                              "Back",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 78, 78, 80),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Your",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w400),
                      ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 72, 91, 126),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Padding(
                                  padding: EdgeInsets.only(top: 50, right: 200),
                                  child: Icon(
                                    CupertinoIcons.person_crop_circle_fill,
                                    size: 80,
                                  ),
                                )),
                            const Padding(
                              padding: EdgeInsets.only(top: 70, left: 55),
                              child: Icon(
                                Icons.add,
                                color: Colors.grey,
                                size: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          Text(instence.userModel!.userName,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(instence.userModel!.email,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 65, 62, 62),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("User Id:${instence.userModel!.uid}",
                              style: const TextStyle(
                                color: Color.fromARGB(255, 65, 62, 62),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit),
                              Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                });
          }),
        ),
      ),
    );
  }
}
