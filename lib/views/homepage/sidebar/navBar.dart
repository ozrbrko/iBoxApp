import 'package:case_infobox/views/homepage/sidebar//navBar.dart';
import 'package:case_infobox/views/homepage/sidebar/NotlarPage.dart';
import 'package:case_infobox/views/login-register-pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  SharedPreferences? logindata;
  String? username;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata?.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Hoşgeldiniz",
              style: TextStyle(fontSize: 20,fontFamily: 'IBMPlexSans'),
            ),
            accountEmail: Text("Burak Özer"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.person),
              ),
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),

            // decoration: BoxDecoration(
            //   border: Border.all(
            //     width: 0.5, //                   <--- border width here
            //   ),
            //   borderRadius: BorderRadius.circular(0),
            //   color: Colors.white,
            //
            //
            // ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17.0),
                    bottomRight: Radius.circular(17.0),

                  ),
                color: Colors.grey[200],
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.notes),
                    title: Text(
                      "Notlar",
                      style: TextStyle(fontFamily: 'IBMPlexSans', fontSize: 16),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'notlarPage');
                    },
                  ),
                  // Divider(
                  //   color: Colors.red,
                  //   height: 0,
                  //   thickness: 2,
                  //   indent: 0,
                  //   endIndent: 12,
                  // ),
                ],
              ),
            ),

          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17.0),
                    bottomRight: Radius.circular(17.0),

                  ),
                  color: Colors.grey[200],

                ),
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(0),
                //   color: Colors.white,
                //   border: Border.all(
                //     width: 0.5,
                //     //                   <--- border width here
                //   ),
                //
                // ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.exit_to_app),
                      title: Text(
                        "Çıkış Yap",
                        style:
                            TextStyle(fontFamily: 'IBMPlexSans', fontSize: 16),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("iBox"),
                                content: Text(
                                    "Çıkış yapmak istediğinizden emin misiniz?",style: TextStyle(fontFamily: 'IBMPlexSans'),),
                                actions: [
                                  ElevatedButton(
                                    child: Text(
                                      "Vazgeç",
                                      style: TextStyle(
                                          color: Color(0xff74A2B7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IBMPlexSans'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text(
                                      "Çıkış Yap",
                                      style: TextStyle(
                                          color: Color(0xff74A2B7),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'IBMPlexSans'),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                    ),
                                    onPressed: () {
                                      print("Tamam seçildi");
                                      logindata?.setBool('login', true);
                                      Navigator.pushNamed(context, 'loginPage');
                                    },
                                  ),
                                ],
                              );
                            });

                        // logindata?.setBool('login', true);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoginPage()));
                      },
                    ),
                    // Divider(
                    //   color: Colors.red,
                    //   height: 0,
                    //   thickness: 2,
                    //   indent: 0,
                    //   endIndent: 12,
                    // ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

// class Gonder {
//
//   String mail;
//
//   Gonder(this.mail);
//
// }
//
// void kontrol(String mail)
// {
//   Gonder gon = new Gonder(mail);
//   return gon.mail;
// }
