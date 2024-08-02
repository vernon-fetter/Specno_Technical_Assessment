import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/models/worker.dart';
import 'package:office_dynasty/widgets/edit_delete_worker_dialog.dart';

class WorkerTile extends StatelessWidget {
  final Worker worker;
  final ImageProvider? image;

  const WorkerTile({
    super.key,
    required this.worker,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: worker.avatar != null
            ? image
            : const AssetImage('assets/images/avatar_1.png'), 
      ),
      title: Text(
        '${worker.firstName} ${worker.lastName}',
        style: const TextStyle(color: Colors.black),
      ),
      trailing: GestureDetector(
        child: const ImageIcon(
          color: colorMoreIcon,
          AssetImage(
            'assets/icons/more.png',
          ),
        ),
        onTap: () {
          popupQuestion(
            context: context,
            officeId: worker.officeId,
            workerId: worker.id,
            worker: worker,
          );
        },
      ),
    );
  }
}
