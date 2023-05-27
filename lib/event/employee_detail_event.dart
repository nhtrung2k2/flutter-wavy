abstract class EmployeeDetailEvent {}

class OnSubmmited extends EmployeeDetailEvent {
  final String babysisterDetailId;
  final int shiftId;
  OnSubmmited({required this.babysisterDetailId, required this.shiftId});
}
