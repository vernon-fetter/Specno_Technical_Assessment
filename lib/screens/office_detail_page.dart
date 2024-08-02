import 'package:flutter/material.dart';
import 'package:office_dynasty/configuration/default_configuration.dart';
import 'package:office_dynasty/models/office.dart';
import 'package:office_dynasty/widgets/add_staff_member_dialog.dart';
import 'package:office_dynasty/widgets/alert_dialog.dart';
import 'package:office_dynasty/widgets/custom_scaffold.dart';
import 'package:office_dynasty/widgets/office_tile.dart';
import 'package:office_dynasty/widgets/worker_tile.dart';
import 'package:provider/provider.dart';
import '../providers/office_provider.dart';

class OfficeDetailPage extends StatefulWidget {
  final int officeId;
  final Office office;

  OfficeDetailPage({
    required this.officeId,
    required this.office,
  });

  @override
  _OfficeDetailPageState createState() => _OfficeDetailPageState();
}

class _OfficeDetailPageState extends State<OfficeDetailPage> {
  var _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final office = Provider.of<OfficeProvider>(context, listen: false)
        .offices
        .firstWhere((office) => office.id == widget.officeId);

    // Convert both search query and worker's first name and last name to lowercase for case-insensitive comparison
    final filteredWorkers = office.workers.where((worker) {
      final fullName = '${worker.firstName} ${worker.lastName}'.toLowerCase();
      return fullName.contains(_searchQuery.toLowerCase());
    }).toList();

    return CustomScaffold(
      title: office.officeName,
      showFloatingActionButton: true,
      body: Column(
        children: [
          OfficeDetailsTile(office, 1, true),
          Padding(
            padding: const EdgeInsets.all(
              16.0,
            ),
            child: SearchBar(
              hintText: 'Search',
              trailing: const [
                ImageIcon(
                  color: colorIcon,
                  AssetImage(
                    'assets/icons/search.png',
                  ),
                ),
              ],
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Staff Members in Office',
                ),
                Text(
                  '${office.workers.length}',
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredWorkers.length,
              itemBuilder: (ctx, i) => WorkerTile(
                worker: filteredWorkers[i],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonTap: () {
        if (widget.office.maximumCapacity > widget.office.workers.length) {
          popupAdd(context: context, officeId: widget.officeId);
        } else {
          popup(
            context: context,
            messages: [
              'You have exceeded the maximum capacity of this office.'
            ],
            type: PopupControlType.confirm,
            icon: PopupControlIcon.warning,
          );
        }
      },
    );
  }
}
