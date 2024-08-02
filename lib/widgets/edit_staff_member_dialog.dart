import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/models/worker.dart';
import 'package:office_dynasty/providers/office_provider.dart';
import 'package:office_dynasty/widgets/button_control.dart';
import 'package:office_dynasty/widgets/image_picker.dart';
import 'package:office_dynasty/widgets/text_input_control.dart';
import 'package:provider/provider.dart';

Future<dynamic> popupEdit({
  required BuildContext context,
  required Worker worker,
  required int officeId,
}) async {
  return await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return _PopupDialog(
        worker: worker,
        officeId: officeId,
      );
    },
  );
}

class _PopupDialog extends StatefulWidget {
  final Worker worker;
  final int officeId;

  const _PopupDialog({
    required this.worker,
    required this.officeId,
  });

  @override
  __PopupDialogState createState() => __PopupDialogState();
}

class __PopupDialogState extends State<_PopupDialog> {
  final _formKey = GlobalKey<FormState>();

  ImageProvider _selectedImage = const AssetImage('assets/images/avatar_1.png');

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  void initState() {
    if (widget.worker != null) {
      _firstNameController.text = widget.worker.firstName;
      _lastNameController.text = widget.worker.lastName;

      // _officeColorController.text = widget.office!.officeColor.toString();
    }
    super.initState();
  }

  void _onImageChoose(ImageProvider imageProvider) {
    setState(() {
      _selectedImage = imageProvider;
    });
  }

  bool _isFirstPage = true;

  void _goToNextPage() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isFirstPage = false;
      });
    }
  }

  void _goToPreviousPage() {
    setState(() {
      _isFirstPage = true;
    });
  }

  void _saveForm() {
    final enteredFirstName = _firstNameController.text;
    final enteredLastName = _lastNameController.text;
    final enteredAvatar = _selectedImage;
    if (enteredFirstName.isEmpty && enteredLastName.isEmpty) {
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
        id: widget.worker.id,
        firstName: enteredFirstName,
        lastName: enteredLastName,
        // avatar: enteredAvatar,
        officeId: widget.worker.officeId,
      );
      Provider.of<OfficeProvider>(context, listen: false)
          .updateWorker(updatedWorker);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: colorBackground,
      titlePadding: const EdgeInsets.fromLTRB(
        16.0,
        32.0,
        16.0,
        4.0,
      ),
      contentPadding: const EdgeInsets.all(
        16.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          16.0,
        ),
      ),
      title: _isFirstPage
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edit Staff Member',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GestureDetector(
                  child: const ImageIcon(
                    color: colorIcon,
                    AssetImage(
                      'assets/icons/close-circle.png',
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: _goToPreviousPage,
                  child: const ImageIcon(
                    color: colorIcon,
                    AssetImage(
                      'assets/icons/arrow-left.png',
                    ),
                  ),
                ),
                const Text(
                  'Edit Staff Member',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const ImageIcon(
                    color: colorIcon,
                    AssetImage(
                      'assets/icons/close-circle.png',
                    ),
                  ),
                ),
              ],
            ),
      content: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              _isFirstPage
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: TextInputControl(
                            placeholder: "First Name",
                            controller: _firstNameController,
                            onChange: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                          child: TextInputControl(
                            placeholder: "Last Name",
                            controller: _lastNameController,
                            onChange: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              size: 8.0,
                              color: colorButtonBlue,
                              AssetImage(
                                'assets/icons/filled_circle.png',
                              ),
                            ),
                            ImageIcon(
                              size: 8.0,
                              color: colorButtonBlue,
                              AssetImage(
                                'assets/icons/unfilled_circle.png',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ButtonControl(
                          buttonColor: colorButtonBlue,
                          onTap: _goToNextPage,
                          title: 'NEXT',
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        const Text('Avatar'),
                        ImagePicker(
                          circleSize: 40.0,
                          onImageChoose: _onImageChoose,
                          selectedImage: _selectedImage,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageIcon(
                              size: 8.0,
                              color: colorButtonBlue,
                              AssetImage(
                                'assets/icons/unfilled_circle.png',
                              ),
                            ),
                            ImageIcon(
                              size: 8.0,
                              color: colorButtonBlue,
                              AssetImage(
                                'assets/icons/filled_circle.png',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ButtonControl(
                                  buttonColor: colorButtonBlue,
                                  onTap: _goToPreviousPage,
                                  title: 'BACK',
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                ButtonControl(
                                  buttonColor: colorButtonBlue,
                                  onTap: () {
                                    _saveForm();
                                  },
                                  title: 'SUBMIT',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
