import 'package:flutter/cupertino.dart';

class CustomDialog{

  late BuildContext _context;

  show(context, {title, message, List<CustomDialogAction> actions = const []}){
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        _context = context;
        return CupertinoAlertDialog(
          title: title==null ? null : Text(title!),
          content: message==null ? null : Text(message!),
          actions: actions.map((action) => CupertinoDialogAction(
            isDestructiveAction: action.isDestructiveAction,
            onPressed: (){
              action.onAction();
              close();
            },
            child: Text(action.actionContent),
          )).toList(),
        );
      }
    );
  }

  close(){
    Navigator.pop(_context);
  }

}

class CustomDialogAction{
  final String actionContent;
  final Function onAction;
  final bool isDestructiveAction;
  CustomDialogAction({required this.actionContent, required this.onAction, this.isDestructiveAction = false});
}