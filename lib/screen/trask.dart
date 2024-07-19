import 'package:delivery/auth/crud.dart';
import 'package:delivery/auth/link_api.dart';
import 'package:delivery/main.dart';
import 'package:delivery/widgets/cardorder.dart';
import 'package:flutter/material.dart';

class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  State<Track> createState() => _TrackState();
}

class _TrackState extends State<Track> with Crud {
  Future<dynamic> getNotes() async {
    var response =
        await postRequest(linkViewDelivery, {"id": sharedPref.getString("id")});
    return response;
  }

  // getNamePh() async {
  //   var responses =
  //       await postRequest(linkViewNamePh, {"ph_name": sharedPref.getString("ph_name")});
  //   return responses;
  // }

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
                child: Image.asset("assets/Group 8.png"),
              ),
              Container(
                width: 387,
                height: 488,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0x6BA1C6E1)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  shadows: [
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
                    ),
                  ],
                ),
                child: FutureBuilder(
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
                        // itemCount: snapshot.data['data'].length,
                        itemCount: snapshot.hasData ? 1 : 0,

                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          if (snapshot.hasData) {
                            var data = snapshot.data['data'][1];
                            bool isCardGreen = sharedPref
                                    .getBool('card_color_${data['title']}') ??
                                true;

                            return CardOrder(
                              onTap: () async {
                                setState(() {
                                  isCardGreen = !isCardGreen;
                                });

                                // saveColorPreference(data['title'], isCardGreen);
                              },
                              initialColor: isCardGreen
                                  ? const Color(0xffe6eef8)
                                  : Colors.green,
                              title: "${data['title']}",
                              content: "${data['content']}",
                              nameph: '${data['ph_name']}',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
