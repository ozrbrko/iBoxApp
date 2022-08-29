import 'package:case_infobox/Models/Notlardao.dart';
import 'package:case_infobox/main.dart';
import 'package:case_infobox/views/homepage/sidebar/NotDetayPage.dart';
import 'package:case_infobox/views/homepage/sidebar/NotKayitPage.dart';
import 'package:case_infobox/views/homepage/sidebar/Notlar.dart';
import 'package:flutter/material.dart';

class NotlarPage extends StatefulWidget {
  const NotlarPage({Key? key}) : super(key: key);

  @override
  State<NotlarPage> createState() => _NotlarPageState();
}

class _NotlarPageState extends State<NotlarPage> {
  Future<List<Notlar>> tumNotlarGoster() async {
    var notlarListesi = await Notlardao().tumNotlar();

    return notlarListesi;
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var month = "${date.day}/${date.month}/${date.year}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, 'mainPage');
          },
        ),
        title: Text("Notlar"),
      ),
      body: FutureBuilder<List<Notlar>>(
        future: tumNotlarGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var notlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: notlarListesi!.length,
              itemBuilder: (context, indeks) {
                var not = notlarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotDetayPage(
                                  not: not,
                                )));
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
                    child: SizedBox(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xffFFF6A6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 0.5,
                            ),
                          ],
                        ),
                        child: SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width / 1.05,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0,left: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 120,
                                        child: Text(
                                          not.not_baslik,
                                          overflow: TextOverflow.ellipsis,


                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            fontFamily: 'IBMPlexSans',
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),
                                        child: Container(
                                          width: 200,
                                          child: Text(
                                            not.not_detay,
                                            overflow: TextOverflow.ellipsis, // üç nokta
                                            style: TextStyle(
                                              fontFamily: 'IBMPlexSans',
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                          child: Text(
                                        month.toString(),
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSans',
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'notKayitPage');
        },
        tooltip: "Not Ekle",
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
