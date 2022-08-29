import 'dart:ffi';

import 'package:case_infobox/Models/Kullanicilardao.dart';
import 'package:case_infobox/views/login-register-pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:toast/toast.dart';

import '../../themes/app_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<bool> geriDonusTusu(BuildContext context) async {
    print("geri tuşu tıklandı");
    Navigator.of(context).popUntil((route) => route.isFirst);
    return true;
  }

  Future<void> kayit(String kullanici_ad, String kullanici_soyad,
      String kullanici_mail, String kullanici_sifre) async {
    await Kullanicilardao().kullaniciEkle(
        kullanici_ad, kullanici_soyad, kullanici_mail, kullanici_sifre);
    Navigator.pushNamed(context, 'loginPage');
  }

  Future<void> kayitKontrol() async {
    int sonuc = await Kullanicilardao().kayitKontrol(tfKullaniciMail.text);
    print("Veritabanında $sonuc tane var");
    print(sonuc);
    if (sonuc == 0) {
      kayit(tfKullaniciAd.text, tfKullaniciSoyad.text, tfKullaniciMail.text,
          tfKullaniciSifre.text);
    } else
      print("var zaten");
  }

  bool _obscureText = true;
  var tfKullaniciAd = TextEditingController();
  var tfKullaniciSoyad = TextEditingController();
  var tfKullaniciMail = TextEditingController();
  var tfKullaniciSifre = TextEditingController();

  @override
  void initState() {
    super.initState();
    //ekle();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;

    return Scaffold(
      appBar: null,
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: ekranGenisligi / 6),
                    child: SizedBox(
                        width: ekranYuksekligi / 4.5,
                        child: Image.asset("images/logoo.png")),
                  ),
                ),
                Text(
                  "iBox",
                  style: TextStyle(fontSize: 32, fontFamily: 'Risque'),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: ekranYuksekligi / 16, top: ekranGenisligi / 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ad",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ekranGenisligi / 100,
                      left: ekranYuksekligi / 17,
                      right: ekranYuksekligi / 17),
                  child: TextFormField(
                    controller: tfKullaniciAd,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Ad zorunludur."),
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
                      left: ekranYuksekligi / 16, top: ekranGenisligi / 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Soyad",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ekranGenisligi / 100,
                      left: ekranYuksekligi / 17,
                      right: ekranYuksekligi / 17),
                  child: TextFormField(
                    controller: tfKullaniciSoyad,
                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Soyad zorunludur."),
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
                      left: ekranYuksekligi / 16, top: ekranGenisligi / 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      top: ekranGenisligi / 100,
                      left: ekranYuksekligi / 17,
                      right: ekranYuksekligi / 17),
                  child: TextFormField(
                    controller: tfKullaniciMail,

                    validator: MultiValidator([
                      RequiredValidator(errorText: "* Mail zorunludur."),




                      EmailValidator(errorText: 'Geçerli bir mail adresi yazınız')
                    




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
                      left: ekranYuksekligi / 16, top: ekranGenisligi / 45),
                  child: Row(
                    children: [
                      Text(
                        "Şifre",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'IBMPlexSans'),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ekranGenisligi / 100,
                      left: ekranYuksekligi / 17,
                      right: ekranYuksekligi / 17),
                  child: TextFormField(
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
                  padding: EdgeInsets.only(top: ekranGenisligi / 14),
                  child: SizedBox(
                    width: ekranYuksekligi / 4.50,
                    height: ekranGenisligi / 10,
                    child: AppTheme.buttons.elevatedButton(
                        color: Color(0xff74A2B7),
                        child: Text(
                          "Kayıt Ol",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ekranGenisligi/25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'IBMPlexSans'),
                        ),
                        onPressed: (){  if (_formKey.currentState!.validate()) {
                            print("Validated");
                            kayitKontrol();
                          } else {
                            print("Not Validated");
                          }

                          print("$ekranGenisligi");
                        }),

                    // ElevatedButton(
                    //   child: Text(
                    //     "Kayıt Ol",
                    //     style: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: ekranGenisligi / 25.00),
                    //   ),
                    //   style: ElevatedButton.styleFrom(
                    //       primary: Color(0xff74A2B7),
                    //       shadowColor: Colors.black,
                    //       elevation: 10,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         side: BorderSide(color: Color(0xff253F64)),
                    //       )),
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       print("Validated");
                    //       kayitKontrol();
                    //     } else {
                    //       print("Not Validated");
                    //     }
                    //
                    //     print("$ekranGenisligi");
                    //   },
                    // ),
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
