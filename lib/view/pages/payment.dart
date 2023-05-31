import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wavy/bloc/payment_bloc.dart';
import 'package:wavy/event/payment_event.dart';
import 'package:wavy/model/item.dart';
import 'package:wavy/state/payment_state.dart';
import 'package:wavy/utils/colors/custom_colors.dart';
import 'package:wavy/view/components/add_more_items_components/add_more_items_component.dart';
import 'package:wavy/view/components/custom_app_bar.dart';
import 'package:wavy/view/components/personal_information/user_info.dart';
import 'package:wavy/view/components/custom_radius_checkbox.dart';

class Payment extends StatefulWidget {

  final String babysisterId;
  final int shiftId;

  const Payment({
    required this.babysisterId,
    required this.shiftId,
    super.key,
  });

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  late PaymentBloc paymentBloc;

  @override
  void initState() {
    super.initState();
    paymentBloc = context.read<PaymentBloc>();
    paymentBloc.add(LoadPaymentDataEvent(babysisterId: widget.babysisterId, shiftId: widget.shiftId));
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   costListBloc.stream.listen((state) {
    //
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {

    var paymentState = context.select((PaymentBloc bloc) => bloc.state);

    return Scaffold(
      appBar: const CustomAppBar(
          textColor: CustomColors.blueDark,
          nameTitle: "Payment",
          haveBackButton: true,
          backgroundColorAppBar: CustomColors.blueLight),
      body: paymentState.paymentStateStatus == PaymentStateStatus.loading
        ? const Center(
          child: CircularProgressIndicator(),
        )
        : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UserInfo(
                  infoType: const [UserInfoType.avatar, UserInfoType.name, UserInfoType.id],
                  avatarBase64: paymentState.employee?.avatar ?? '',
                  name: paymentState.employee?.name ?? '',
                  id: paymentState.employee?.id ?? '',
                ),
                const SizedBox(height: 16.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _changeMonth();
                      },
                      child: Text(
                        DateFormat('yyyy - MM').format(DateTime(paymentState.year, paymentState.month)),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Roboto",
                          ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Total: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontFamily: "Roboto",
                              ),
                            ),
                            TextSpan(
                              text: NumberFormat('###,### VND').format(paymentState.totalCost()),
                              style: const TextStyle(
                                color: CustomColors.redText,
                                fontSize: 15,
                                fontFamily: "Roboto",
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0,),
                _payButton(paymentState),
                const SizedBox(height: 16.0,),
                Visibility(
                  visible: paymentState.paymentStateStatus != PaymentStateStatus.emptyPayment,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Labour cost',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                                Text(
                                  'Hourly wage: ${paymentState.payment?.hourlyWage ?? 0}',
                                  style: const TextStyle(
                                    color: CustomColors.gray,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                const SizedBox(height: 8.0,),
                                Text(
                                  '20 days - ${paymentState.payment?.hourWorking ?? 0} hours',
                                  style: const TextStyle(
                                    color: CustomColors.gray,
                                    fontSize: 14,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                              ],
                            )
                        ),
                        Text(
                          NumberFormat('###,###').format(paymentState.payment?.labourCost ?? 0),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Column(
                  children: (paymentState.payment?.items ?? []).map((item) => Padding(
                    padding: EdgeInsets.only(bottom: paymentState.payment!.items.last == item ? 0.0 : 16.0),
                    child: _item(item, (paymentState.payment?.items ?? []).indexOf(item), paymentState.canPayStatus == CanPayStatus.payNow),
                  )).toList(),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                AddMoreItemsComponents(
                  // enable: paymentState.canPayStatus == CanPayStatus.payNow,
                  onAddedNewItem: _addNewItem,
                  itemList: itemCost.sublist(8),
                )
              ],
            ),
          ),
        ),
    );
  }

  _changeMonth(){
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              paymentBloc.add(ChangeMonthEvent(
                shiftId: widget.shiftId,
                dateTime: newDate
              ));
            },
          ),
        ),
      ),
    );
  }

  Widget _payButton(PaymentState state){
    return GestureDetector(
      onTap: (){
        if(state.canPayStatus == CanPayStatus.payNow){
          paymentBloc.add(PayEvent());
        }
      },
      child: Container(
        height: 35,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: state.canPayStatus == CanPayStatus.paid ? Colors.green : (state.canPayStatus == CanPayStatus.payNow ? CustomColors.bluetext : Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            state.canPayStatus == CanPayStatus.paid
              ? const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 20,
                ),
              )
              : state.canPayStatus == CanPayStatus.beingCalculated
                  ? const Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                  : Container(),
            Text(
              state.canPayStatus == CanPayStatus.paid ? 'Paid' : (state.canPayStatus == CanPayStatus.payNow ? 'Pay Now' : 'Being calculated'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: "Roboto",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(Item item, int index, bool canCheck){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.itemName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: "Roboto",
                ),
              ),
              const SizedBox(height: 10.0,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomRadiusCheckbox(
                    key: Key(DateTime.now().toIso8601String()),
                    value: item.includeInPayment == 1,
                    enable: canCheck,
                    onChanged: (value){
                      paymentBloc.add(IncludeInPaymentEvent(index: index, value: value));
                    },
                  ),
                  const SizedBox(width: 10.0,),
                  const Text(
                    'Include in payment',
                    style: TextStyle(
                      color: CustomColors.gray,
                      fontSize: 14,
                      fontFamily: "Roboto",
                    ),
                  ),
                ],
              )
            ]
          ),
        ),
        const SizedBox(width: 16.0,),
        Text(
          NumberFormat('###,###').format(item.itemAmount),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: "Roboto",
          ),
        ),
        const SizedBox(width: 10.0,),
        SizedBox(
          height: 22,
          width: 22,
          child: Visibility(
              visible: item.canRemove,
              child: GestureDetector(
                onTap: (){
                  paymentBloc.add(RemoveItemEvent(index: index));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: CustomColors.redText,
                      borderRadius: BorderRadius.circular(3.0)
                  ),
                  child: const Icon(
                    Icons.horizontal_rule,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
          ),
        )
      ],
    );
  }

  _addNewItem(int itemId, int price, int optionId){
    paymentBloc.add(AddItemEvent(itemId: itemId, price: price, optionId: optionId));
  }

}
