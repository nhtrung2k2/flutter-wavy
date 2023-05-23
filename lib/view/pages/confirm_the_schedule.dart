import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/confirm_the_schedule_bloc.dart';
import 'package:wavy/event/confirm_schedule_event.dart';
import 'package:wavy/state/confirm_the_schedule_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/personal_information/user_info.dart';

class ConfirmTheSchedule extends StatefulWidget {

  final String babysisterId;

  const ConfirmTheSchedule({
    super.key,
    required this.babysisterId
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
    confirmTheScheduleBloc.add(LoadDataConfirmScheduleEvent(babysisterId: widget.babysisterId));
  }

  @override
  Widget build(BuildContext context) {

    var confirmTheScheduleState = context.select((ConfirmTheScheduleBloc bloc) => bloc.state);

    return Scaffold(
      appBar: const CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "Confirm the schedule",
          haveBackButton: true,
          backgroundColorAppBar: CustomColors.blueLight),
      body: Column(
        children: [
          const SizedBox(height: 16.0,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _babysisterInformationSection(confirmTheScheduleState)
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _monthYearSelector(confirmTheScheduleState),
          ),
          _listSchedule(confirmTheScheduleState)
        ],
      ),
    );
  }

  Widget _babysisterInformationSection(ConfirmTheScheduleState state){
    return state.inforStatus==InformationStatus.success
        ? UserInfo(
          infoType: const [
            UserInfoType.avatar,
            UserInfoType.name,
            UserInfoType.id
          ],
          avatarUrl: state.employee?.avatar,
          name: state.employee?.name,
          id: state.employee?.id
        )
        : const CircularProgressIndicator();
  }

  Widget _monthYearSelector(ConfirmTheScheduleState state){
    return state.monthScheduleStatus == MonthScheduleStatus.success
      ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (){
              confirmTheScheduleBloc.add(PrevMonthEvent());
            },
            alignment: Alignment.centerLeft,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: CustomColors.bluetext,
              size: 15,
            ),
          ),
          Text(
            DateFormat('MMMM yyyy').format(DateTime(state.year, state.month, 1)),
            style: TextStyle(
              color: CustomColors.bluetext,
              fontSize: 17,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
            ),
          ),
          IconButton(
            onPressed: (){
              confirmTheScheduleBloc.add(NextMonthEvent());
            },
            alignment: Alignment.centerRight,
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: CustomColors.bluetext,
              size: 15
            )
          )
        ],
      )
      : Container();
  }

  Widget scheduleItem({
    required DateTime date,
    required String startTime,
    required String endTime,
    required int cost,
    required bool isChecked,
    required int index
  }){
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
            offset: const Offset(0, 2)
          )
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('EE dd/MM/yyyy').format(date),
                  style: const TextStyle(
                      color: CustomColors.grayLight,
                      fontSize: 13,
                      fontFamily: "Roboto",
                  ),
                ),
                Text(
                  '$startTime ~ $endTime',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: "Roboto",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'View cost',
                    style: const TextStyle(
                      color: CustomColors.bluetext,
                      decoration: TextDecoration.underline,
                      fontFamily: "Roboto",
                    ),
                  )
                ),
              ],
            ),
          ),
          Text(
            NumberFormat('###,### VND').format(6500000),
            style: TextStyle(
              fontFamily: "Roboto",
            ),
          ),
          Checkbox(
            value: isChecked,
            onChanged: (value){
              confirmTheScheduleBloc.add(CheckItemEvent(index: index, value: value ?? false));
            }
          )
        ],
      ),
    );
  }

  Widget _listSchedule(ConfirmTheScheduleState state){
    return Expanded(
      child: ListView.separated(
        itemCount: state.schedule.length,
        separatorBuilder: (context, int index) => const SizedBox(height: 5.0,),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              context.goNamed(
                'baby_sister_cost_list',
                queryParams: {
                  'date': DateTime(2023, 10, 04).toIso8601String()
                }
              );
            },
            child: scheduleItem(
                date: DateTime(2023, 10, 04),
                startTime: '09:00',
                endTime: '12:00',
                cost: 6500000,
                isChecked: state.schedule[index],
                index: index
            ),
          );
        }
      )
    );
  }

}
