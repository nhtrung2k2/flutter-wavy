import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/bloc/employee_search_bloc.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/view/pages/baby_sister_detail.dart';

import '../../state/employee_search_state.dart';

class CustomCardInfor extends StatelessWidget {
  const CustomCardInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), //<-- SEE HERE
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocProvider.value(
              value: ServiceLocator.locator.get<EmployeeSearchBloc>(),
              child: Builder(builder: (context) {
                return ColumnInfor(
                  employee: context
                      .select((EmployeeSearchBloc bloc) =>
                          (bloc.state as SubmittedSuccess))
                      .employeeDetail,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
