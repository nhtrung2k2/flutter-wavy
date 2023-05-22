import 'package:wavy/model/item_salary.dart';

abstract class SalaryEvent {}

enum Wage { hourlyWage, monthlyWage }

class InitialFetch extends SalaryEvent {}

class OnChangedWage extends SalaryEvent {
  final int value;
  final Wage type;
  OnChangedWage(this.value, this.type);
}

class OnChangedValueItem extends SalaryEvent {
  final int value;
  final int id;
  OnChangedValueItem(this.value, this.id);
}

class AddItem extends SalaryEvent {
  final ItemSalary item;
  AddItem({required this.item});
}

class OnChangedOption extends SalaryEvent {
  final int id;
  final int option;
  OnChangedOption({required this.option, required this.id});
}

class OnSubmmited extends SalaryEvent {
  final List<ItemSalary> listItemSalary;
  OnSubmmited({required this.listItemSalary});
}

class ResetSucess extends SalaryEvent {}
