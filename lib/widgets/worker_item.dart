import 'package:flutter/material.dart';
import 'package:office_dynasty/widgets/add_worker_screen.dart';
import '../models/worker.dart';
import '../providers/office_provider.dart';
import 'package:provider/provider.dart';

class WorkerItem extends StatelessWidget {
  final Worker worker;

  WorkerItem({required this.worker});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(worker.firstName),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => AddWorkerScreen(worker: worker, officeId: worker.officeId),
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Provider.of<OfficeProvider>(context, listen: false).deleteWorker(worker.id, worker.officeId);
            },
          ),
        ],
      ),
    );
  }
}
