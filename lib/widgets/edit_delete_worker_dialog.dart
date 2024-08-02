import 'package:flutter/material.dart';

import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/models/worker.dart';
import 'package:office_dynasty/providers/office_provider.dart';
import 'package:office_dynasty/widgets/button_control.dart';
import 'package:office_dynasty/widgets/edit_staff_member_dialog.dart';

import 'package:provider/provider.dart';

Future<dynamic> popupQuestion({
  required BuildContext context,
  required int workerId,
  required int officeId,
  required Worker worker,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _PopupDialog(
        officeId: officeId,
        workerId: workerId,
        worker: worker,
      );
    },
  );
}

class _PopupDialog extends StatefulWidget {
  final int officeId;
  final int workerId;
  final Worker worker;

  const _PopupDialog({
    required this.officeId,
    required this.workerId,
    required this.worker,
  });
  @override
  __PopupDialogState createState() => __PopupDialogState();
}

class __PopupDialogState extends State<_PopupDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonControl(
                title: 'EDIT STAFF MEMBER',
                buttonColor: colorButtonBlue,
                onTap: () {
                  Navigator.of(context).pop();
                  popupEdit(
                    context: context,
                    officeId: widget.officeId,
                    worker: widget.worker,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonControl(
                title: 'DELETE STAFF MEMBER',
                buttonColor: colorExpansionTile,
                onTap: () {
                  Provider.of<OfficeProvider>(context, listen: false)
                      .deleteWorker(widget.workerId, widget.officeId);
                  Navigator.of(context).pop();
                },
                fontColor: colorButtonBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
