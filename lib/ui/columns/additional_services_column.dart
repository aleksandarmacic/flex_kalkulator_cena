import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:price_calculator/ui/widgets/additional_services_row.dart';
import 'package:price_calculator/ui/widgets/confirm_button.dart';
import 'package:price_calculator/ui/widgets/sum_row.dart';
import '../../labels.dart';
import '../widgets/heading_container.dart';

class AdditionalServicesColumn extends StatefulWidget {
  AdditionalServicesColumn({
    required this.controllerReturnReceipt,
    required this.controllerBackDocumentation,
    required this.controllerPaidResponse,
    required this.controllerSMSReports,
    required this.controllerBuyOut,
    required this.controllerSendValue,
    required this.controllerPersonalDelivery,
    required this.controllerFinalAmount,
    required this.controllerStandardAmountRSD,
    required this.controllerSpecialAmountRSD,
    this.isStandard = true,
    this.isClicked = false,
  }) : super();

  final TextEditingController controllerReturnReceipt;
  final TextEditingController controllerBackDocumentation;
  final TextEditingController controllerPaidResponse;
  final TextEditingController controllerSMSReports;
  final TextEditingController controllerBuyOut;
  final TextEditingController controllerSendValue;
  final TextEditingController controllerPersonalDelivery;
  final TextEditingController controllerFinalAmount;
  final TextEditingController controllerStandardAmountRSD;
  final TextEditingController controllerSpecialAmountRSD;
  final bool isStandard;
  bool isClicked;

  @override
  State<AdditionalServicesColumn> createState() => _AdditionalServicesColumnState();
}

class _AdditionalServicesColumnState extends State<AdditionalServicesColumn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingContainer(label: kAdditionalServices),
        SizedBox(height: 60),
        AdditionalServicesRow(
          label: kReturnReceipt,
          controller: widget.controllerReturnReceipt,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kBackDocumentation,
          controller: widget.controllerBackDocumentation,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kPaidResponse,
          controller: widget.controllerPaidResponse,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kSMSReports,
          controller: widget.controllerSMSReports,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kBuyOut,
          isForBuyOut: true,
          controller: widget.controllerBuyOut,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kSendValue,
          isForBuyOut: true,
          controller: widget.controllerSendValue,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        AdditionalServicesRow(
          label: kPersonalDelivery,
          controller: widget.controllerPersonalDelivery,
          isStandard: widget.isStandard,
          controllerStandardAmountRSD: widget.controllerStandardAmountRSD,
          controllerSpecialAmountRSD: widget.controllerSpecialAmountRSD,
        ),
        SizedBox(height: 30),
        SumRow(label: kSum, isStandard: widget.isStandard),
        SizedBox(height: 40),
      ],
    );
  }
}
