import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/office_provider.dart';
import '../models/worker.dart';

class AddWorkerScreen extends StatefulWidget {
  final Worker? worker;
  final int officeId;

  AddWorkerScreen({this.worker, required this.officeId});

  @override
  _AddWorkerScreenState createState() => _AddWorkerScreenState();
}

class _AddWorkerScreenState extends State<AddWorkerScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _avatarController = TextEditingController();

  @override
  void initState() {
    if (widget.worker != null) {
      _firstNameController.text = widget.worker!.firstName;
    }
    super.initState();
  }

  void _saveForm() {
    final enteredFirstName = _firstNameController.text;
    final enteredLastName = _lastNameController.text;
    final enteredAvatar = _avatarController.text;
    if (enteredFirstName.isEmpty && enteredLastName.isEmpty && enteredAvatar.isEmpty) {
      return;
    }

    if (widget.worker == null) {
      final newWorker = Worker(
        id: DateTime.now().hashCode,
        firstName: enteredFirstName,
        lastName: enteredLastName,
        // avatar: enteredAvatar,
        officeId: widget.officeId,
      );
      Provider.of<OfficeProvider>(context, listen: false).addWorker(newWorker);
    } else {
      final updatedWorker = Worker(
        id: widget.worker!.id,
        firstName: enteredFirstName,
        lastName: enteredLastName,
        // avatar: enteredAvatar,
        officeId: widget.worker!.officeId,
      );
      Provider.of<OfficeProvider>(context, listen: false)
          .updateWorker(updatedWorker);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.worker == null ? 'Add Worker' : 'Edit Worker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _avatarController,
              decoration: InputDecoration(labelText: 'Avatar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveForm,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
