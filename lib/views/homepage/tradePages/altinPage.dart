import 'package:case_infobox/viewmodel/doviz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants/enum.dart';
import '../../../viewmodel/altin_view_model.dart';

class AltinPage extends StatefulWidget {
  const AltinPage({Key? key}) : super(key: key);

  @override
  State<AltinPage> createState() => _AltinPageState();
}

class _AltinPageState extends State<AltinPage> {
  AltinViewModel? altinStore;

  @override
  void initState() {
    altinStore = AltinViewModel();
    altinStore!.init();
    altinStore!.getAltinDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [buildObserver()],
      ),
    );
  }

  Observer buildObserver() {
    return Observer(builder: (context) {
      switch (altinStore!.pageState) {
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
          return SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height / 1.14,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: altinStore!.altinResultList!.length,
                    itemBuilder: (context, index) {
                      final item = altinStore!.altinResultList![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 0.5,
                                  ),
                                ],
                              ),
                              width: MediaQuery.of(context).size.width / 1.05,
                              height: MediaQuery.of(context).size.width / 7,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Text(item!.name.toString(), style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.w600,
                                              fontFamily: 'IBMPlexSans',),)),
                                        Text("Oran: ${item.rate.toString()}", style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.normal,
                                          fontFamily: 'IBMPlexSans',),)
                                      ],
                                    ),
                                  ),

                                  Spacer(),
                                  Container(

                                    width: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Spacer(flex: 20,),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Center(
                                                child: Text(
                                                  "Alış", style: TextStyle(
                                                  fontSize: 15, fontWeight: FontWeight.w500,
                                                  fontFamily: 'IBMPlexSans',),)),
                                            Text(item.selling!
                                                .toStringAsFixed(2),style: TextStyle(
                                                fontSize: 13, fontWeight: FontWeight.normal,
                                                fontFamily: 'IBMPlexSans',color: Colors.blue))
                                          ],
                                        ),

                                        Spacer(flex: 20,),

                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(
                                                "Satış",style: TextStyle(
                                                fontSize: 15, fontWeight: FontWeight.w500,
                                                fontFamily: 'IBMPlexSans',),),),
                                            Text(item.buying!
                                                .toStringAsFixed(2),style: TextStyle(
                                                fontSize: 13, fontWeight: FontWeight.normal,
                                                fontFamily: 'IBMPlexSans',color: Colors.blue))
                                          ],
                                        ),

                                        Spacer(flex: 20,),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
          );
          break;
        default:
          return Container(
            child: Center(
              child: Text("Lütfen Bekleyin",style: TextStyle(fontFamily: 'IBMPlexSans'),),
            ),
          );
      }
    });
  }
}
