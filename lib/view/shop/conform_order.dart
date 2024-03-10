import 'package:flutter/material.dart';
import 'package:hardware_pro/Model/addressModel.dart';
import 'package:hardware_pro/Model/cartmodel.dart';
import 'package:hardware_pro/view/shop/proceedToPay.dart';
import 'package:hardware_pro/view/shop/order_successfu.dart';

class ConfirmOrderPage extends StatelessWidget {
  List<CartModel> cartmodel;
  UserAddressModel userAddressModel;
  int total;

  ConfirmOrderPage(
      {super.key,
      required this.userAddressModel,
      required this.total,
      required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    final ht = MediaQuery.of(context).size.height;
    String confirm = "lib/assets/confirmorder.jpeg";
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color.fromARGB(255, 235, 232, 232),
                  ),
                  color: const Color.fromARGB(255, 244, 241, 241),
                  borderRadius: const BorderRadius.all(Radius.circular(40))),
              width: 450,
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ht * .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 25,
                          ),
                          Text(
                            "Confirm your",
                            style: TextStyle(
                                color: Color.fromARGB(255, 42, 46, 68),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 45),
                    child: Text(
                      "Order",
                      style: TextStyle(
                          color: Color.fromARGB(255, 42, 46, 68),
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ht * .05,
            ),
            Image.asset(
              confirm,
              scale: 1.5,
            ),
            SizedBox(
              height: ht * .05,
            ),
            ListTile(
              title: Text(
                "${userAddressModel.name.toUpperCase()},${userAddressModel.address.toUpperCase()}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      Text(
                          "${userAddressModel.area}${userAddressModel.city},${userAddressModel.state}"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text("Pin:${userAddressModel.pincode}"),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                height: 20,
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 20, 112, 23),
                        shape: const RoundedRectangleBorder()),
                    onPressed: () {},
                    child: const Text("SELECTED")),
              ),
            ),
            SizedBox(
              height: ht * .10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.currency_rupee,
                  size: 19,
                ),
                Text(
                  "${total.toDouble()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  " TO PAY",
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 40,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 153, 0)),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ScreenPayment(
                              cartmodel: cartmodel,
                              totalAmount: total,
                              userAddressModel: userAddressModel,
                            );
                          },
                        ));
                      },
                      child: const Text(
                        "PROCEED TO PAY",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
