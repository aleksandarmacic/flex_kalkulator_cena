import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_calculator/ui/columns/additional_services_column.dart';
import 'package:price_calculator/ui/widgets/confirm_button.dart';
import 'package:price_calculator/ui/widgets/custom_input_field.dart';
import 'package:price_calculator/ui/widgets/heading_container.dart';
import 'package:price_calculator/ui/widgets/message%20container.dart';
import '../labels.dart';
import 'package:provider/provider.dart';
import '../sum.dart';
import 'columns/special_delivery_column.dart';
import 'columns/standard_delivery_column.dart';
import 'header/custom_app_header.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

    TextEditingController controllerStandardReturnReceipt = TextEditingController();
    TextEditingController controllerStandardBackDocumentation = TextEditingController();
    TextEditingController controllerStandardPaidResponse = TextEditingController();
    TextEditingController controllerStandardSMSReports = TextEditingController();
    TextEditingController controllerStandardBuyOut = TextEditingController();
    TextEditingController controllerStandardSendValue = TextEditingController();
    TextEditingController controllerStandardPersonalDelivery = TextEditingController();
    TextEditingController controllerStandardAmountRSD = TextEditingController();
    TextEditingController controllerStandardFinalAmount = TextEditingController();
    TextEditingController controllerSpecialReturnReceipt = TextEditingController();
    TextEditingController controllerSpecialBackDocumentation = TextEditingController();
    TextEditingController controllerSpecialPaidResponse = TextEditingController();
    TextEditingController controllerSpecialSMSReports = TextEditingController();
    TextEditingController controllerSpecialBuyOut = TextEditingController();
    TextEditingController controllerSpecialSendValue = TextEditingController();
    TextEditingController controllerSpecialPersonalDelivery = TextEditingController();
    TextEditingController controllerSpecialAmountRSD = TextEditingController();
    TextEditingController controllerSpecialFinalAmount = TextEditingController();
    String startingValueStandardWeight = "";
    String startingValueStandardDelivery = "";
    String startingValueSpecialDelivery = "";
    String startingValueSpecialType = "";
    String label = '';
    bool isClicked = false;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFF5F5F5),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomAppHeader(),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text(
                        kHeadingMessage,
                        style: TextStyle(color: Colors.black, fontSize: 32),
                      ),
                    ),
                  ),
              Center(
                child: Column(
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
                        SizedBox(width: 250),
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
                          controller: controllerStandardAmountRSD,
                          startingValueStandardWeight: startingValueStandardWeight,
                          startingValueStandardDelivery: startingValueStandardDelivery,
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                  ],
                ),
              ),
                  AdditionalServicesColumn(
                    isClicked: isClicked,
                    isStandard: true,
                    controllerBackDocumentation: controllerStandardBackDocumentation,
                    controllerBuyOut: controllerStandardBuyOut,
                    controllerPaidResponse: controllerStandardPaidResponse,
                    controllerPersonalDelivery: controllerStandardPersonalDelivery,
                    controllerReturnReceipt: controllerStandardReturnReceipt,
                    controllerSendValue: controllerStandardSendValue,
                    controllerSMSReports: controllerStandardSMSReports,
                    controllerFinalAmount: controllerStandardFinalAmount,
                    controllerStandardAmountRSD: controllerStandardAmountRSD,
                    controllerSpecialAmountRSD: controllerSpecialAmountRSD,
                  ),
                  SizedBox(height: 115),
              Column(
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
                        controller: controllerSpecialAmountRSD,
                        startingValueSpecialDelivery: startingValueSpecialDelivery,
                        startingValueSpecialType: startingValueSpecialType,
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                ],
              ),
                  AdditionalServicesColumn(
                    isClicked: isClicked,
                    isStandard: false,
                    controllerBackDocumentation: controllerSpecialBackDocumentation,
                    controllerBuyOut: controllerSpecialBuyOut,
                    controllerPaidResponse: controllerSpecialPaidResponse,
                    controllerPersonalDelivery: controllerSpecialPersonalDelivery,
                    controllerReturnReceipt: controllerSpecialReturnReceipt,
                    controllerSendValue: controllerSpecialSendValue,
                    controllerSMSReports: controllerSpecialSMSReports,
                    controllerFinalAmount: controllerSpecialFinalAmount,
                    controllerStandardAmountRSD: controllerStandardAmountRSD,
                    controllerSpecialAmountRSD: controllerSpecialAmountRSD,
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 177),
                      SizedBox(width: 365),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 375,
                          color: Color(0xFFFF2121),
                          child: Padding(
                            padding: EdgeInsets.only(left: 183.0, top: 11, bottom: 11, right: 38),
                            child: Text(
                              kCheckPrice,
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            isClicked = true;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  isClicked ?
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 352),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kStandardDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15,),
                              (startingValueStandardWeight.isEmpty) ? Container() : Text(kDeliveryMass + startingValueStandardWeight),
                              (startingValueStandardDelivery.isEmpty) ? Container() : Text(kDelivery + startingValueStandardDelivery),
                              (controllerStandardReturnReceipt.text.isEmpty) ? Container() : Text(kReturnReceipt + controllerStandardReturnReceipt.text),
                              (controllerStandardBackDocumentation.text.isEmpty) ? Container() : Text(kBackDocumentation + controllerStandardBackDocumentation.text),
                              (controllerStandardPaidResponse.text.isEmpty) ? Container() : Text(kPaidResponse + controllerStandardPaidResponse.text),
                              (controllerStandardSMSReports.text.isEmpty) ? Container() : Text(kSMSReports + controllerStandardSMSReports.text),
                              (controllerStandardBuyOut.text.isEmpty) ? Container() : Text(kBuyOut + controllerStandardBuyOut.text),
                              (controllerStandardSendValue.text.isEmpty) ? Container() : Text(kSendValue + controllerStandardSendValue.text),
                              (controllerStandardPersonalDelivery.text.isEmpty) ? Container() : Text(kPersonalDelivery + controllerStandardPersonalDelivery.text),
                            ],
                          ),
                          SizedBox(width: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(kSpecialDelivery, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              SizedBox(height: 15,),
                              (startingValueSpecialType.isEmpty) ? Container() : Text(kDeliveryMass + startingValueSpecialType),
                              (startingValueSpecialDelivery.isEmpty) ? Container() : Text(kDelivery + startingValueSpecialDelivery),
                              (controllerSpecialReturnReceipt.text.isEmpty) ? Container() : Text(kReturnReceipt + controllerSpecialReturnReceipt.text),
                              (controllerSpecialBackDocumentation.text.isEmpty) ? Container() : Text(kBackDocumentation + controllerSpecialBackDocumentation.text),
                              (controllerSpecialPaidResponse.text.isEmpty) ? Container() : Text(kPaidResponse + controllerSpecialPaidResponse.text),
                              (controllerSpecialSMSReports.text.isEmpty) ? Container() : Text(kSMSReports + controllerSpecialSMSReports.text),
                              (controllerSpecialBuyOut.text.isEmpty) ? Container() : Text(kBuyOut + controllerSpecialBuyOut.text),
                              (controllerSpecialSendValue.text.isEmpty) ? Container() : Text(kSendValue + controllerSpecialSendValue.text),
                              (controllerSpecialPersonalDelivery.text.isEmpty) ? Container() : Text(kPersonalDelivery + controllerSpecialPersonalDelivery.text),
                            ],
                          ),
                        ],
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(konClickTermsMessage, style: TextStyle(color: Colors.black, fontSize: 20),),
                        ),
                      ),
                    ],
                  ) : Container(),
                  SizedBox(height: 150),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
