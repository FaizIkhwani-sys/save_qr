
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scan QR MAE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Scan QR MAE',),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({ this.title});


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // namaMasjid = NamaMasjid.getnamaMasjid();
  }

  var _chosenValue;
  var path = 'assets/qrcode.jpeg';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sila Pilih Masjid untuk derma.'),
            SizedBox(height:15),
            DropdownButton<String>(
              hint: Text('Pilih Masjid'),
              value: _chosenValue,
              items: <String>['MasjidPro Penang'].map((value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: ( value) {
                setState(() {
                  _chosenValue= value;
                });
              },
            ),

            (_chosenValue=="MasjidPro Penang")
                ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    child: Column(
                      children: [
                        Text("Sila tekan Kod QR untuk menyimpan Kod",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),),
                        Container(
                          height: 200,
                          width: 200,
                          child: Image(
                            image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/phtp-33931.appspot.com/o/WhatsApp%20Image%202021-10-28%20at%205.51.22%20PM.jpeg?alt=media&token=62e6fdb6-ae21-49d0-8c38-74a75869307b'),
                          ),
            ),
                      ],
                    ),
                    onTap: () async{
                      final permission = await Permission.storage.request();

                      if (permission.isGranted) {
                        var response = await Dio().get(
                          'https://firebasestorage.googleapis.com/v0/b/phtp-33931.appspot.com/o/WhatsApp%20Image%202021-10-28%20at%205.51.22%20PM.jpeg?alt=media&token=62e6fdb6-ae21-49d0-8c38-74a75869307b',
                          options: Options(
                            responseType: ResponseType.bytes,
                          ),
                        );

                        final result = await ImageGallerySaver.saveImage(
                          Uint8List.fromList(response.data),
                          quality: 60,
                          name: 'qr-code',
                        );

                        if (result != null) {
                          log('success save image to gallery');
                          showAlertDialog(context);

                        }
                      }

                    },
                  ),
                ): Container(),

            SizedBox(height:15),
            RaisedButton(
              child: Text("Buka / Muat Turun Apikasi MAE \nuntuk menderma",
              textAlign: TextAlign.center,),
                padding: EdgeInsets.all(15),
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: (){
                  openMAE();
                }
            )
          ],
        ),
      ),
    );
  }
}
void openMAE() async{
  var url = 'http://mybk.co/3th4dkU';
  var fallbackUrl = 'http://mybk.co/3th4dkU';
  try {
    bool launched = await launch(url, forceSafariVC: false, forceWebView: false);
    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false, forceWebView: false);
  }

}

showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("Teruskan."),
    onPressed: () {
      openMAE();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert!"),
    content: Text("QR telah disimpan kedalam galeri. Sila teruskan....."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



