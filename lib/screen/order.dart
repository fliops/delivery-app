import 'package:delivery/widgets/icon_home.dart';
import 'package:flutter/material.dart';
import 'package:delivery/auth/crud.dart';
import 'package:delivery/auth/link_api.dart';
import 'package:delivery/main.dart';
import 'package:delivery/widgets/cardorder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDlv extends StatefulWidget {
  OrderDlv({Key? key}) : super(key: key);

  @override
  State<OrderDlv> createState() => _OrderDlvState();
}

class _OrderDlvState extends State<OrderDlv> with Crud {
  bool isGreen = true;

  void saveColorPreference(String title, bool isGreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('card_color_$title', isGreen);
    print('Color preference saved for $title: $isGreen');
  }

  @override
  Future<dynamic> getNotes() async {
    var response =
        await postRequest(linkViewDelivery, {"id": sharedPref.getString("id")});
    return response;
  }

  Future<dynamic> getNamePh() async {
    var responses = await postRequest(linkViewNamePh, {"ph_name": ("ph_name")});
    return responses;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconHome(),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/Group 7.png"),
                ),
                FutureBuilder(
                  future: getNotes(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data['response'] == 'fail') {
                        return const Padding(
                          padding: EdgeInsets.only(top: 300),
                          child: Center(
                            child: Text(
                              "No Roshta",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          if (snapshot.hasData) {
                            var data = snapshot.data['data'][i];
                            bool isCardGreen = sharedPref
                                    .getBool('card_color_${data['title']}') ??
                                true;

                            return CardOrder(
                              onTap: () async {
                                setState(() {
                                  isCardGreen = !isCardGreen;
                                });

                                saveColorPreference(data['title'], isCardGreen);
                              },
                              initialColor: isCardGreen
                                  ? const Color(0xffe6eef8)
                                  : Colors.green,
                              title: "${data['user_name']}",
                              content: "${data['user_addres']}",
                              nameph: '${data['ph_addres']}',
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return const Center(
                              child: Text("No data"),
                            );
                          }
                        },
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(
                      " يجب العلم ان يختفي الطلب خلال 14 يوم ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
