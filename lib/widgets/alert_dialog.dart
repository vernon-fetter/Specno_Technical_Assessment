import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';

enum PopupControlType { ok, confirm }

enum PopupControlIcon { warning, info }

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.all(0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
  ),
);

Future<dynamic> popup({
  required BuildContext context,
  required List<String?> messages,
  required PopupControlType type,
  required PopupControlIcon icon,
  Widget? iconAlt,
  String? title,
  Function? onConfirm,
  Function? onCancel,
  Function? onNeverAgain,
}) async {
  //bool isBusy = false;

  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(
          children: <Widget>[
            icon == PopupControlIcon.warning
                ? Container(
                    height: 30,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.warning,
                      color: Colors.orange,
                      size: 30,
                    ),
                  )
                : Container(),
            icon == PopupControlIcon.info
                ? Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Icon(
                      Icons.info_outline,
                      color: Colors.green,
                      size: 30,
                    ),
                  )
                : Container(),
            title != null && title != ""
                ? Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: Text(title),
                  )
                : Container()
          ],
        ),
        backgroundColor: colorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.all(0),
        actionsPadding: const EdgeInsets.all(0),
        insetPadding: const EdgeInsets.all(20),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  // crossAxisAlignment: isDashed
                  //     ? CrossAxisAlignment.start
                  //     : CrossAxisAlignment.center,
                  children: messages.map((message) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        messages.length > 1
                            ? Container(
                                padding: const EdgeInsets.only(right: 5),
                                child: const Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromRGBO(130, 130, 130, 1),
                                  ),
                                ))
                            : Container(),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              message!,
                              textAlign: messages.length > 1
                                  ? TextAlign.left
                                  : TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(130, 130, 130, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
              type == PopupControlType.ok
                  ? Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: flatButtonStyle,
                        child: const Text("Ok"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                      ),
                    )
                  : Container(),
              type == PopupControlType.confirm
                  ? Container(
                      padding: const EdgeInsets.all(0),
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        border: Border(
                          top: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(200, 200, 200, 1),
                          ),
                        ),
                      ),
                      child: TextButton(
                        style: flatButtonStyle,
                        child: const Text("Confirm"),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                          if (onConfirm != null) {
                            onConfirm();
                          }
                        },
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      );
    },
  );
}
