import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/ffff.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "home");
                      },
                      child: Image.asset(
                        "assets/ho.png",
                        height: 40,
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/Gro.png"),
              ),
              Group27(),
            ],
          ),
        ),
      ),
    );
  }
}

class Group27 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 387,
          height: 558,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 387,
                  height: 558,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.10000000149011612),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Color(0x6BA1C6E1)),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 416,
                child: SizedBox(
                  width: 369,
                  height: 52,
                  child: Text(
                    '6. Privacy and Security : If users have questions or concerns about the privacy and security of their personal and medical information stored in the application. Support is available to address these concerns and ensure compliance with relevant regulations.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 337,
                child: SizedBox(
                  width: 369,
                  height: 52,
                  child: Text(
                    '5. Technical Issues : If Users encounter technical issues such as login problems, app crashes, slow performance, or error messages. Technical support  available to troubleshoot and resolve these issues promptly.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 245,
                child: SizedBox(
                  width: 369,
                  height: 68,
                  child: Text(
                    '4. Payment and Billing : If the driver has questions about payment methods, billing information, or insurance coverage for delivering the customer’s medications. The support team should be able to provide guidance on payment options and help resolve billing issues.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 172,
                child: SizedBox(
                  width: 369,
                  height: 51,
                  child: Text(
                    '3.  Account Management : Support  required for help managing user accounts, including updating personal information, changing passwords, and linking family members accounts.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 12,
                top: 26,
                child: SizedBox(
                  width: 369,
                  height: 52,
                  child: Text(
                    '1. Order Tracking : Users  need assistance with tracking their medication orders in real-time. Providing support for tracking numbers, estimated delivery times, and updates on the status of their orders is crucial.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 13,
                top: 99,
                child: SizedBox(
                  width: 369,
                  height: 52,
                  child: Text(
                    '2. Delivery Issues : Users are experiencing issues with deliveries, such as delays, missing items, or damaged packages. Support is available to help address these issues immediately and arrange replacements or refunds if necessary.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontFamily: 'Padauk',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
