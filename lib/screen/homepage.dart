import 'package:delivery/auth/crud.dart';
import 'package:delivery/auth/link_api.dart';
import 'package:delivery/main.dart';
import 'package:delivery/widgets/account.dart';
import 'package:delivery/widgets/category.dart';
import 'package:delivery/widgets/float_number.dart';
import 'package:delivery/widgets/text_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

bool _isButtonClicked = false;

class _HomePageState extends State<HomePage> with Crud {
  getNotes() async {
    var response =
        await postRequest(linkViewDelivery, {"id": sharedPref.getString("id")});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
       floatingActionButton: const Padding(
         padding: EdgeInsets.only(bottom: 40),
         child: FloatNumber(),
       ),
      
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            image: AssetImage("assets/ffff.png"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Account(),
                  ],
                ),
                TextTitle(
                  text: 'welcome',
                  color: const Color(0xFF050505),
                ),
                TextTitle(
                  text: 'to',
                  color: const Color(0xFF050505),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/Rushttk.png"),
                ),
                if (_isButtonClicked)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "orderdlv");
                      },
                      child: const Text('Start Shift Work'),
                    ),
                  ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // ظهر 'Go to Order Delivery' للمدة 10 ثواني
                        //'Go to Order Delivery' و تختفي false بمعني ان  يعد 10 ثواني تتغيرالقيمة الي
                        setState(() {
                          _isButtonClicked = true;
                        });
                        Future.delayed(const Duration(seconds: 10), () {
                          setState(() {
                            _isButtonClicked = false;
                          });
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Category(
                          color: Color(0xFFCBFAC3),
                          image: 'assets/Group 2.png',
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "map");
                      },
                      child: const Category(
                        color: Color(0xFFCAE4F2),
                        image: 'assets/Group 9.png',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "help");
                          },
                          child: const Category(
                            color: Color(0xFFE8D3C5),
                            image: 'assets/Group 4.png',
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "track");
                        },
                        child: const Category(
                          color: Color(0xFFE6E8CC),
                          image: 'assets/Grou.png',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
