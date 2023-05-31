abstract class SearchEvent {}

class OnChangedValue extends SearchEvent {
  final String value;
  OnChangedValue({required this.value});
}

class OnSubmmited extends SearchEvent {
  final String value;
  OnSubmmited({required this.value});
}

class RestartEmployeeSearchEvent extends SearchEvent {
  final String value;
  RestartEmployeeSearchEvent({required this.value});
}
