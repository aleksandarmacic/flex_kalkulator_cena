import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Sum with ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController sumStandard = TextEditingController(text: "0");
  TextEditingController sumSpecial = TextEditingController(text: "0");

  void addStandard(int additionValueStandard) {
    var summ = int.parse(sumStandard.text);
    var s = summ + additionValueStandard;
    sumStandard.text = s.toString();
    notifyListeners();
  }
  void addSpecial(int additionValueSpecial) {
    var summ = int.parse(sumSpecial.text);
    var s = summ + additionValueSpecial;
    sumSpecial.text = s.toString();
    notifyListeners();
  }

  void subtractStandard(int subtractionValueStandard){
    var summ = int.parse(sumStandard.text);
    var s = summ - subtractionValueStandard;
    sumStandard.text = s.toString();
    notifyListeners();
  }

  void subtractSpecial(int subtractionValueSpecial){
    var summ = int.parse(sumSpecial.text);
    var s = summ - subtractionValueSpecial;
    sumSpecial.text = s.toString();
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', 0));
  }
}