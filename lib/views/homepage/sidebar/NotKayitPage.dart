import 'package:case_infobox/Models/Notlardao.dart';
import 'package:case_infobox/themes/app_theme.dart';
import 'package:case_infobox/views/homepage/sidebar/NotlarPage.dart';
import 'package:flutter/material.dart';

class NotKayitPage extends StatefulWidget {
  const NotKayitPage({Key? key}) : super(key: key);

  @override
  State<NotKayitPage> createState() => _NotKayitPageState();
}

class _NotKayitPageState extends State<NotKayitPage> {
  var tfNotBaslik = TextEditingController();
  var tfNotDetay = TextEditingController();

  Future<void> kayit(String not_baslik, String not_detay) async {
    await Notlardao().notEkle(not_baslik, not_detay);
    Navigator.pushNamed(context, 'notlarPage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Not Kayıt",style: TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Column(
          children: [
            Center(
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
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        // alt satıra iner
                        maxLines: null,
                        maxLength: 20,
                        controller: tfNotBaslik,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
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
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: tfNotDetay,
                        maxLength: 300,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xffE6E7E9)),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 130,
              child: AppTheme.buttons.elevatedButton(
                  color: Colors.red,
                  child: Text(
                    "Kaydet",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'IBMPlexSans'),
                  ),
                  onPressed: (){kayit(tfNotBaslik.text, tfNotDetay.text);}),
            ),
          ],
        ),
      ),

      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     kayit(tfNotBaslik.text, tfNotDetay.text);
      //   },
      //   tooltip: "Not Kayıt",
      //   icon: Icon(Icons.save),
      //   label: Text("Kaydet"),
      //   backgroundColor: Colors.green[300],
      // ),
    );
  }

}
