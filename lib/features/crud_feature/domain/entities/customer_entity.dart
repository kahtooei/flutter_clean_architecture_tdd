import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

  const CustomerEntity(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.email,
      required this.bankAccountNumber});

  @override
  List<Object?> get props => [id, firstName, lastName, dateOfBirth];
}
