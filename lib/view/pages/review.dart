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
  final TextEditingController communicationTextController =
      TextEditingController();
  final TextEditingController attCleanTextController = TextEditingController();
  final TextEditingController babysittingTextController =
      TextEditingController();
  final TextEditingController cookingTextController = TextEditingController();
  final TextEditingController laundryTextController = TextEditingController();
  final TextEditingController cleaningTextController = TextEditingController();

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
          _showToast(state.message!);
          if (mounted) context.pop();
        } else if (state.reviewStateStatus == ReviewStateStatus.cannotSubmit) {
          _showToast('Failed');
        }
      });
    });
  }

  _showToast(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }
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
                        onTap: () {
                          reviewBloc.add(ResetValidate(
                              status: ReviewValidateStatus.emptyName));
                        },
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Visibility(
                        visible: reviewState.validateStatus
                            .contains(ReviewValidateStatus.emptyName),
                        child: Text(
                          'pleaseEnterYourName'.tr(),
                          style: const TextStyle(
                              color: CustomColors.redText,
                              fontSize: 14,
                              fontFamily: "Roboto"),
                        ),
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
                      _workingDate(
                          'from'.tr(),
                          fromDayTextController,
                          fromMonthTextController,
                          fromYearTextController,
                          ReviewValidateStatus.startDateFormat),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Visibility(
                        visible: reviewState.validateStatus
                            .contains(ReviewValidateStatus.startDateFormat),
                        child: Text(
                          'invalidStartDate'.tr(),
                          style: const TextStyle(
                              color: CustomColors.redText,
                              fontSize: 14,
                              fontFamily: "Roboto"),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _workingDate(
                          'to'.tr(),
                          toDayTextController,
                          toMonthTextController,
                          toYearTextController,
                          ReviewValidateStatus.endDateFormat),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Visibility(
                        visible: reviewState.validateStatus
                            .contains(ReviewValidateStatus.endDateFormat),
                        child: Text(
                          'invalidEndDate'.tr(),
                          style: const TextStyle(
                              color: CustomColors.redText,
                              fontSize: 14,
                              fontFamily: "Roboto"),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      _rattingPart(reviewState),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Text(
                            'displayed'.tr(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: "Roboto",
                            ),
                          ),
                          Switch(
                              value: reviewState.review.displayed == 1,
                              onChanged: (value) {
                                reviewBloc
                                    .add(DisplayReviewEvent(value: value));
                              })
                        ],
                      )
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
      TextEditingController yearController,
      ReviewValidateStatus status) {
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
            onTap: () {
              reviewBloc.add(ResetValidate(status: status));
            },
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
            onTap: () {
              reviewBloc.add(ResetValidate(status: status));
            },
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
            onTap: () {
              reviewBloc.add(ResetValidate(status: status));
            },
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
            isRequired: true,
            onTap: () {
              reviewBloc.add(ResetValidate(
                  status: ReviewValidateStatus.emptyOverallComment));
            },
            isShowValidate: state.validateStatus
                .contains(ReviewValidateStatus.emptyOverallRatting)),
        const SizedBox(
          height: 5.0,
        ),
        Visibility(
          visible: state.validateStatus
              .contains(ReviewValidateStatus.emptyOverallComment),
          child: Text(
            'requiredField'.tr(),
            style: const TextStyle(
                color: CustomColors.redText,
                fontSize: 14,
                fontFamily: "Roboto"),
          ),
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
            'communication'.tr(),
            state.review.communicationRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            communicationTextController,
            (ratingNumber) {
              reviewBloc.add(ChangeCommunicationRateEvent(rate: ratingNumber));
            },
            isRequired: true,
            onTap: () {
              reviewBloc.add(ResetValidate(
                  status: ReviewValidateStatus.emptyCommunationComment));
            },
            isShowValidate: state.validateStatus
                .contains(ReviewValidateStatus.emptyCommunicationRatting)),
        const SizedBox(
          height: 5.0,
        ),
        Visibility(
          visible: state.validateStatus
              .contains(ReviewValidateStatus.emptyCommunationComment),
          child: Text(
            'requiredField'.tr(),
            style: const TextStyle(
                color: CustomColors.redText,
                fontSize: 14,
                fontFamily: "Roboto"),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'attClean'.tr(),
            state.review.attitudeCleanlinessRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            attCleanTextController,
            (ratingNumber) {
              reviewBloc.add(ChangeAttCleanRateEvent(rate: ratingNumber));
            },
            isRequired: true,
            onTap: () {
              reviewBloc.add(ResetValidate(
                  status: ReviewValidateStatus.emptyAttCleanComment));
            },
            isShowValidate: state.validateStatus
                .contains(ReviewValidateStatus.emptyAttCleanRatting)),
        const SizedBox(
          height: 5.0,
        ),
        Visibility(
          visible: state.validateStatus
              .contains(ReviewValidateStatus.emptyAttCleanComment),
          child: Text(
            'requiredField'.tr(),
            style: const TextStyle(
                color: CustomColors.redText,
                fontSize: 14,
                fontFamily: "Roboto"),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'babysitting'.tr(),
            state.review.babysittingRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            babysittingTextController, (ratingNumber) {
          reviewBloc.add(ChangeBabysittingRateEvent(rate: ratingNumber));
        }, index: 0, toggleValue: state.isBabysittingProvided),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection(
            'cooking'.tr(),
            state.review.cookingRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            cookingTextController, (ratingNumber) {
          reviewBloc.add(ChangeCookingRateEvent(rate: ratingNumber));
        }, index: 1, toggleValue: state.isCookingProvided),
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
        }, index: 2, toggleValue: state.isLaundryProvided),
        const SizedBox(
          height: 10.0,
        ),
        _rattingSection('cleaning'.tr(), state.review.cleanningRating,
            cleaningTextController, (ratingNumber) {
          reviewBloc.add(ChangeCleaningRateEvent(rate: ratingNumber));
        },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            index: 3,
            toggleValue: state.isCleaningProvided),
      ],
    );
  }

  Widget _rattingSection(String title, int rate,
      TextEditingController controller, Function(int) onRating,
      {TextStyle? style,
      bool? toggleValue,
      int? index,
      bool isRequired = false,
      Function? onTap,
      bool isShowValidate = false}) {
    return Column(
      children: [
        Row(
          children: [
            RichText(
                text: TextSpan(children: [
              TextSpan(
                text: title,
                style: style ??
                    const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold),
              ),
              isRequired
                  ? const TextSpan(
                      text: ' *',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold),
                    )
                  : const TextSpan(),
            ])),
            Visibility(
              visible: toggleValue != null,
              child: Switch(
                  value: toggleValue ?? true,
                  onChanged: (value) {
                    reviewBloc.add(
                        SwitchToogleEvent(index: index ?? 0, value: value));
                  }),
            ),
            const Spacer(),
            _ratingComponent(rate, (index) => onRating(index + 1),
                enable: toggleValue ?? true)
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Visibility(
          visible: isShowValidate,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'requiredField'.tr(),
                style: const TextStyle(
                    color: CustomColors.redText,
                    fontSize: 14,
                    fontFamily: "Roboto"),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        CustomInputField(
          controller: controller,
          onTap: () {
            if (onTap != null) onTap();
          },
          enable: toggleValue ?? true,
          maxLines: 5,
        )
      ],
    );
  }

  Widget _ratingComponent(int rate, Function(int) onChanged,
      {int max = 5, bool enable = true}) {
    return Row(
      children: List.generate(
          max,
          (index) => InkWell(
              onTap: () {
                if (enable) {
                  onChanged(index);
                }
              },
              child: Icon(
                index >= rate
                    ? Icons.star_border_rounded
                    : Icons.star_rate_rounded,
                size: 35.0,
                color: enable
                    ? CustomColors.blueBorder
                    : CustomColors.backgroundGray,
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
        babysisttingComment: babysittingTextController.text,
        cleanningComment: cleaningTextController.text,
        laundryComment: laundryTextController.text,
        communicationComment: communicationTextController.text,
        attitudeCleanlinessComment: attCleanTextController.text,
        cookingComment: cookingTextController.text));
  }
}
