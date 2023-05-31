import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/review_bloc.dart';
import 'package:wavy/bloc/termination_contract_bloc.dart';
import 'package:wavy/event/review_event.dart';
import 'package:wavy/event/termination_contract_event.dart';
import 'package:wavy/state/review_state.dart';
import 'package:wavy/state/termination_contract_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/utils/routesName.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/custom_input_field.dart';
import 'package:wavy/view/components/personal_information/user_info.dart';

class TerminationContract extends StatefulWidget {

  final String babysistterId;
  final int shiftId;

  const TerminationContract({
    required this.babysistterId,
    required this.shiftId,
    super.key,
  });

  @override
  State<TerminationContract> createState() => _TerminationContractState();
}

class _TerminationContractState extends State<TerminationContract> {

  late TerminationContractBloc terminationContractBloc;

  @override
  void initState() {
    super.initState();
    terminationContractBloc = context.read<TerminationContractBloc>();
    terminationContractBloc.add(LoadingTerminationContractEvent(babysistterId: widget.babysistterId, shiftId: widget.shiftId));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      terminationContractBloc.stream.listen((state) {
        if(state.terminationContractStatus == TerminationContractStatus.loadFailed){
          _showToast('Loaded Failed');
          if(mounted) context.pop();
        }
      });
    });
  }

  _showToast(String message){
    if(mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {

    var terminationContractState = context.select((TerminationContractBloc bloc) => bloc.state);

    return Scaffold(
        appBar: const CustomAppBar(
            textColor: CustomColors.blueDark,
            nameTitle: "Termination of contract",
            haveBackButton: true,
            backgroundColorAppBar: CustomColors.blueLight),
        body: Center(
          child: terminationContractState.terminationContractStatus == TerminationContractStatus.loading
              || terminationContractState.terminationContractStatus == TerminationContractStatus.terminating
            ? const CircularProgressIndicator()
            : terminationContractState.terminationContractStatus == TerminationContractStatus.confirming
              ? _confirmingTerminationContract(terminationContractState)
              : terminationContractState.terminationContractStatus == TerminationContractStatus.terminated
                ? _terminatedContractSuccessfully(terminationContractState)
                : Container(),
        )
    );
  }

  Widget _confirmingTerminationContract(TerminationContractState state){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Have you confirmed with your nanny?',
          style: TextStyle(
              color: CustomColors.bluetext,
              fontSize: 15,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16.0,),
        const Text(
          '[Termination of contract]',
          style: TextStyle(
              fontSize: 14,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 8.0,),
        RichText(
          text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Nanny name: ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      color: Colors.black
                  ),
                ),
                TextSpan(
                  text: state.employee?.name ?? '',
                  style: const TextStyle(
                      color: CustomColors.bluetext,
                      fontSize: 14,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold
                  ),
                ),
              ]
          ),
        ),
        const SizedBox(height: 8.0,),
        RichText(
          text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Date of termination: ',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Roboto",
                      color: Colors.black
                  ),
                ),
                TextSpan(
                  text: DateFormat('yyyy-MM-dd').format(DateTime.now()),
                  style: const TextStyle(
                      color: CustomColors.redText,
                      fontSize: 14,
                      fontFamily: "Roboto"
                  ),
                ),
              ]
          ),
        ),
        const SizedBox(height: 16.0,),
        const Text(
          '* PLease confirm contract-end bonus with your nanny',
          style: TextStyle(
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const SizedBox(height: 32.0,),
        _submitButton(onPress: () => _submit())
      ],
    );
  }

  Widget _terminatedContractSuccessfully(TerminationContractState state){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          state.messages?['title'] ?? '',
          style: const TextStyle(
              color: CustomColors.bluetext,
              fontSize: 15,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 16.0,),
        Text(
          state.messages?['description_1'] ?? '',
          style: const TextStyle(
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const SizedBox(height: 16.0,),
        Text(
          state.messages?['description_2'] ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 14,
              fontFamily: "Roboto"
          ),
        ),
        const SizedBox(height: 32.0,),
        _homeButton(onPress: () => _homeNavigate())
      ],
    );
  }

  Widget _submitButton({Function? onPress}){
    return GestureDetector(
      onTap: (){
        if(onPress!=null) onPress();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 32.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: CustomColors.bluetext,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'Confirmed above.\nRegister evaluation & Proceed termination,',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  _submit(){
    terminationContractBloc.add(ConfirmTerminationContractEvent(shiftId: widget.shiftId));
  }

  Widget _homeButton({Function? onPress}){
    return GestureDetector(
      onTap: (){
        if(onPress!=null) onPress();
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 100.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: CustomColors.bluetext,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          'TOP',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }

  _homeNavigate(){
    while (GoRouter.of(context).location != RoutesName.homeRoute.path) {
      GoRouter.of(context).pop();
    }
  }
}
