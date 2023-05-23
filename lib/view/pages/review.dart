import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/event/review_event.dart';
import 'package:wavy/state/review_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
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
  final TextEditingController overallEvaluationTextController = TextEditingController();
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
    reviewBloc.add(InitDataEvent(babysistterId: widget.babysistterId, shiftId: widget.shiftId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reviewBloc.stream.listen((state) {
        if(state.reviewStateStatus == ReviewStateStatus.submitted){
          _showToast('Successfully');
        }
      });
    });
  }

  _showToast(String message){
    if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {

    var reviewState = context.select((ReviewBloc bloc) => bloc.state);

    return Scaffold(
      appBar: const CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "Review",
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
                    UserInfo(
                      infoType: const [UserInfoType.avatar, UserInfoType.name, UserInfoType.id],
                      avatarUrl: reviewState.employee?.avatar ?? '',
                      name: reviewState.employee?.name ?? '',
                      id: reviewState.employee?.id ?? '',
                    ),
                    const SizedBox(height: 16.0,),
                    _titleText('Add Review'),
                    const SizedBox(height: 16.0,),
                    CustomInputField(
                      controller: nameTextController,
                      inputType: InputType.string,
                      hintText: 'Enter your name',
                      verticalLabel: 'Your name',
                      isRequiredField: true,
                    ),
                    const SizedBox(height: 10.0,),
                    const Text(
                      '* We suggest you input your real full name for reviews (for the credibility of them), but for privacy purposes, you can also opt to provide just a username.',
                      style: TextStyle(
                        color: CustomColors.redText,
                        fontSize: 14,
                        fontFamily: "Roboto",
                        fontStyle: FontStyle.italic
                      ),
                    ),
                    const SizedBox(height: 16.0,),
                    _titleText('Working period'),
                    const SizedBox(height: 16.0,),
                    _workingDate('From', fromDayTextController, fromMonthTextController, fromYearTextController),
                    const SizedBox(height: 16.0,),
                    _workingDate('To', toDayTextController, toMonthTextController, toYearTextController),
                    const SizedBox(height: 16.0,),
                    _rattingPart(reviewState),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: _submitButton(
              onPress: () => _submit()
            ),
          )
        ],
      )
    );
  }

  Widget _titleText(String text){
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 17,
          fontFamily: "Roboto",
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _workingDate(String title, TextEditingController dayController, TextEditingController monthController, TextEditingController yearController){
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 50,
          child: CustomInputField(
            controller: dayController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text(
          'Day',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        SizedBox(
          width: 50,
          child: CustomInputField(
            controller: monthController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text(
          'Month',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        SizedBox(
          width: 70,
          child: CustomInputField(
            controller: yearController,
          ),
        ),
        const SizedBox(
          width: 5.0,
        ),
        const Text(
          'Year',
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
      ],
    );
  }

  Widget _rattingPart(ReviewState state){
    return Column(
      children: [
        _rattingSection(
            'Overall evaluation',
            state.review.overallRating,
            overallEvaluationTextController,
            (ratingNumber){
              reviewBloc.add(ChangeOverallRateEvent(rate: ratingNumber));
            },
        ),
        const SizedBox(height: 16.0,),
        const Text(
          'Evaluation by service',
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 10.0,),
        _rattingSection(
            'Cleaning',
            state.review.cleanningRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            cleaningTextController,
            (ratingNumber){
              reviewBloc.add(ChangeCleaningRateEvent(rate: ratingNumber));
            }
        ),
        const SizedBox(height: 10.0,),
        _rattingSection(
            'Laundry',
            state.review.laundryRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            laundryTextController,
            (ratingNumber){
              reviewBloc.add(ChangeLaundryRateEvent(rate: ratingNumber));
            }
        ),
        const SizedBox(height: 10.0,),
        _rattingSection(
            'Petcare',
            state.review.babysittingRating,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            ),
            petcareTextController,
            (ratingNumber){
              reviewBloc.add(ChangePetcareRateEvent(rate: ratingNumber));
            }
        ),
        const SizedBox(height: 10.0,),
        _rattingSection(
            'Shopping',
            state.review.communicationRating,
            shoppingTextController,
            (ratingNumber){
              reviewBloc.add(ChangeShoppingRateEvent(rate: ratingNumber));
            },
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "Roboto",
            )
        ),
      ],
    );
  }

  Widget _rattingSection(String title, int rate, TextEditingController controller, Function(int) onRating, {TextStyle? style}){
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: style ?? const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold
              ),
            ),
            const Spacer(),
            _ratingComponent(
              rate,
              (index) => onRating(index+1)
            )
          ],
        ),
        const SizedBox(height: 10.0,),
        CustomInputField(
          controller: controller,
          maxLines: 5,
        )
      ],
    );
  }

  Widget _ratingComponent(int rate, Function(int) onChanged, {int max = 5}){
    return Row(
      children: List.generate(max, (index) => InkWell(
          onTap: () => onChanged(index),
          child: Icon(
            index >= rate ? Icons.star_border_rounded : Icons.star_rate_rounded,
            size: 35.0,
            color: CustomColors.blueBorder,
          )
      )),
    );
  }

  Widget _submitButton({String title = 'Submit', Function? onPress}){
    return GestureDetector(
      onTap: (){
        if(onPress!=null) onPress();
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
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  _submit(){

    DateTime dateStart = DateTime(
        int.parse(fromYearTextController.text),
        int.parse(fromMonthTextController.text),
        int.parse(fromDayTextController.text)
    );

    DateTime dateEnd = DateTime(
        int.parse(toYearTextController.text),
        int.parse(toMonthTextController.text),
        int.parse(toDayTextController.text)
    );

    reviewBloc.add(SubmitEvent(
      babysistterId: widget.babysistterId,
      name: nameTextController.text,
      dateStart: DateFormat('yyyy-MM-dd').format(dateStart),
      dateEnd: DateFormat('yyyy-MM-dd').format(dateEnd),
      overallComment: overallEvaluationTextController.text,
      babysisttingComment: petcareTextController.text,
      cleanningComment: cleaningTextController.text,
      laundryComment: laundryTextController.text,
      communicationComment: shoppingTextController.text
    ));
  }

}
