import 'package:case_infobox/main.dart';
import 'package:case_infobox/responsive/frame_size.dart';
import 'package:case_infobox/views/login-register-pages/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Kullanicilar.dart';
import '../../Models/Kullanicilardao.dart';
import '../../themes/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> kullanicilariGoster() async {
    var mylist = await Kullanicilardao().tumKullanicilar();
    for (Kullanicilar k in mylist) {
      print("***************");
      print(
          "Kişi bilgileri : ${k.kullanici_id} \n ${k.kullanici_ad} \n ${k.kullanici_soyad} \n ${k.kullanici_mail} \n ${k.kullanici_sifre} \n");
    }
  }

  Future<void> ekle() async {
    await Kullanicilardao()
        .kullaniciEkle("Ada", "Günbulut", "adaa@gmail", "2105aa");
  }

  /* Future<void> kayitKontrol() async {
   int sonuc =  await Kullanicilardao().kayitKontrol("burak@gmail.com","12345");
   print("Veritabanında $sonuc tane var");
  }

*/

  Future<void> girisKontrol() async {
    int sonuc = await Kullanicilardao()
        .girisKontrol(tfKullaniciMail.text, tfKullaniciSifre.text);
    print("Veritabanında $sonuc tane var");
    print(sonuc);
    if (sonuc == 0) {
      print("Böyle bir kullanıcı yok");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("E-mail veya şifre hatalı!"),
      ));
    } else {
      print("Giriş Yapıldı");
      Navigator.pushNamed(context, 'mainPage');

      // Gonder gon = new Gonder(tfKullaniciMail.text);
      // kontrol(gon.mail);
      // print(kontrol(gon.mail));

      // iceriGonder(gon.ad);

    }
  }

  bool _obscureText = true;
  var tfKullaniciMail = TextEditingController();
  var tfKullaniciSifre = TextEditingController();

  SharedPreferences? logindata;
  bool? newuser;

  @override
  void initState() {
    super.initState();
    //ekle();
    kullanicilariGoster();
    check_if_already_login();
    //kayitKontrol();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    FrameSize.init(context: context);

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: null,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: FrameSize.screenWidth! / 6),
                    child: SizedBox(
                        width: FrameSize.screenHeight! / 4.5,
                        child: Image.asset("assets/images/logoo.png")),
                  ),
                ),
                const Text(
                  "iBox",
                  style: TextStyle(fontSize: 32, fontFamily: 'Risque'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: FrameSize.screenHeight! / 16, top: FrameSize.screenWidth! / 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "E-mail",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: FrameSize.screenWidth! / 90,
                      left: FrameSize.screenHeight! / 17,
                      right: FrameSize.screenHeight! / 17),
                  child: TextFormField(
                    controller: tfKullaniciMail,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Mail zorunludur."),
                      EmailValidator(
                          errorText: 'Geçerli bir mail adresi yazınız')
                    ]),
                    decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        filled: true,
                        fillColor: Color(0xffE6E7E9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE6E7E9)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: FrameSize.screenHeight! / 16, top: FrameSize.screenWidth! / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Şifre",
                        style: TextStyle(
                            fontSize: FrameSize.screenHeight! / 43.04761905,
                            fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: FrameSize.screenWidth! / 90,
                      left: FrameSize.screenHeight! / 17,
                      right: FrameSize.screenHeight! / 17),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: tfKullaniciSifre,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Şifre zorunludur."),
                      MinLengthValidator(6,
                          errorText: "Şifre en az 6 karakter olmalıdır"),
                      MaxLengthValidator(15,
                          errorText: "Şifre 15 karakterden fazla olamaz")
                    ]),
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          child: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        filled: true,
                        fillColor: Color(0xffE6E7E9),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffE6E7E9)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)))),
                    obscureText: _obscureText,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: FrameSize.screenWidth! / 9.0, top: FrameSize.screenWidth!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //Şifremi Unuttum Alert

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          FrameSize.screenHeight! / 25.82857143)),

                                  //this right here
                                  child: Container(
                                    height: FrameSize.screenHeight! / 2.720,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                FrameSize.screenWidth! / 14))),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: FrameSize.screenWidth! / 11,
                                          width: FrameSize.screenHeight,
                                          decoration: BoxDecoration(
                                            color: Color(0xff74A2B7),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    FrameSize.screenWidth! / 15.57),
                                                topLeft: Radius.circular(
                                                    FrameSize.screenWidth! / 15.57)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Şifremi Unuttum",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                        FrameSize.screenWidth! / 20),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top:
                                                  FrameSize.screenHeight! / 19.37142857,
                                              left: FrameSize.screenHeight! /
                                                  45.57983193),
                                          child: Row(
                                            children: [
                                              Text(
                                                "E-Mail",
                                                style: TextStyle(
                                                    fontSize: FrameSize.screenHeight! /
                                                        43.04761905,
                                                    fontWeight:
                                                        FontWeight.bold,fontFamily: 'IBMPlexSans'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: FrameSize.screenHeight! /
                                                  77.48571429),
                                          child: SizedBox(
                                            height: FrameSize.screenWidth! / 9,
                                            width: FrameSize.screenWidth! / 1.4,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xffE6E7E9),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xffE6E7E9)),
                                                      borderRadius: BorderRadius
                                                          .all(Radius.circular(
                                                              FrameSize.screenHeight! /
                                                                  77.48571429)))),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: FrameSize.screenWidth! / 9),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              SizedBox(
                                                width: FrameSize.screenHeight! / 7.50,
                                                height: FrameSize.screenWidth! / 10,
                                                child: ElevatedButton(
                                                  child: Text(
                                                    "İptal Et",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            FrameSize.screenWidth! /
                                                                25.00,fontFamily: 'IBMPlexSans'),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary: Colors.red,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            side: BorderSide(
                                                                color:
                                                                    Colors.red),
                                                          )),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              ),
                                              SizedBox(
                                                width: FrameSize.screenHeight! / 7.50,
                                                height: FrameSize.screenWidth! / 10,
                                                child: ElevatedButton(
                                                  child: Text(
                                                    "Gönder",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize:
                                                            FrameSize.screenWidth! /
                                                                25.00,fontFamily: 'IBMPlexSans'),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          primary:
                                                              Color(0xff74A2B7),
                                                          shadowColor:
                                                              Colors.black,
                                                          elevation: 10,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            10)),
                                                            side: BorderSide(
                                                                color: Color(
                                                                    0xff253F64)),
                                                          )),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              });

                          // Şifremi Unuttum Alert
                        },
                        child: Text(
                          "Şifremi Unuttum",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'IBMPlexSans',
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: FrameSize.screenWidth! / 7),
                  child: SizedBox(
                    width: FrameSize.screenHeight! / 4.50,
                    height: FrameSize.screenWidth! / 10,
                    child: AppTheme.buttons.elevatedButton(
                        color: Color(0xff74A2B7),
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexSans'),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("Validated");
                            girisKontrol();
                            logindata?.setBool('login', false);
                            logindata?.setString(
                                'username', tfKullaniciMail.text);
                          } else {
                            print("Not Validated");
                          }
                        }),
                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Color(0xff74A2B7),
                    //       shadowColor: Colors.black,
                    //       elevation: 10,
                    //       shape: const RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         side: BorderSide(color: Color(0xff253F64)),
                    //       )),
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       print("Validated");
                    //       girisKontrol();
                    //       logindata?.setBool('login', false);
                    //       logindata?.setString('username', tfKullaniciMail.text);
                    //     } else {
                    //       print("Not Validated");
                    //     }
                    //   },
                    //   child: Text(
                    //     "Giriş Yap",
                    //     style: TextStyle(
                    //         color: Colors.white, fontSize: 16.4571428571),
                    //   ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    "veya",
                    style: TextStyle(fontSize: 16,fontFamily: 'IBMPlexSans'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: FrameSize.screenWidth! / 30),
                  child: SizedBox(
                    width: FrameSize.screenHeight! / 4.50,
                    height: FrameSize.screenWidth! / 10,
                    child: AppTheme.buttons.elevatedButton(
                        color: Color(0xff74A2B7),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexSans'),
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, 'registerPage');
                        }),

                    // ElevatedButton(
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Color(0xff74A2B7),
                    //       shadowColor: Colors.black,
                    //       elevation: 10,
                    //       shape: const RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         side: BorderSide(color: Color(0xff253F64)),
                    //       )),
                    //   onPressed: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => RegisterPage()));
                    //   },
                    //   child: Text(
                    //     "Kayıt Ol",
                    //     style: TextStyle(
                    //         color: Colors.white, fontSize: 16.4571428571),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool("login") ?? true);
    if (newuser == false) {
      Navigator.pushNamed(context, 'mainPage');
    }
  }

  @override
  void dispose() {
    tfKullaniciMail.dispose();
    tfKullaniciSifre.dispose();
    super.dispose();
  }
}
