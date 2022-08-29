import 'package:case_infobox/Models/Notlardao.dart';
import 'package:case_infobox/views/homepage/sidebar/Notlar.dart';
import 'package:case_infobox/views/homepage/sidebar/NotlarPage.dart';
import 'package:flutter/material.dart';

class NotDetayPage extends StatefulWidget {
  Notlar not;

  NotDetayPage({required this.not});

  @override
  State<NotDetayPage> createState() => _NotDetayPageState();
}

class _NotDetayPageState extends State<NotDetayPage> {
  var tfNotBaslik = TextEditingController();
  var tfNotDetay = TextEditingController();

  Future<void> sil(int not_id) async {
    await Notlardao().notSil(not_id);
    Navigator.pushNamed(context, 'notlarPage');
    print("pushnamed ile");
    // Navigator.pushNamed(context, 'login')

  }

  Future<void> guncelle(int not_id, String not_baslik, String not_detay) async {
    await Notlardao().notGuncelle(not_id, not_baslik, not_detay);
    Navigator.pushNamed(context, 'notlarPage');
  }

  @override
  void initState() {
    super.initState();

    var not = widget.not;
    tfNotBaslik.text = not.not_baslik;
    tfNotDetay.text = not.not_detay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Not Detay",style: TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.bold),),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                sil(widget.not.not_id);
              },
              child: Text(
                "Sil",
                style: TextStyle(color: Colors.white,fontFamily: 'IBMPlexSans'),
              )),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                guncelle(widget.not.not_id, tfNotBaslik.text, tfNotDetay.text);
              },
              child: Text(
                "Güncelle",
                style: TextStyle(color: Colors.white,fontFamily: 'IBMPlexSans'),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Başlık",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    maxLength: 20,
                    controller: tfNotBaslik,
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE6E7E9)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Not",
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: SizedBox(
                    child: TextFormField(
                      keyboardType: TextInputType.multiline,  //alt satıra geçirir
                      maxLines: null,
                      maxLength: 300,
                      controller: tfNotDetay,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffE6E7E9)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)))),
                    ),
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
