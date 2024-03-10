import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hardware_pro/View%20Model/controller.dart';
import 'package:hardware_pro/View%20Model/firestore_database.dart';
import 'package:hardware_pro/utils/inntence.dart';
import 'package:hardware_pro/view/drawer/AddAddress.dart';
import 'package:hardware_pro/view/shop/conform_order.dart';
import 'package:hardware_pro/utils/widget.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // String pipiiit = "lib/assets/piiiipiit.jpeg";
    return Scaffold(
      body: Consumer<FirestoreDatabase>(builder: (context, firestore, child) {
        return FutureBuilder(
            future: firestore.fetchCartProduct(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text(
                        "My cart",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  Expanded(
                    child: snapshot.connectionState == ConnectionState.waiting
                        ? showIndicator()
                        : firestore.cartmodelList.isEmpty
                            ? const Center(
                                child: Text(
                                    "oops..! No prduct found in your cart"),
                              )
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    width: width,
                                    height: height * .12,
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 244, 241, 241),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Image.network(firestore
                                                  .cartmodelList[index]
                                                  .productModel
                                                  .productImage)),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(firestore.cartmodelList[index]
                                                .productModel.productName),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.currency_rupee,
                                                  size: 17,
                                                ),
                                                Text(
                                                  firestore.cartmodelList[index]
                                                      .productModel.price
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Consumer<Controller>(builder:
                                                (context, controller, child) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                // mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .decrementCounter(
                                                        firestore
                                                            .cartmodelList[
                                                                index]
                                                            .productModel
                                                            .price
                                                            .toInt(),
                                                        firestore
                                                            .cartmodelList[
                                                                index]
                                                            .quantity,
                                                      )
                                                          .then((dataMap) {
                                                        if (dataMap[
                                                                "quantity"] >
                                                            0) {
                                                          firestore.updateCartData(
                                                              firestore
                                                                  .cartmodelList[
                                                                      index]
                                                                  .cartid,
                                                              dataMap[
                                                                  "quantity"],
                                                              dataMap[
                                                                  "ttlprice"]);
                                                        }
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                .isRemoveIconPressed
                                                            ? Colors.deepOrange
                                                            : const Color
                                                                .fromARGB(255,
                                                                166, 166, 166),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: const Icon(
                                                          Icons.remove,
                                                          size: 10),
                                                    ),
                                                  ),
                                                  // const SizedBox(width: 30),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    color: Colors.white,
                                                    height: 30,
                                                    width: 30,
                                                    child: Text(
                                                      firestore
                                                          .cartmodelList[index]
                                                          .quantity
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  // const SizedBox(width: 30),
                                                  GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .incrementCounter(
                                                        10,
                                                        firestore
                                                            .cartmodelList[
                                                                index]
                                                            .quantity,
                                                        firestore
                                                            .cartmodelList[
                                                                index]
                                                            .productModel
                                                            .price
                                                            .toInt(),
                                                      )
                                                          .then((dataMap) {
                                                        firestore.updateCartData(
                                                            firestore
                                                                .cartmodelList[
                                                                    index]
                                                                .cartid,
                                                            dataMap["quantity"],
                                                            dataMap[
                                                                "ttlprice"]);
                                                      });
                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 30,
                                                      decoration: BoxDecoration(
                                                        color: controller
                                                                .isAddIconPressed
                                                            ? Colors.deepOrange
                                                            : const Color
                                                                .fromARGB(255,
                                                                166, 166, 166),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(2),
                                                      ),
                                                      child: const Icon(
                                                          Icons.add,
                                                          size: 10),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                          ],
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Delete Button
                                              showModalBottomSheet(
                                                shape: const OutlineInputBorder(
                                                    borderSide: BorderSide.none,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(25),
                                                            topRight:
                                                                Radius.circular(
                                                                    25))),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 244, 241, 241),
                                                context: context,
                                                builder: (context) {
                                                  return SizedBox(
                                                    height: 150,
                                                    child: Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        const Text(
                                                          "Do you want to remove item?",
                                                          style: TextStyle(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 50,
                                                                      top: 30),
                                                              child: SizedBox(
                                                                width: 140,
                                                                height: 45,
                                                                child:
                                                                    OutlinedButton(
                                                                        style: OutlinedButton.styleFrom(
                                                                            backgroundColor: const Color.fromARGB(
                                                                                255,
                                                                                148,
                                                                                11,
                                                                                1),
                                                                            shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(
                                                                                    30))),
                                                                        onPressed:
                                                                            () {
                                                                          firestore.deleteFromCart(firestore
                                                                              .cartmodelList[index]
                                                                              .cartid);
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "YES",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 30,
                                                                      top: 30),
                                                              child: SizedBox(
                                                                width: 140,
                                                                height: 45,
                                                                child:
                                                                    OutlinedButton(
                                                                        style: OutlinedButton.styleFrom(
                                                                            backgroundColor: const Color.fromARGB(
                                                                                255,
                                                                                28,
                                                                                30,
                                                                                43),
                                                                            shape: RoundedRectangleBorder(
                                                                                borderRadius: BorderRadius.circular(
                                                                                    30))),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                        child:
                                                                            const Text(
                                                                          "NO",
                                                                          style: TextStyle(
                                                                              color: Color.fromARGB(255, 255, 255, 255),
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.bold),
                                                                        )),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete,
                                              size: 40,
                                            ))
                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 20,
                                    ),
                                itemCount: firestore.cartmodelList.length),
                  ),
                  firestore.cartmodelList.isEmpty
                      ? const SizedBox()
                      : Row(
                          children: [
                            const SizedBox(
                              width: 35,
                            ),
                            const Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 220,
                            ),
                            const Icon(Icons.currency_rupee,
                                size: 16, color: Colors.deepOrange),
                            Consumer<Controller>(
                                builder: (context, controller, child) {
                              return FutureBuilder(
                                  future: controller.assignTototalPrice(
                                      firestore.cartmodelList),
                                  builder: (context, snapshot) {
                                    return Text(
                                      controller.finalPrice
                                          .toDouble()
                                          .toString(),
                                      // controller.totalprice!.toDouble().toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrange),
                                    );
                                  });
                            }),
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                  firestore.cartmodelList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          width: 350,
                          height: 48,
                          child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.deepOrange,
                              ),
                              onPressed: () {
                                buyNow(context);
                              },
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              );
            });
      }),
    );
  }
}

buyNow(context) {
  showModalBottomSheet(
    shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25))),
    backgroundColor: const Color.fromARGB(255, 244, 241, 241),
    context: context,
    builder: (context) {
      return SizedBox(
        height: 250,
        child: Consumer<FirestoreDatabase>(builder: (context, instence, child) {
          return FutureBuilder(
              future: instence.fetchAllAddress(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return showIndicator();
                }

                return Column(
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "   Select Delivery Address",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        TextButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return ScreenAddAddress();
                                },
                              ));
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.black,
                            ),
                            label: const Text(
                              "ADD NEW",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      width: 500,
                      child: instence.userAdressList.isEmpty
                          ? const Center(child: Text("add new address here..."))
                          : ListView.separated(
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: instence.userAdressList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ConfirmOrderPage(
                                          userAddressModel:
                                              instence.userAdressList[index],
                                          total:
                                              Provider.of<Controller>(context)
                                                  .finalPrice,
                                                  cartmodel: instence.cartmodelList,
                                        ),
                                      ));
                                    },
                                    title: Text(
                                      "${instence.userAdressList[index].name.toUpperCase()},${instence.userAdressList[index].address.toUpperCase()}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.location_on),
                                            Text(
                                                "${instence.userAdressList[index].area}${instence.userAdressList[index].city},${instence.userAdressList[index].state}"),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: Text(
                                              "Pin:${instence.userAdressList[index].pincode}"),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    )
                  ],
                );
              });
        }),
      );
    },
  );
}
