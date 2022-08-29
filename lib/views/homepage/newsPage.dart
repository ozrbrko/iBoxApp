import 'package:case_infobox/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher.dart';
//- Burak Özer -
import '../../viewmodel/haberler_view_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {

  HaberlerViewModel? haberlerStore;

  @override
  void initState() {
    haberlerStore = HaberlerViewModel();
    haberlerStore!.init();
    haberlerStore!.getHaberlerDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text("Güncel Haberler",style: TextStyle(fontFamily: 'IBMPlexSans',fontWeight: FontWeight.bold,fontSize: 21),)),
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: [buildObserver()],
      ),
    );
  }

  Observer buildObserver() {
    return Observer(builder: (context) {
      switch (haberlerStore!.pageState) {
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

        case PageState.SUCCESS:
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height / 1.24,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: haberlerStore!.haberlerResultList!.length,
                itemBuilder: (context, index) {
                  final item = haberlerStore!.haberlerResultList![index];
                  return GestureDetector(
                    onTap: () {
                      var url = item!.url.toString();
                      launchUrl(Uri.parse(url));
                    },
                    child: Container(
                      color: Color(0xffE6E7E9),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0, top: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.05,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    topRight: Radius.circular(10.0)),
                                child: Image.network(item!.image.toString()),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              //text uzunluğuna göre otomatik container
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12.0),
                                      bottomLeft: Radius.circular(12.0),
                                    ),
                                    color: Colors.white),
                                width: MediaQuery.of(context).size.width / 1.05,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    item.name.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        fontFamily: 'IBMPlexSans'),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),

                      // child: Text(item!.name.toString()),
                    ),
                  );
                },
              ),
            ),
          );
        default:
          return Container(
            child: Center(
              child: Text("Lütfen Bekleyin"),
            ),
          );
      }
    });
  }

  void launchURL(String link) async => await canLaunchUrl(Uri.parse(link))
      ? await launchUrl(Uri.parse(link))
      : print("Bir sorun oluştu");
}


