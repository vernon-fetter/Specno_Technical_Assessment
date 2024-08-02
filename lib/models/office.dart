import 'package:office_dynasty/models/worker.dart';

class Office {
  final int id;
  final String officeName;
  final String physicalAddress;
  final String emailAddress;
  final String phoneNumber;
  final int maximumCapacity;
  final int officeColor;
  final List<Worker> workers;

  Office({
    required this.id,
    required this.officeName,
    required this.physicalAddress,
    required this.emailAddress,
    required this.phoneNumber,
    required this.maximumCapacity,
    required this.officeColor,
    required this.workers,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'officeName': officeName,
      'physicalAddress': physicalAddress,
      'emailAddress': emailAddress,
      'phoneNumber': phoneNumber,
      'maximumCapacity': maximumCapacity,
      'officeColor': officeColor,
    };
  }
}
