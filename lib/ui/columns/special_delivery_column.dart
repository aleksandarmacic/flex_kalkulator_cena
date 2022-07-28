import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_calculator/labels.dart';

import 'package:price_calculator/ui/widgets/heading_container.dart';

import '../widgets/custom_input_field.dart';


class SpecialDeliveryColumn extends StatefulWidget {
  SpecialDeliveryColumn({
    required this.controllerSpecialAmountRSD,
  }) : super();

  final TextEditingController controllerSpecialAmountRSD;

  @override
  State<SpecialDeliveryColumn> createState() => _SpecialDeliveryColumnState();
}

class _SpecialDeliveryColumnState extends State<SpecialDeliveryColumn> {
  String startingValueSpecialDelivery = "";
  String startingValueSpecialType = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingContainer(label: kSpecialDelivery),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 177,
              height: 19,
              child: Text(
                kDeliveryType,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 250),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
              child: Container(
                width: 450,
                height: 60,
                padding: EdgeInsets.only(left: 8, top: 8),
                decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(color: Colors.transparent),
                    onChanged: (String? newValue) {
                      setState(() {
                        startingValueSpecialType = newValue!;
                      });
                    },
                    hint: startingValueSpecialType == ""
                        ? Text("Izaberite", style: TextStyle(fontSize: 14))
                        : Text(startingValueSpecialType, style: TextStyle(fontSize: 14)),
                    items: <String>[
                      '',
                      'Bicikl',
                      'Televizor do 55 incha',
                      'Guma putnička',
                      'Guma poluteretna',
                      'Guma teretna',
                      'Guma putnička sa felnom',
                      'Guma poluteretna sa felnom',
                      'Guma teretna sa felnom',
                      'Traktorska guma',
                      'Traktorska guma sa felnom',
                      'Menjač manji',
                      'Menjač automatski',
                      'Auto motor'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 19,
              child: Text(
                kDelivery,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 330),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 15),
              child: Container(
                width: 450,
                height: 60,
                padding: EdgeInsets.only(left: 8, top: 8),
                decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, right: 8, left: 30),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: Container(color: Colors.transparent),
                    onChanged: (String? newValue) {
                      setState(() {
                        startingValueSpecialDelivery = newValue!;
                      });
                    },
                    hint: startingValueSpecialDelivery == ""
                        ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                        : Text(startingValueSpecialDelivery, style: TextStyle(fontSize: 14)),
                    items: <String>['', 'Danas za danas', 'Danas za sutra do 12h', 'Danas za sutra do 18h']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        enabled: value == 'Danas za sutra do 12h' ? false : true,
                        value: value,
                        child: Text(
                          value,
                          style: value == 'Danas za sutra do 12h' ? TextStyle(color: Colors.black12) : TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 177,
              height: 19,
              child: Text(
                kRSD,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 500),
            CustomInputField(
              label: kRSD,
              controller: widget.controllerSpecialAmountRSD,
              startingValueSpecialDelivery: startingValueSpecialDelivery,
              startingValueSpecialType: startingValueSpecialType,
            ),
          ],
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
