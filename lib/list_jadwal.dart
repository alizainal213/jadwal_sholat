import 'package:flutter/cupertino.dart';
import 'package:jadwal_sholat/model/ResponJadwal.dart';
import 'package:vector_math/vector_math_64.dart';

class ListJadwal extends StatelessWidget {
  ResponJadwal data;

  ListJadwal(this.data);

  Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 70.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5.0)],
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Color(0xff808080), Color(0xff3fada8)])),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              waktu,
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
            Text(jam, style: TextStyle(color: Colors.white, fontSize: 24.0))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      containerWaktu("Shubuh", data.items[0].fajr.toUpperCase()),
      containerWaktu("Dzuhur", data.items[0].dhuhr.toUpperCase()),
      containerWaktu("Ashar", data.items[0].asr.toUpperCase()),
      containerWaktu("Maghrib", data.items[0].maghrib.toUpperCase()),
      containerWaktu("Isya", data.items[0].isha.toUpperCase()),
    ]);
  }
}