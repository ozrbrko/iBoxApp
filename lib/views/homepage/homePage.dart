import 'dart:io';

import 'package:case_infobox/constants/enum.dart';
import 'package:case_infobox/responsive/frame_size.dart';
import 'package:case_infobox/viewmodel/corona_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../viewmodel/besin_view_model.dart';
import '../../viewmodel/hava_view_model.dart';
import '../homepage/sidebar/navBar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HavaViewModel? havaStore;
  CoronaViewModel? coronaStore;
  BesinViewModel? besinStore;

  @override
  void initState() {
    havaStore = HavaViewModel();
    havaStore!.init();
    havaStore!.getHavaDatas("tr","ankara");
    coronaStore = CoronaViewModel();
    coronaStore!.init();
    coronaStore!.getCoronaDatas();
    besinStore = BesinViewModel();
    besinStore!.init();
    besinStore!.getBesinDatas();
    var date = DateTime.now();
    var month = date.month;

    super.initState();
  }

  Future<bool> uygulamayiKapat() async {
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);
    localizationsDelegates:
    [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];

    locale:
    const Locale('tr');
    title:
    'DateRangePicker Localization';

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(

        centerTitle: true,
         title:  Text('iBox',style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'IBMPlexSans',
                    fontWeight: FontWeight.bold),
              ),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(Icons.menu_sharp),
        // ),
        //
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     // SizedBox(
        //     //     height: 60,
        //     //     child: Image.asset("images/logoo.png")),
        //
        //     Center(
        //       child: Text(
        //         "iBox",
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 24,
        //             fontFamily: 'IBMPlexSans',
        //             fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //   ],
        // ),




        backgroundColor: Colors.red,
        elevation: 3.5,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        // onWillPop: uygulamayiKapat,
        child: ListView(
          children: [havaDurumuBuildObserver(), besinBuildObserver()],
        ),
      ),
    );
  }

  Observer havaDurumuBuildObserver() {
    return Observer(builder: (context) {
      switch (havaStore!.pageState) {
        case PageState.LOADING:
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: FrameSize.screenWidth! / 3),
                child: CircularProgressIndicator(),
              ),
            ],
          );
          break;

        case PageState.SUCCESS:
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: FrameSize.screenWidth! / 17.05,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Takvim",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    height: 250,
                    width: MediaQuery.of(context).size.width / 1.05,
                    child: SfDateRangePicker(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 25.05,
                            left: 8),
                        child: Text(
                          "Ankara Hava Durumu",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width / 25.05,),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    height: 160,
                    width: MediaQuery.of(context).size.width / 1.05,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: havaStore!.havaResultList!.length,
                      itemBuilder: (context, index) {
                        final item = havaStore!.havaResultList![index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: 150,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 25.0, top: 10.0, left: 12),
                                  child: Column(
                                    children: [
                                      Text(item!.day.toString(),style: TextStyle(
                                          fontFamily: 'IBMPlexSans'
                                      ),),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 10.0),
                                        child: SizedBox(
                                            width: 50,
                                            child: Image.network(
                                                item.icon.toString())),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${item.degree.toString()}°",
                                            style: TextStyle(fontSize: 16,fontFamily: 'IBMPlexSans'),
                                          ),
                                          Text(
                                            item.description.toString(),
                                            style: TextStyle(fontSize: 16,fontFamily: 'IBMPlexSans'),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
          break;
        default:
          return Container(
            child: Center(
              child: Text("Lütfen Bekleyin"),
            ),
          );
      }
    });
  }

  Observer besinBuildObserver() {
    return Observer(builder: (context) {
      switch (besinStore!.pageState) {
        case PageState.LOADING:
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: CircularProgressIndicator(),
              ),
            ],
          );
          break;

        case PageState.SUCCESS:
          final data = besinStore!.besinModel!.result!;

          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 25.05,
                            left: 8),
                        child: Text(
                          "Bu Ayın Besinleri",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 25.05,
                            left: 8),
                        child: Text(
                          "Mevsim Meyveleri",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.mevsim_meyve!.length,
                    itemBuilder: (context, index) {
                      final item = data.mevsim_meyve![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 47,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10.0, left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Container(
                                        width: 80,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'IBMPlexSans'),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "Mevsim Sebzeleri",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.mevsim_sebze!.length,
                    itemBuilder: (context, index) {
                      final item = data.mevsim_sebze![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 47,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10.0, left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Container(
                                        width: 80,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'IBMPlexSans'),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "4 Mevsim Sebzeleri",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal,
                            fontFamily: 'IBMPlexSans',),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width / 1.05,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.her_zaman_sebze!.length,
                    itemBuilder: (context, index) {
                      final item = data.her_zaman_sebze![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: 47,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, top: 10.0, left: 10),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Container(
                                        width: 80,
                                        height: 30,
                                        child: Center(
                                          child: Text(
                                            item.toString(),
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontFamily: 'IBMPlexSans'),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5.0),
                                            bottomLeft: Radius.circular(5.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
          break;
        default:
          return Container(
            child: Center(
              child: Text("Lütfen Bekleyin"),
            ),
          );
      }
    });
  }
}
