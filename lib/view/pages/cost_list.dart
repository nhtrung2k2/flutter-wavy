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

class CostList extends StatefulWidget {

  final DateTime date;

  const CostList({
    required this.date,
    super.key,
  });

  @override
  State<CostList> createState() => _CostListState();
}

class _CostListState extends State<CostList> {

  late DateTime _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.date;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "Cost list",
          haveBackButton: true,
          backgroundColorAppBar: CustomColors.blueLight),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Date: ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: DateFormat('EE, MMMM dd, yyyy').format(_currentDate),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: "Roboto",
                    ),
                  ),
                ]
              ),
            ),
            const SizedBox(height: 16.0,),
            const Text(
              'Cost list',
              style: TextStyle(
                color: CustomColors.bluetext,
                fontSize: 14,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 16.0,),
            const Text(
              'Cost list',
              style: TextStyle(
                  color: CustomColors.bluetext,
                  fontSize: 14,
                  fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget costItem({

  }){

  }

}
