import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String appName = "App Name";
  @override
  Widget build(BuildContext context) {
    var ogrenciler = ["Engin Demiroğ", "Kerem Varış", "Berkay Bilgin", "Tunç"];
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: ogrenciler.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(ogrenciler[index]);
                }),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Sonuç için tıkla!"),
              onPressed: () {
                var message= sinavHesapla(45);
                showMessage(context,message);
              },
            ),
          ),
        ],
      ),
    );
  }

  String sinavHesapla(int puan) {
    String message = "";
    if (puan >= 50) {
      message = "Geçti";
    } else if (puan >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }

  void showMessage(BuildContext context,String message) {
    var alert = AlertDialog(
      title: Text("Sınav Sonucu"),
      content: Text(message),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}
