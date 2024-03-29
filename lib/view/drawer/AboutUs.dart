import 'package:flutter/material.dart';
import 'package:hardware_pro/view/ScreenHome.dart';

class ScreenAboutUs extends StatelessWidget {
  const ScreenAboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
        padding: EdgeInsets.only(right: 230, top: 10),
        child: Text(
          "About Us",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
      ),
      const SizedBox(
        height: 35,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          "At ProductCarePro,our primary focus is on\nensuring customer satisfaction and product\nlongevity.We take pride in offering top-notch\nrepair services, maintence plans,and more \nto meet our customer's diverse needs.",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, wordSpacing: 1),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          "Our team consists of dedicated\nprofessionals, each contributing unique skills\nand experiences, all aligned to deliver the\nhighest standards of service. We collaborate\nseamlessly to ensure a seamless experience\nfor our customers.",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, wordSpacing: 1),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5),
        child: Text(
          "ProductCarePro's foundation is built upon\ncore values and principles that guide our\noperations and interactions. Our commitment\nto quality and sustainability is unwaving.",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, wordSpacing: 1),
        ),
      ),
      const SizedBox(
        height: 80,
      ),
      SizedBox(
        width: 120,
        height: 35,
        child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: const Color.fromARGB(255, 16, 19, 39)),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const MainPage();
                },
              ));
            },
            child: const Text(
              "HOME",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      )
    ]));
  }
}
