import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_calculator/labels.dart';
import 'package:price_calculator/ui/widgets/heading_container.dart';
import '../widgets/custom_input_field.dart';

class StandardDeliveryColumn extends StatefulWidget {
  StandardDeliveryColumn({
    required this.controllerStandardAmountRSD,
  }) : super();

  final TextEditingController controllerStandardAmountRSD;

  @override
  State<StandardDeliveryColumn> createState() => _StandardDeliveryColumnState();
}

class _StandardDeliveryColumnState extends State<StandardDeliveryColumn> {
  String startingValueStandardWeight = "";
  String startingValueStandardDelivery = "";
  String label = '';

  @override
  Widget build(BuildContext context) {
    // switch(label){
    //   case kRSD:
    //     (startingValueStandardWeight == "0kg - 0.5kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "600,00 RSD" :
    //     (startingValueStandardWeight == "0.5kg - 1kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "620,00 RSD" :
    //     (startingValueStandardWeight == "1kg - 2kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "640,00 RSD" :
    //     (startingValueStandardWeight == "2kg - 5kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "780,00 RSD" :
    //     (startingValueStandardWeight == "5kg - 10kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "900,00 RSD" :
    //     (startingValueStandardWeight == "10kg - 15kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "930,00 RSD" :
    //     (startingValueStandardWeight == "15kg - 20kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "950,00 RSD" :
    //     (startingValueStandardWeight == "20kg - 30kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "1.070,00 RSD" :
    //     (startingValueStandardWeight == "30kg - 50kg" && startingValueStandardDelivery == 'Danas za danas') ? widget.controllerStandardAmountRSD.text = "1.220,00 RSD" :
    //     widget.controllerStandardAmountRSD.text = "0";
    //     break;
    // }
    return Column(
      children: [
        HeadingContainer(label: kStandardDelivery),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 177,
              height: 19,
              child: Text(
                kDeliveryMass,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 260),
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
                        startingValueStandardWeight = newValue!;
                      });
                    },
                    hint: startingValueStandardWeight == ""
                        ? Text("Izaberite", style: TextStyle(fontSize: 14))
                        : Text(startingValueStandardWeight, style: TextStyle(fontSize: 14)),
                    items: <String>[
                      '',
                      '0kg - 0.5kg',
                      '0.5kg - 1kg',
                      '1kg - 2kg',
                      '2kg - 5kg',
                      '5kg - 10kg',
                      '10kg - 15kg',
                      '15kg - 20kg',
                      '20kg - 30kg',
                      '30kg - 50kg'
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
            SizedBox(
              width: 177,
              height: 19,
              child: Text(
                kDelivery,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 260),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20, top: 15),
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
                        startingValueStandardDelivery = newValue!;
                      });
                    },
                    hint: startingValueStandardDelivery == ""
                        ? Text("Izaberite uslugu", style: TextStyle(fontSize: 14))
                        : Text(startingValueStandardDelivery, style: TextStyle(fontSize: 14)),
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
            SizedBox(
              width: 100,
              height: 19,
              child: Text(
                kRSD,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SizedBox(width: 500),
            CustomInputField(
              label: kRSD,
              controller: widget.controllerStandardAmountRSD,
              startingValueStandardWeight: startingValueStandardWeight,
              startingValueStandardDelivery: startingValueStandardDelivery,
            ),
          ],
        ),
        SizedBox(height: 60),
      ],
    );
  }
}
