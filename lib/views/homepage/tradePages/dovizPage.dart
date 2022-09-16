import 'package:case_infobox/responsive/frame_size.dart';
import 'package:case_infobox/viewmodel/doviz_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants/enum.dart';

class DovizPage extends StatefulWidget {
  const DovizPage({Key? key}) : super(key: key);

  @override
  State<DovizPage> createState() => _DovizPageState();
}

class _DovizPageState extends State<DovizPage> {
  DovizViewModel? dovizStore;

  @override
  void initState() {
    dovizStore = DovizViewModel();
    dovizStore!.init();
    dovizStore!.getDovizDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FrameSize.init(context: context);
    return Scaffold(
      appBar: null,
      body: ListView(
        children: [buildObserver()],
      ),
    );
  }

  Observer buildObserver() {
    return Observer(builder: (context) {
      switch (dovizStore!.pageState) {
        case PageState.LOADING:
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: FrameSize.screenHeight! / 3),
                child: CircularProgressIndicator(),
              ),
            ],
          );
          break;

        case PageState.SUCCESS:
          return SingleChildScrollView(
            child: Container(
                height: FrameSize.screenHeight! / 1.24,
                width: FrameSize.screenWidth,
                child: ListView.builder(
                    itemCount: dovizStore!.dovizResultList!.length,
                    itemBuilder: (context, index) {
                      final item = dovizStore!.dovizResultList![index];
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
                              width: FrameSize.screenWidth! / 1.05,
                              height: FrameSize.screenWidth! / 7,
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
                                            child: Text(item!.code.toString(), style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.w600,
                                              fontFamily: 'IBMPlexSans',),)),
                                        Text(item.name.toString(), style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.normal,
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
              child: Text("Lütfen Bekleyin"),
            ),
          );
      }
    });
  }
}
