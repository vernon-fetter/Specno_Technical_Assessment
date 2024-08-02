import 'package:flutter/material.dart';
import 'package:office_dynasty/screens/add_edit_office_screen.dart';
import 'package:office_dynasty/widgets/custom_scaffold.dart';
import 'package:office_dynasty/widgets/office_tile.dart';
import 'package:provider/provider.dart';
import '../providers/office_provider.dart';

class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      body: FutureBuilder(
        future: Provider.of<OfficeProvider>(context, listen: false)
            .fetchAndSetOffices(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : Consumer<OfficeProvider>(
                    builder: (ctx, officeData, child) => ListView.builder(
                      itemCount: officeData.offices.length,
                      itemBuilder: (ctx, i) =>
                          OfficeDetailsTile(officeData.offices[i], 1, false),
                    ),
                  ),
      ),
      floatingActionButtonTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const AddEditOfficeScreen(),
          ),
        );
      },
      showFloatingActionButton: true,
    );
  }
}
