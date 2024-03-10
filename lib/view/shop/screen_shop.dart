import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/view/shop/selectedProDetailPage.dart';
import 'package:hardware_pro/view/shop/mycart.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:provider/provider.dart';

class ScreenShop extends StatelessWidget {
  const ScreenShop({super.key});

  @override
  Widget build(BuildContext context) {
    String FeaturedProd = "lib/assets/featreproo.jpeg";
    String pipe1 = "lib/assets/piiiipiit.jpeg";
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Stack(children: [
          Column(children: [
            const SizedBox(
              height: 36,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Text("HOME"),
                const SizedBox(
                  width: 200,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return const MyCartScreen();
                        },
                      ));
                    },
                    icon: const Icon(CupertinoIcons.bag))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110, right: 110, top: 10),
              child: Image.asset(FeaturedProd),
            ),
            Container(
                padding: const EdgeInsets.all(20),
                width: 400,
                height: 535,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 247, 244, 244),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Featured Products",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Consumer<FirestoreDatabase>(
                          builder: (context, store, child) {
                        return FutureBuilder(
                            future: store.fetchAllProduct(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return showIndicator();
                              }
                              final snapShotData = store.productList;
                          
                              return Expanded(
                                child: snapShotData.isEmpty
                                    ? const Center(
                                        child: Text("No products.."),
                                      )
                                    : GridView.builder(
                                        itemCount: snapShotData.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisSpacing: 20,
                                                mainAxisSpacing: 20,
                                                childAspectRatio: .9,
                                                crossAxisCount: 2),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) {
                                                  return SelectedProDetailPage(
                                                    productModel:
                                                        snapShotData[index],
                                                  );
                                                },
                                              ));
                                            },
                                            child: Container(
                                                width: 160,
                                                height: 180,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromARGB(
                                                        255, 255, 249, 249),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                        left: 10,
                                                        right: 10,
                                                        top: 35,
                                                        child: SizedBox(
                                                          height: 120,
                                                          child: Image.network(
                                                            snapShotData[index]
                                                                .productImage,
                                                          ),
                                                        )),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    top: 145,
                                                                    right: 10),
                                                            child: Text(
                                                              snapShotData[
                                                                      index]
                                                                  .productName
                                                                  .toUpperCase(),
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                          Text(
                                                              "₹ ${snapShotData[index].price.toString()}")
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    248,
                                                                    245,
                                                                    245),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                            child: Center(
                                                                child: Text(
                                                                    "${snapShotData[index].offer}%\nOFF")),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 47,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 15,
                                                                  left: 20),
                                                          child: Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30)),
                                                            child: const Icon(
                                                              Icons.favorite,
                                                              size: 15,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                      ),
                              );
                            });
                      })
                    ]))
          ])
        ])));
  }
}
