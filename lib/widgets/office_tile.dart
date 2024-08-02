import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/models/office.dart';
import 'package:office_dynasty/screens/add_edit_office_screen.dart';
import 'package:office_dynasty/screens/office_detail_page.dart';

class OfficeDetailsTile extends StatefulWidget {
  const OfficeDetailsTile(this.office, this.staffInOffice, this.editOffice,
      {super.key});

  final int? staffInOffice;
  final Office office;
  final bool editOffice;

  @override
  _OfficeDetailsTileState createState() => _OfficeDetailsTileState();
}

class _OfficeDetailsTileState extends State<OfficeDetailsTile> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Container(
            padding: const EdgeInsets.all(
              16.0,
            ),
            margin: const EdgeInsets.all(
              16.0,
            ),
            decoration: BoxDecoration(
              color: colorExpansionTile,
              border: Border(
                left: BorderSide(
                  color: Color(widget.office.officeColor),
                  width: 12.0,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  6.0,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8.0,
                        8.0,
                        0,
                        8.0,
                      ),
                      child: Text(
                        widget.office.officeName,
                        style: const TextStyle(
                          color: colorFontLight,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8.0,
                        8.0,
                        0,
                        16.0,
                      ),
                      child: GestureDetector(
                        child: const ImageIcon(
                          color: colorIcon,
                          AssetImage(
                            'assets/icons/union.png',
                          ),
                        ),
                        onTap: () => widget.editOffice
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => AddEditOfficeScreen(
                                      office: widget.office),
                                ),
                              )
                            : Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => OfficeDetailPage(
                                    officeId: widget.office.id,
                                    office: widget.office,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/people_alt.png',
                        ),
                      ),
                      Text(
                        ' ${widget.office.workers.length} ',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: colorFontLight),
                      ),
                      const Text(
                        'Staff Member(s) in Office',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: colorFontLight),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Divider(
                    color: colorFloatingActionButton,
                  ),
                ),
                GestureDetector(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: colorFontLight),
                        'More info   ',
                      ),
                      ImageIcon(
                        color: colorIcon,
                        AssetImage(
                          'assets/icons/arrow-down.png',
                        ),
                      ),
                    ],
                  ),
                  onTap: () => setState(
                    () => isExpanded = false,
                  ),
                ),
              ],
            ),
          )
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        : Container(
            padding: const EdgeInsets.all(
              16.0,
            ),
            margin: const EdgeInsets.all(
              16.0,
            ),
            decoration: BoxDecoration(
              color: colorExpansionTile,
              border: Border(
                left: BorderSide(
                  color: Color(widget.office.officeColor),
                  width: 12.0,
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  6.0,
                ),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8.0,
                        8.0,
                        0,
                        8.0,
                      ),
                      child: Text(
                        widget.office.officeName,
                        style: const TextStyle(
                          color: colorFontLight,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        8.0,
                        8.0,
                        0,
                        16.0,
                      ),
                      child: GestureDetector(
                        child: const ImageIcon(
                          color: colorIcon,
                          AssetImage(
                            'assets/icons/union.png',
                          ),
                        ),
                        onTap: () => widget.editOffice
                            ? Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => AddEditOfficeScreen(
                                      office: widget.office),
                                ),
                              )
                            : Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => OfficeDetailPage(
                                    officeId: widget.office.id,
                                    office: widget.office,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    0,
                    0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const ImageIcon(
                        AssetImage(
                          'assets/icons/people_alt.png',
                        ),
                      ),
                      Text(
                        ' ${widget.office.workers.length} ',
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: colorFontLight),
                      ),
                      const Text(
                        'Staff Member(s) in Office',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: colorFontLight),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Divider(
                    color: colorFloatingActionButton,
                  ),
                ),
                GestureDetector(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: colorFontLight),
                        'More info   ',
                      ),
                      RotatedBox(
                        quarterTurns: 2,
                        child: ImageIcon(
                          color: colorIcon,
                          AssetImage(
                            'assets/icons/arrow-down.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                  onTap: () => setState(
                    () => isExpanded = true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Row(
                    children: [
                      const ImageIcon(
                        color: colorIcon,
                        AssetImage(
                          'assets/icons/phone.png',
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(
                          8.0,
                          6.0,
                          8.0,
                          6.0,
                        ),
                        child: Text(
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorFontLight),
                          widget.office.phoneNumber,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Row(
                    children: [
                      const ImageIcon(
                        color: colorIcon,
                        AssetImage(
                          'assets/icons/email.png',
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(
                          8.0,
                          6.0,
                          8.0,
                          6.0,
                        ),
                        child: Text(
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorFontLight),
                          widget.office.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Row(
                    children: [
                      const ImageIcon(
                        color: colorIcon,
                        AssetImage(
                          'assets/icons/people.png',
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(
                          8.0,
                          6.0,
                          8.0,
                          6.0,
                        ),
                        child: Text(
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorFontLight),
                          'Office Capacity: ${widget.office.maximumCapacity}',
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    8.0,
                    8.0,
                    8.0,
                    8.0,
                  ),
                  child: Row(
                    children: [
                      const ImageIcon(
                        color: colorIcon,
                        AssetImage(
                          'assets/icons/location.png',
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(
                          8.0,
                          6.0,
                          8.0,
                          6.0,
                        ),
                        child: Text(
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: colorFontLight),
                          widget.office.physicalAddress,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
