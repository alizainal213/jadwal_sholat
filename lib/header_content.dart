import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jadwal_sholat/model/ResponJadwal.dart';
import 'package:vector_math/vector_math_64.dart';

class HeaderContent extends StatelessWidget {
  ResponJadwal responJadwal;

  HeaderContent(this.responJadwal);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      bottom: 20.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            responJadwal.city,
            style: TextStyle(color: Colors.white, fontSize: 39.0),
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.white,
                size: 10.0,
              ),
              Text(
                responJadwal.address,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}