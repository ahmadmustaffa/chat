import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: SafeArea(
          child: IconButton(
            onPressed: () => openwhatsapp(),
            icon: const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.lightGreen,
            ),
            padding: const EdgeInsets.all(40),
            tooltip: "open whatsapp",
          ),
        ),
      ),
    );
  }

  openwhatsapp() async {
    var whatsappnum = "+923036902975";
    var whatsappURlAndroid =
        "https://api.whatsapp.com/send?phone=$whatsappnum&text=hey";

    // "https://www.google.com/";
    // "whatsapp://send?phone=$whatsapp&text=hello";
    // "https://api.whatsapp.com/whatsapp://send?phone=$whatsapp&text=hello";
    var whatappURLIos = "https://wa.me/$whatsappnum?text=${Uri.parse("hello")}";

    if (Platform.isIOS) {
      // for iOS phone only
      if (await canLaunch(whatappURLIos)) {
        await launch(whatappURLIos, forceSafariVC: false);
      } else {
        throw 'not installed';
      }
    } else {
      // android , web
      if (await canLaunch(whatsappURlAndroid)) {
        await launch(whatsappURlAndroid);
        // print("open");
      } else {
        throw 'not installed';
      }
    }
  }
}
