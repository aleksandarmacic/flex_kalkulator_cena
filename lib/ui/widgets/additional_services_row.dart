import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../labels.dart';
import '../../sum.dart';


class AdditionalServicesRow extends StatefulWidget {
  AdditionalServicesRow({required this.label, this.isForBuyOut = false, required this.controller, required this.controllerStandardAmountRSD, required this.controllerSpecialAmountRSD, this.isStandard = true});

  final String label;
  final bool isForBuyOut;
  TextEditingController controller;
  TextEditingController controllerStandardAmountRSD;
  TextEditingController controllerSpecialAmountRSD;
  final bool isStandard;

  @override
  State<AdditionalServicesRow> createState() => _AdditionalServicesRowState();
}

class _AdditionalServicesRowState extends State<AdditionalServicesRow> {
  bool isChecked = false;
  String startingValueStandardWeight = '';
  String startingValueStandardDelivery = '';
  String startingValueSpecialDelivery = '';
  String startingValueSpecialType = '';
  String cutReturnReceipt = '';
  String cutBackDocumentation = '';
  String cutPaidResponse = '';
  String cutSMSReports = '';
  String cutBuyOut = '';
  String cutSendValue = '';
  String cutPersonalDelivery = '';
  String cutRSD = '';
  double parsedSendValue = 0;
  String stringSendValue = '';
  int roundedValue = 0;
  double parsedBuyOut = 0;
  String stringBuyOut = '';
  int roundedBuyOut = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 177,
          child: Text(
            widget.label,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        SizedBox(width: 460 ),
        Row(
          children: [
            Checkbox(
                value: widget.label == kSMSReports ? false : isChecked,
                onChanged: widget.label == kSMSReports
                    ? null
                    : (newValue) {
                        setState(() {
                          isChecked = newValue!;
                          switch (widget.label) {
                            case kReturnReceipt:
                              isChecked ? widget.controller.text = "120,00 RSD" : widget.controller.text = "0";
                              isChecked ? cutReturnReceipt = widget.controller.text.substring(0, 3) : widget.controller.text;
                              break;
                            case kBackDocumentation:
                              isChecked ? widget.controller.text = "120,00 RSD" : widget.controller.text = "0";
                              isChecked ? cutBackDocumentation = widget.controller.text.substring(0, 3) : widget.controller.text;
                              break;
                            case kPaidResponse:
                              isChecked ? widget.controller.text = "200,00 RSD" : widget.controller.text = "0";
                              isChecked ? cutPaidResponse = widget.controller.text.substring(0, 3) : widget.controller.text;
                              break;
                            case kSMSReports:
                              isChecked ? widget.controller.text = "15,00 RSD" : widget.controller.text = "0";
                              isChecked ? cutSMSReports = widget.controller.text.substring(0, 2) : widget.controller.text;
                              break;
                            case kBuyOut:
                              stringBuyOut = widget.controller.text;
                              break;
                            case kSendValue:
                              (isChecked == true && widget.isStandard == true && widget.controllerStandardAmountRSD.text.length == 11) ? cutSendValue = widget.controllerStandardAmountRSD.text.substring(0, 4)
                                  :
                              (isChecked == true && widget.isStandard == true && widget.controllerStandardAmountRSD.text.length == 10) ? cutSendValue = widget.controllerStandardAmountRSD.text.substring(0, 3)
                                  :
                              (isChecked == true && widget.isStandard == false && widget.controllerSpecialAmountRSD.text.length == 11) ? cutSendValue = widget.controllerSpecialAmountRSD.text.substring(0, 4)
                                  :
                              (isChecked == true && widget.isStandard == false && widget.controllerSpecialAmountRSD.text.length == 10) ? cutSendValue = widget.controllerSpecialAmountRSD.text.substring(0, 3)
                                  :
                              widget.controller.text;
                              parsedSendValue = int.parse(cutSendValue)*0.011;
                              roundedValue = parsedSendValue.round();
                              stringSendValue = roundedValue.toString();
                              isChecked ? widget.controller.text = '$stringSendValue,00 RSD' : widget.controller.text = '0';

                              break;
                            case kPersonalDelivery:
                              isChecked ? widget.controller.text = "120,00 RSD" : widget.controller.text = "0";
                              isChecked ? cutPersonalDelivery = widget.controller.text.substring(0, 3) : widget.controller.text;
                              break;
                          }
                        });
                        (isChecked == true && widget.isStandard == true) ? context.read<Sum>().addStandard(int.parse(cutPaidResponse + cutReturnReceipt + cutBackDocumentation + stringBuyOut + cutPersonalDelivery + cutSMSReports + stringSendValue))
                            :
                        (isChecked == false && widget.isStandard == true) ? context.read<Sum>().subtractStandard(int.parse(cutPaidResponse + cutReturnReceipt + cutBackDocumentation + stringBuyOut + cutPersonalDelivery + cutSMSReports + stringSendValue))
                            :
                        (isChecked == true && widget.isStandard == false) ? context.read<Sum>().addSpecial(int.parse(cutPaidResponse + cutReturnReceipt + cutBackDocumentation + stringBuyOut + cutPersonalDelivery + cutSMSReports + stringSendValue))
                            :
                        (isChecked == false && widget.isStandard == false) ? context.read<Sum>().subtractSpecial(int.parse(cutPaidResponse + cutReturnReceipt + cutBackDocumentation + stringBuyOut + cutPersonalDelivery + cutSMSReports + stringSendValue))
                            :
                        null
                        ;
                }),
            Text(" = "),
            Container(
              color: Color(0xFF9899B4),
              width: 230,
              height: 45,
              child: TextField(
                onEditingComplete: (){
                  context.read<Sum>().addStandard(int.parse(stringBuyOut));
                },
                controller: widget.controller,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "0",
                  hintStyle: TextStyle(color: Colors.white),
                  contentPadding: EdgeInsets.only(left: 10),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                readOnly: widget.isForBuyOut ? false : true,
              ),
            ),
          ],
        ),
        SizedBox(height: 60),
      ],
    );
    
  }
}
