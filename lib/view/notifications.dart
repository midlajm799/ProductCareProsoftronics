import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/ScreenHome.dart';
import 'package:provider/provider.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FirestoreDatabase>(builder: (context, firstoree, child) {
        return Column(children: [
          Container(
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
                  "Back",
                  style: TextStyle(
                      color: Color.fromARGB(255, 78, 78, 80),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30, right: 200),
            child: Text(
              "Notifications",
              style: TextStyle(
                  color: Color.fromARGB(255, 74, 72, 72),
                  fontSize: 27,
                  fontWeight: FontWeight.bold),
            ),
          ),
          FutureBuilder(
              future: firstoree.fectNotificationFromUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return showIndicator();
                }
                return Expanded(
                  child: firstoree.notificationList.isEmpty
                      ? const Center(
                          child: Text("No new notification"),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(left: 50, right: 50),
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 240, 237, 237),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Padding(
                                      padding: const EdgeInsets.only(
                                        right: 90,
                                      ),
                                      child: Text(
                                        "Notifications ${index + 1}",
                                        style: const TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    subtitle: Text(
                                      firstoree
                                          .notificationList[index].notification,
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(firstoree
                                          .notificationList[index].date),
                                      Text(firstoree
                                          .notificationList[index].time),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              color: Color.fromARGB(255, 244, 244, 244),
                            );
                          },
                          itemCount: firstoree.notificationList.length),
                );
              }),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, top: 20),
            child: SizedBox(
              width: 120,
              height: 35,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      backgroundColor: const Color.fromARGB(255, 16, 19, 39)),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text(
                            'Confirm before delete all notification'),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          TextButton(
                              onPressed: () {
                                firstoree.clearAllNotification();
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Confirm",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Clear",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            ),
          )
        ]);
      }),
    );
  }
}
