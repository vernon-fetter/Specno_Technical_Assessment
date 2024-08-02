class Worker {
  final int id;
  final String firstName;
  final String lastName;
  final String? avatar;
  final int officeId;

  Worker({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.avatar,
    required this.officeId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
      'officeId': officeId,
    };
  }
}
