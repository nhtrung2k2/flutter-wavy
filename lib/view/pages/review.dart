import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/event/review_event.dart';
import 'package:wavy/state/review_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/resize.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_input_field.dart';
import 'package:wavy/view/components/personal_information/user_info.dart';

class Review extends StatefulWidget {
  final String babysistterId;
  final int shiftId;

  const Review({
    required this.babysistterId,
    required this.shiftId,
    super.key,
  });

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  late ReviewBloc reviewBloc;

  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController overallEvaluationTextController =
      TextEditingController();
  final TextEditingController cleaningTextController = TextEditingController();
  final TextEditingController laundryTextController = TextEditingController();
  final TextEditingController petcareTextController = TextEditingController();
  final TextEditingController shoppingTextController = TextEditingController();

  final TextEditingController fromDayTextController = TextEditingController();
  final TextEditingController fromMonthTextController = TextEditingController();
  final TextEditingController fromYearTextController = TextEditingController();
  final TextEditingController toDayTextController = TextEditingController();
  final TextEditingController toMonthTextController = TextEditingController();
  final TextEditingController toYearTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    reviewBloc = context.read<ReviewBloc>();
    reviewBloc.add(InitDataEvent(
        babysistterId: widget.babysistterId, shiftId: widget.shiftId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reviewBloc.stream.listen((state) {
        if (state.reviewStateStatus == ReviewStateStatus.submitted) {
          _showToast('Successfully');
          if (mounted) context.pop();
        } else if (state.reviewStateStatus == ReviewStateStatus.cannotSubmit) {
          _showToast('Failed');
        }

        if (state.validateStatus == ReviewValidateStatus.emptyName) {
          _showToast('pleaseEnterYourName'.tr());
        } else if (state.validateStatus ==
            ReviewValidateStatus.startDateFormat) {
          _showToast('invalidStartDate'.tr());
        } else if (state.validateStatus == ReviewValidateStatus.endDateFormat) {
          _showToast('invalidEndDate'.tr());
        } else if (state.validateStatus ==
            ReviewValidateStatus.emptyOverallComment) {
          _showToast('pleaseEnterOverallEvaluation'.tr());
        }
      });
    });
  }

  _showToast(String message) {
    if (mounted)
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    var reviewState = context.select((ReviewBloc bloc) => bloc.state);

    return Scaffold(
        appBar: CustomAppBar(
            textColor: CustomColors.blueDark,
            nameTitle: "review".tr(),
            haveBackButton: true,
            backgroundColorAppBar: CustomColors.blueLight),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reviewState.reviewStateStatus == ReviewStateStatus.initing
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : UserInfo(
                              infoType: const [
                                UserInfoType.avatar,
                                UserInfoType.name,
                                UserInfoType.id
                              ],
                              avatarBase64: reviewState.employee?.avatar ?? '',
                              name: reviewState.employee?.name ?? '',
                              id: reviewState.employee?.id ?? '',
                            ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _titleText('addReview'.tr()),
                      const SizedBox(
                        height: 16.0,
                      ),
                      CustomInputField(
                        controller: nameTextController,
                        inputType: InputType.string,
                        hintText: 'enterYourName'.tr(),
                        verticalLabel: 'yourName'.tr(),
                        isRequiredField: true,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '※ ${'weSuggestReview'.tr()}',
                        style: const TextStyle(
                            color: CustomColors.redText,
                            fontSize: 14,
                            fontFamily: "Roboto",
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _titleText('workingPeriod'.tr()),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _workingDate('from'.tr(), fromDayTextController,
                          fromMonthTextController, fromYearTextController),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _workingDate('to'.tr(), toDayTextController,
                          toMonthTextController, toYearTextController),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _rattingPart(reviewState),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: _submitButton(onPress: () => _submit()),
            )
          ],
        ));
  }

  Widget _titleText(String text) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold),
    );
  }

  Widget _workingDate(
      String title,
      TextEditingController dayController,
      TextEditingController monthController,
      TextEditingController yearController) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Roboto"),
        ),
        const Spacer(),
        SizedBox(
          width: 50.resizewidth(context),
          child: CustomInputField(
            controller: dayController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          'day'.tr(),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Roboto"),
        ),
        const SizedBox(
          width: 5.0,
        ),
        SizedBox(
          width: 50.resizewidth(context),
          child: CustomInputField(
            controller: monthController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          'month'.tr(),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Roboto"),
        ),
        const SizedBox(
          width: 5.0,
        ),
        SizedBox(
          width: 70.resizewidth(context),
          child: CustomInputField(
            controller: yearController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        Text(
          'year'.tr(),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontFamily: "Roboto"),
        ),
      ],
    );
  }

  Widget _rattingPart(ReviewState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _rattingSection(
          'overallEvaluation'.tr(),
          state.review.overallRating,
          overallEvaluationTextController,
          (ratingNumber) {
            reviewBloc.add(ChangeOverallRateEvent(rate: ratingNumber));
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'evaluationByService'.tr(),
          style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'cleaning'.tr(),
            state.review.cleanningRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            cleaningTextController, (ratingNumber) {
          reviewBloc.add(ChangeCleaningRateEvent(rate: ratingNumber));
        }),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'laundry'.tr(),
            state.review.laundryRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            laundryTextController, (ratingNumber) {
          reviewBloc.add(ChangeLaundryRateEvent(rate: ratingNumber));
        }),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'petcare'.tr(),
            state.review.babysittingRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            petcareTextController, (ratingNumber) {
          reviewBloc.add(ChangePetcareRateEvent(rate: ratingNumber));
        }),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection('shopping'.tr(), state.review.communicationRating,
            shoppingTextController, (ratingNumber) {
          reviewBloc.add(ChangeShoppingRateEvent(rate: ratingNumber));
        },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            )),
      ],
    );
  }

  Widget _rattingSection(String title, int rate,
      TextEditingController controller, Function(int) onRating,
      {TextStyle? style}) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: style ??
                  const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            _ratingComponent(rate, (index) => onRating(index + 1))
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        CustomInputField(
          controller: controller,
          maxLines: 5,
        )
      ],
    );
  }

  Widget _ratingComponent(int rate, Function(int) onChanged, {int max = 5}) {
    return Row(
      children: List.generate(
          max,
          (index) => InkWell(
              onTap: () => onChanged(index),
              child: Icon(
                index >= rate
                    ? Icons.star_border_rounded
                    : Icons.star_rate_rounded,
                size: 35.0,
                color: CustomColors.blueBorder,
              ))),
    );
  }

  Widget _submitButton({Function? onPress}) {
    return GestureDetector(
      onTap: () {
        if (onPress != null) onPress();
      },
      child: Container(
        height: 35,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: CustomColors.bluetext,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          'submit'.tr(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  _submit() {
    String dateStart =
        '${fromYearTextController.text}-${fromMonthTextController.text}-${fromDayTextController.text}';
    String dateEnd =
        '${toYearTextController.text}-${toMonthTextController.text}-${toDayTextController.text}';

    reviewBloc.add(SubmitEvent(
        babysistterId: widget.babysistterId,
        name: nameTextController.text,
        dateStart: dateStart,
        dateEnd: dateEnd,
        overallComment: overallEvaluationTextController.text,
        babysisttingComment: petcareTextController.text,
        cleanningComment: cleaningTextController.text,
        laundryComment: laundryTextController.text,
        communicationComment: shoppingTextController.text));
  }
}
