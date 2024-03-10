import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:hardware_pro/view/drawer/AddAddress.dart';
import 'package:provider/provider.dart';

class ScreenAddress extends StatelessWidget {
  ScreenAddress({super.key});
  int count = 0;
  @override
  Widget build(BuildContext context) {
    // final userAdress =
    //     Provider.of<FirestoreDatabase>(context).userModel!.userAddress;
    List button = [
      Padding(
        padding: const EdgeInsets.only(top: 5),
        child: SizedBox(
          height: 20,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {},
              child: const Text(
                "SELECTED",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      const Text("")
    ];
    return Scaffold(
      body: Consumer<FirestoreDatabase>(builder: (context, instence, child) {
        return FutureBuilder(
            future: instence.fetchAllAddress(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return showIndicator();
              }
              return Column(
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
                  const Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 50, top: 25, right: 260),
                        child: Text(
                          "Your",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 50, top: 50),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 36, 104, 83),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 25),
                            child: Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 36, 104, 83),
                              size: 60,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  instence.userAdressList.isEmpty
                      ? const Expanded(
                          child: SizedBox(
                            child: Center(
                              child: Text("Add your address"),
                            ),
                          ),
                        )
                      : Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                // UserAddressModel indexd=userAdress[index];
                                return ListTile(
                                  title: Text(
                                      "${instence.userAdressList[index].name},${instence.userAdressList[index].address}"),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(right: 200),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${instence.userAdressList[index].area},${instence.userAdressList[index].city},${instence.userAdressList[index].landmark}",
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        // button[index]
                                      ],
                                    ),
                                  ),
                                  leading:
                                      const Icon(Icons.location_on_outlined),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: instence.userAdressList.length),
                        ),
                  OutlinedButton.icon(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "ADD NEW",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        backgroundColor: const Color.fromARGB(255, 37, 35, 35)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ScreenAddAddress();
                        },
                      ));
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  )
                ],
              );
            });
      }),
    );
  }
}
