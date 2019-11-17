import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jadwal_sholat/header_content.dart';
import 'package:jadwal_sholat/list_jadwal.dart';
import 'package:jadwal_sholat/model/ResponJadwal.dart';

void main() => runApp(MaterialApp(
      home: MyHomeScreen(),
    ));

class MyHomeScreen extends StatefulWidget {
  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  //membuat request data
  Future<ResponJadwal> getJadwal() async {
    //ngambil json yg ada di url
    final response = await http.get(
        "https://muslimsalat.com/jonggol/5.json?key=6f841555d9fe88da44e4ed2cf5474297");
    //memilah (decode) json dari variable response
    final jsonResponse = json.decode(response.body);
    //masukkan ke dalam class data ResponJadwal
    return ResponJadwal.fromJsonMap(jsonResponse);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJadwal();
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.width - 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 6.0,
                    offset: Offset(0.0, 2.0),
                    color: Colors.black26)
              ],
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://png.pngtree.com/thumb_back/fw800/background/20190813/pngtree-islamic-mosque-background-for-islamic-new-year-image_289659.jpg")),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.location_on),
                  onPressed: () {}),
              IconButton(
                  color: Colors.white, icon: Icon(Icons.map), onPressed: () {}),
            ],
          ),
        ),
        FutureBuilder(
            future: getJadwal(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return HeaderContent(snapshot.data);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            })
      ],
    );
    final body = Expanded(
      child: FutureBuilder(
          future: getJadwal(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListJadwal(snapshot.data);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
    return Scaffold(
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
