import 'package:case_infobox/views/homepage/tradePages/altinPage.dart';
import 'package:case_infobox/views/homepage/tradePages/dovizPage.dart';
import 'package:case_infobox/views/homepage/tradePages/kriptoPage.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_theme.dart';

class TradePage extends StatefulWidget {
  const TradePage({Key? key}) : super(key: key);

  @override
  State<TradePage> createState() => _TradePageState();
}

class _TradePageState extends State<TradePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
              child: Text(
            "Piyasalar",
            style: TextStyle(
                fontFamily: 'IBMPlexSans',
                fontWeight: FontWeight.bold,
                fontSize: 21),
          )),
          backgroundColor: AppTheme.colors.red_infobox,
        ),
        body: WillPopScope(
          onWillPop: () async{
            return false;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey[300],
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Colors.green[300],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(
                        text: "Döviz",
                        icon: Icon(Icons.attach_money),

                      ),
                      Tab(
                        text: "Altın",
                        icon: Icon(Icons.money),
                      ),
                      Tab(
                        text: "Kripto",
                        icon: Icon(Icons.currency_bitcoin),
                      )
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      DovizPage(),
                      AltinPage(),
                      KriptoPage(),
                    ],
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
