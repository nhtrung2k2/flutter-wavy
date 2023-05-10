import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:wavy/model/Schedule.dart';

enum DayOfWeek {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

abstract class SheduleState extends Equatable {
  final List<Schedule> listSchedule;
  const SheduleState(this.listSchedule);
  @override
  List<Object?> get props => [listSchedule];
}

class SheduleListState extends SheduleState {
  const SheduleListState(super.listSchedule);
  @override
  List<Object?> get props => [listSchedule];
}

class SubmittedSchedule extends SheduleListState {
  const SubmittedSchedule(super.listSchedule);
  @override
  List<Object?> get props => [listSchedule];
}

class FailSchedule extends SheduleListState {
  const FailSchedule(super.listSchedule);
  @override
  List<Object?> get props => [listSchedule];
}

class SuccessSchedule extends SheduleListState {
  const SuccessSchedule(super.listSchedule);
  @override
  List<Object?> get props => [listSchedule];
}

// state pick one day time

class HaveAvailable extends SheduleListState {
  const HaveAvailable(super.listSchedule);
  @override
  List<Object> get props => [listSchedule];
}

class PickTimeStartState extends SheduleListState {
  const PickTimeStartState(super.listSchedule);

  @override
  List<Object> get props => [listSchedule];
}

class PickTimeEndState extends SheduleListState {
  const PickTimeEndState(super.listSchedule);
  @override
  List<Object> get props => [listSchedule];
}
