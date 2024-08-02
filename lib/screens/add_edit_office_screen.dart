import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/widgets/alert_dialog.dart';
import 'package:office_dynasty/widgets/button_control.dart';
import 'package:office_dynasty/widgets/color_picker.dart';
import 'package:office_dynasty/widgets/custom_scaffold.dart';
import 'package:office_dynasty/widgets/text_input_control.dart';
import 'package:provider/provider.dart';
import '../providers/office_provider.dart';
import '../models/office.dart';

class AddEditOfficeScreen extends StatefulWidget {
  final Office? office;

  const AddEditOfficeScreen({
    this.office,
  });

  @override
  _AddEditOfficeScreenState createState() => _AddEditOfficeScreenState();
}

class _AddEditOfficeScreenState extends State<AddEditOfficeScreen> {
  final _officeNameController = TextEditingController();
  final _physicalAddressController = TextEditingController();
  final _emailAddressController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _maximumCapacityController = TextEditingController();
  final _officeColorController = TextEditingController();

  @override
  void initState() {
    if (widget.office != null) {
      _officeNameController.text = widget.office!.officeName;
      _physicalAddressController.text = widget.office!.physicalAddress;
      _emailAddressController.text = widget.office!.emailAddress;
      _phoneNumberController.text = widget.office!.phoneNumber;
      _maximumCapacityController.text =
          widget.office!.maximumCapacity.toString();
      _officeColorController.text = widget.office!.officeColor.toString();
    }
    super.initState();
  }

  Color _selectedColor = Color(0xFFFFBE0B);

  void _onColorChoose(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  void _saveForm() {
    final enteredOfficeName = _officeNameController.text;
    final enteredPhysicalAddress = _physicalAddressController.text;
    final enteredEmailAddress = _emailAddressController.text;
    final enteredPhoneNumber = _phoneNumberController.text;
    final enteredMaximumCapacity = _maximumCapacityController.text;
    if (enteredOfficeName.isEmpty &&
        enteredPhysicalAddress.isEmpty &&
        enteredEmailAddress.isEmpty &&
        enteredPhoneNumber.isEmpty &&
        enteredMaximumCapacity.isEmpty) {
      popup(
          context: context,
          messages: ['Please complete all fields before adding the office.'],
          type: PopupControlType.confirm,
          icon: PopupControlIcon.warning);
    }

    if (widget.office == null) {
      final newOffice = Office(
        id: DateTime.now().hashCode,
        officeName: enteredOfficeName,
        physicalAddress: enteredPhysicalAddress,
        emailAddress: enteredEmailAddress,
        phoneNumber: enteredPhoneNumber,
        maximumCapacity: int.parse(enteredMaximumCapacity),
        officeColor: _selectedColor.value,
        workers: [],
      );
      Provider.of<OfficeProvider>(context, listen: false).addOffice(newOffice);
    } else {
      final updatedOffice = Office(
          id: widget.office!.id,
          officeName: enteredOfficeName,
          physicalAddress: enteredPhysicalAddress,
          emailAddress: enteredEmailAddress,
          phoneNumber: enteredPhoneNumber,
          maximumCapacity: int.parse(enteredMaximumCapacity),
          officeColor: _selectedColor.value,
          workers: widget.office!.workers);
      Provider.of<OfficeProvider>(context, listen: false)
          .updateOffice(updatedOffice);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showFloatingActionButton: false,
      title: widget.office == null ? 'Add Office' : 'Edit Office',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16.0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: TextInputControl(
                  placeholder: "Office Name",
                  controller: _officeNameController,
                  onChange: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: TextInputControl(
                  placeholder: "Physical Address",
                  controller: _physicalAddressController,
                  onChange: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: TextInputControl(
                  placeholder: "Email Address",
                  controller: _emailAddressController,
                  onChange: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: TextInputControl(
                  placeholder: "Phone Number",
                  controller: _phoneNumberController,
                  onChange: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: TextInputControl(
                  placeholder: "Maximum Capacity",
                  controller: _maximumCapacityController,
                  onChange: (value) {},
                ),
              ),
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    child: ColorPicker(
                      circleSize: 35.0,
                      onColorChoose: _onColorChoose,
                      selectedColor: _selectedColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  128.0,
                  8.0,
                  128.0,
                  8.0,
                ),
                child: ButtonControl(
                  title: widget.office == null ? 'ADD OFFICE' : 'UPDATE OFFICE',
                  buttonColor: colorButtonBlue,
                  fontColor: colorBackground,
                  onTap: _saveForm,
                ),
              ),
              widget.office != null
                  ? Padding(
                      padding: const EdgeInsets.fromLTRB(
                        128.0,
                        8.0,
                        128.0,
                        8.0,
                      ),
                      child: ButtonControl(
                        title: 'DELETE OFFICE',
                        buttonColor: colorBackground,
                        onTap: () {
                          Provider.of<OfficeProvider>(context, listen: false)
                              .deleteOffice(widget.office!.id);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        fontColor: colorButtonBlue,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
