import 'package:case_infobox/constants/enum.dart';
import 'package:case_infobox/viewmodel/eczane_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PharmacyPage extends StatefulWidget {
  const PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {

  double enlem = 0.0;
  double boylam = 0.0;
  // var _konumBilgisi;


  Future<void> konumBilgisiAl() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    var konum = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        konum.latitude,
        konum.longitude,
      );

      var konumBilgisi = placemarks[0].administrativeArea;
    // _konumBilgisi = konumBilgisi!;
    print(konumBilgisi);

    setState(() {
      enlem = konum.latitude;
      boylam = konum.longitude;
      print("aldı");

    });

    eczaneStore!.getEczaneDatas("${konumBilgisi}", "");


  }



  var tfIl = TextEditingController();
  var tfIlce = TextEditingController();

  EczaneViewModel? eczaneStore;

  @override
  void initState() {
    konumBilgisiAl();

    eczaneStore = EczaneViewModel();
    eczaneStore!.init();
    // print("${_konumBilgisi} yeni----");
    super.initState();
    // eczaneStore!.getEczaneDatas("ankara", "");

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
            child: Text(
          "Nöbetçi Eczaneler",
          style: TextStyle(
              fontFamily: 'IBMPlexSans',
              fontWeight: FontWeight.bold,
              fontSize: 21),
        )),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [buildObserver()],
      ),
    );
  }

  Observer buildObserver() {
    return Observer(builder: (context) {
      switch (eczaneStore!.pageState) {
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
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                children: [
                  Container(
                    color: Colors.white10,
                    height: 50,
                    child: Row(
                      children: [
                        Spacer(
                          flex: 10,
                        ),
                        SizedBox(
                          width: 160,
                          height: 40.4,
                          child: Container(
                            width: double.infinity,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFFe9eaec),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(0),bottomRight: Radius.circular(0),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: TextField(
                                cursorColor: Colors.red,
                                controller: tfIl,

                                decoration: InputDecoration(

                                    hintText: "İl",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 165,
                            height: 40.4,
                            child: Container(
                              width: double.infinity,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFFe9eaec),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10),topLeft: Radius.circular(0),bottomLeft: Radius.circular(0)),),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: TextField(
                                  cursorColor: Colors.red,
                                  controller: tfIlce,

                                  decoration: InputDecoration(

                                      hintText: "İlçe",
                                      border: InputBorder.none),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {



                              setState(() {
                                // konumBilgisiAl();
                                print(":enlem ${enlem}  -  boylam : ${boylam}");
                                if(tfIl.text.isEmpty)
                                  {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context){
                                          return AlertDialog(

                                            content: Text("Lütfen il giriniz",style:  TextStyle(fontSize: 20,fontFamily: 'IBMPlexSans'),),
                                            actions: [
                                              Center(
                                                child: ElevatedButton(
                                                  child: Text("Tamam",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight:FontWeight.bold,fontFamily: 'IBMPlexSans'),),
                                                  style: ElevatedButton.styleFrom(
                                                    primary: Colors.blue,
                                                  ),
                                                  onPressed: (){
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),

                                            ],
                                          );
                                        }
                                    );
                                  }
                                else{
                                  eczaneStore = EczaneViewModel();
                                  eczaneStore!.init();
                                  eczaneStore!.getEczaneDatas("${tfIl.text}", "${tfIlce.text}");
                                }

                              });

                              // print(tfIl.text);
                            },
                            child: SizedBox(
                              height: 39.5,
                              width: 32,
                              child: Icon(
                                Icons.search_rounded,
                                color: Colors.blueGrey,
                              ),
                            )),
                        Spacer(
                          flex: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/1.35,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: eczaneStore!.eczaneResultList!.length,
                      itemBuilder: (context, index) {
                        final item = eczaneStore!.eczaneResultList![index];
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 0.0, left: 5, right: 5),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 20, right: 20),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              color: Color(0xffE6E7E9),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  offset: Offset(1.0, 0.0),
                                                  //(x,y)
                                                  blurRadius: 2.5,
                                                ),
                                              ],
                                            ),
                                            height: 80,

                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                        width: 65,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(top: 10.0,left: 5),
                                                          child: Image.asset(
                                                              "lib/assets/images/eczane.jpg"),
                                                        )),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 0.5,
                                                              left: 0.2),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "${item?.name} ECZANESİ ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'IBMPlexSans'),
                                                                ),
                                                                Text(
                                                                  "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          'IBMPlexSans'),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3.1),
                                                            child: Container(
                                                              width: 275,
                                                              child: Text(
                                                                "${item?.address} - TEL: ${item?.phone}",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 3,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'IBMPlexSans'),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),

                                            // child: Text(item!.name.toString()),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
          break;
        default:
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3),
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("Konumunuzdaki Eczaneler Bekleniyor...",style: TextStyle(fontFamily: 'IBMPlexSans'),),
              )
            ],
          );
      }
    });
  }
}
