import 'package:flutter/material.dart';
import '../models/office.dart';
import '../models/worker.dart';
import '../db/db_helper.dart';

class OfficeProvider with ChangeNotifier {
  List<Office> _offices = [];

  List<Office> get offices {
    return [..._offices];
  }

  Future<void> fetchAndSetOffices() async {
    final dataList = await DBHelper.getOffices();
    _offices = dataList
        .map((item) => Office(
              id: item['id'],
              officeName: item['officeName'],
              physicalAddress: item['physicalAddress'],
              emailAddress: item['emailAddress'],
              phoneNumber: item['phoneNumber'],
              maximumCapacity: item['maximumCapacity'],
              officeColor: item['officeColor'],
              workers: [],
            ))
        .toList();

    for (var office in _offices) {
      final workerList = await DBHelper.getWorkers(office.id);
      office.workers.addAll(workerList
          .map((worker) => Worker(
                id: worker['id'],
                firstName: worker['firstName'],
                lastName: worker['lastName'],
                avatar: worker['color'],
                officeId: worker['officeId'],
              ))
          .toList());
    }
    notifyListeners();
  }

  Future<void> addOffice(Office office) async {
    await DBHelper.insertOffice(office);
    _offices.add(office);
    notifyListeners();
  }

  Future<void> addWorker(Worker worker) async {
    await DBHelper.insertWorker(worker);
    final officeIndex =
        _offices.indexWhere((office) => office.id == worker.officeId);
    _offices[officeIndex].workers.add(worker);
    notifyListeners();
  }

  Future<void> updateOffice(Office office) async {
    await DBHelper.updateOffice(office);
    final officeIndex = _offices.indexWhere((off) => off.id == office.id);
    if (officeIndex >= 0) {
      _offices[officeIndex] = office;
      notifyListeners();
    }
  }

  Future<void> updateWorker(Worker worker) async {
    await DBHelper.updateWorker(worker);
    final officeIndex =
        _offices.indexWhere((office) => office.id == worker.officeId);
    if (officeIndex >= 0) {
      final workerIndex = _offices[officeIndex]
          .workers
          .indexWhere((wrk) => wrk.id == worker.id);
      if (workerIndex >= 0) {
        _offices[officeIndex].workers[workerIndex] = worker;
        notifyListeners();
      }
    }
  }

  Future<void> deleteOffice(int id) async {
    await DBHelper.deleteOffice(id);
    _offices.removeWhere((office) => office.id == id);
    notifyListeners();
  }

  Future<void> deleteWorker(int workerId, int officeId) async {
    await DBHelper.deleteWorker(workerId);
    final officeIndex = _offices.indexWhere((office) => office.id == officeId);
    if (officeIndex >= 0) {
      _offices[officeIndex]
          .workers
          .removeWhere((worker) => worker.id == workerId);
      notifyListeners();
    }
  }
}
