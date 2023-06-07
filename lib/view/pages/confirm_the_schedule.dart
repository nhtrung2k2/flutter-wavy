import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/event/confirm_schedule_event.dart';
import 'package:wavy/state/confirm_the_schedule_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/routesName.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_radius_checkbox.dart';
import 'package:wavy/view/components/personal_information/user_info.dart';

class ConfirmTheSchedule extends StatefulWidget {
  final String babysisterId;
  final int shiftId;

  const ConfirmTheSchedule({
    super.key,
    required this.babysisterId,
    required this.shiftId,
  });

  @override
  State<ConfirmTheSchedule> createState() => _ConfirmTheScheduleState();
}

class _ConfirmTheScheduleState extends State<ConfirmTheSchedule> {
  late ConfirmTheScheduleBloc confirmTheScheduleBloc;

  @override
  void initState() {
    super.initState();
    confirmTheScheduleBloc = context.read<ConfirmTheScheduleBloc>();
    confirmTheScheduleBloc.add(LoadDataConfirmScheduleEvent(
        babysisterId: widget.babysisterId, shiftId: widget.shiftId));
  }

  @override
  Widget build(BuildContext context) {
    var confirmTheScheduleState =
        context.select((ConfirmTheScheduleBloc bloc) => bloc.state);

    return Scaffold(
      appBar: CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "confirmSchedule".tr(),
          haveBackButton: true,
          backgroundColorAppBar: CustomColors.blueLight),
      body: confirmTheScheduleState.inforStatus == InformationStatus.loading ||
              confirmTheScheduleState.monthScheduleStatus ==
                  MonthScheduleStatus.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child:
                        _babysisterInformationSection(confirmTheScheduleState)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: _monthYearSelector(confirmTheScheduleState),
                ),
                _listSchedule(confirmTheScheduleState)
              ],
            ),
    );
  }

  Widget _babysisterInformationSection(ConfirmTheScheduleState state) {
    return state.inforStatus == InformationStatus.success
        ? UserInfo(
            infoType: const [
                UserInfoType.avatar,
                UserInfoType.name,
                UserInfoType.id
              ],
            avatarBase64: state.employee?.avatar,
            name: state.employee?.name,
            id: state.employee?.id)
        : const CircularProgressIndicator();
  }

  Widget _monthYearSelector(ConfirmTheScheduleState state) {
    return state.monthScheduleStatus == MonthScheduleStatus.success
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  confirmTheScheduleBloc
                      .add(PrevMonthEvent(shiftId: widget.shiftId));
                },
                alignment: Alignment.centerLeft,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: CustomColors.bluetext,
                  size: 15,
                ),
              ),
              Text(
                convertMonthToOtherLanguage(DateFormat('MMMM yyyy')
                    .format(DateTime(state.year, state.month, 1))),
                style: const TextStyle(
                    color: CustomColors.bluetext,
                    fontSize: 17,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    confirmTheScheduleBloc
                        .add(NextMonthEvent(shiftId: widget.shiftId));
                  },
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: CustomColors.bluetext, size: 15))
            ],
          )
        : Container();
  }

  Widget scheduleItem(
      {required String date,
      required String workingTime,
      required int cost,
      required bool isChecked,
      required int amountId}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 2))
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: CustomColors.grayLight,
                    fontSize: 13,
                    fontFamily: "Roboto",
                  ),
                ),
                Text(
                  workingTime,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "Roboto",
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      'viewCost'.tr(),
                      style: const TextStyle(
                        color: CustomColors.bluetext,
                        decoration: TextDecoration.underline,
                        fontFamily: "Roboto",
                      ),
                    )),
              ],
            ),
          ),
          Text(
            NumberFormat('###,### VND').format(cost),
            style: const TextStyle(
              fontFamily: "Roboto",
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          CustomRadiusCheckbox(
            key: Key(DateTime.now().toIso8601String()),
            value: isChecked,
            width: 20.0,
            height: 20.0,
            iconSize: 15.0,
            onChanged: (value) {
              confirmTheScheduleBloc
                  .add(CheckItemEvent(amountId: amountId, value: value));
            },
          )
        ],
      ),
    );
  }

  Widget _listSchedule(ConfirmTheScheduleState state) {
    return Expanded(
        child: ListView.separated(
            itemCount: state.scheduleConfirms.length,
            separatorBuilder: (context, int index) => const SizedBox(
                  height: 5.0,
                ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  await context.pushNamed(RoutesName.babysisterCostList.name,
                      queryParams: {
                        'amountId': '${state.scheduleConfirms[index].amountId}'
                      });
                  confirmTheScheduleBloc.add(LoadDataConfirmScheduleEvent(
                      babysisterId: widget.babysisterId,
                      shiftId: widget.shiftId));
                },
                child: scheduleItem(
                    date: convertDateToOtherLanguage(
                        state.scheduleConfirms[index].amountDate),
                    workingTime: state.scheduleConfirms[index].workingTime,
                    cost: state.scheduleConfirms[index].amount,
                    isChecked: state.scheduleConfirms[index].confirmFlag == 1,
                    amountId: state.scheduleConfirms[index].amountId),
              );
            }));
  }
}

String convertDateToOtherLanguage(String date) {
  final list = date.split(" ");
  list[0] = list[0].tr();
  return list.join(" ");
}

String convertMonthToOtherLanguage(String monthYear) {
  final list = monthYear.split(" ");
  list[0] = list[0].tr();
  return list.join(" ");
}
