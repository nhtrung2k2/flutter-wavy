import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/utils/resize.dart';

import '../../bloc/employee_search_bloc.dart';
import '../../state/employee_search_state.dart';
import '../../utils/colors/custom_colors.dart';
import 'custom_card_infor.dart';
import 'custom_text.dart';

class BeginToMatchBabySister extends StatelessWidget {
  const BeginToMatchBabySister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 4.resizeheight(context),
        ),
        CustomText(
          title: "beginToMatchNewBabysitter".tr(),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          lineHeight: 19 / 16,
          colorText: CustomColors.bluetext,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 28.resizeheight(context),
        ),
        BlocProvider.value(
          value: ServiceLocator.locator.get<EmployeeSearchBloc>(),
          child: BlocBuilder<EmployeeSearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SubmittedSuccess) {
                final employeeDetail = state.employeeDetail;
                return CustomCardInfor(
                    avatar: employeeDetail.avatar,
                    id: employeeDetail.id,
                    name: employeeDetail.name);
              } else
                return const Text("some thing error");
            },
          ),
        )
      ],
    );
  }
}
