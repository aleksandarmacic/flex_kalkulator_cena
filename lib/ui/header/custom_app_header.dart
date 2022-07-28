import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../labels.dart';

class CustomAppHeader extends StatelessWidget {
  const CustomAppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 2000,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 200.0, top: 20, bottom: 10),
                child: Text('Pozovite nas bilo kad. Stizemo bilo gde!', style: TextStyle(fontSize: 16, color: Colors.white),),
              ),
              VerticalDivider(color: Colors.white, width: 2),
              Icon(Icons.phone, size: 30, color: Colors.red),
              Padding(
                padding: EdgeInsets.only(left: 8.0, top: 20, bottom: 10),
                child: Text(kFlexPhoneNumber, style: TextStyle(fontSize: 16, color: Colors.white),),
              ),
            ],
          ),
          Divider(color: Colors.white,),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 200.0, top: 20, bottom: 10),
                child: Text('LOGO OVDE', style: TextStyle(color: Colors.white),),
              ),
              SizedBox(width: 700),
              Text('POCETNA', style: TextStyle(color: Colors.white),),
            ],
          ),
          Divider(color: Colors.white,),
          Padding(
            padding: EdgeInsets.only(top: 200, left: 300),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Zakazi dolazak kurira", style: TextStyle(color: Colors.white, fontSize: 45, letterSpacing: 2),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Icon(Icons.house_outlined, size: 30, color: Colors.red,),
                    SizedBox(width: 10),
                    Text("Pocetna - Flex kurirska sluzba", style: TextStyle(fontSize: 20, color: Colors.white, letterSpacing: 2),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
