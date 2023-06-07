import 'package:easy_localization/easy_localization.dart';

enum ItemInputSalaryId { transportation, parking, meal, other }

String convertIdToName(int id) {
  return ItemInputSalaryId.values[id - 1].name.tr();
}
