import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.dateOfBirth,
      required super.phoneNumber,
      required super.email,
      required super.bankAccountNumber});

  factory CustomerModel.fromMap(Map customer) {
    DateTime tsdate =
        DateTime.fromMillisecondsSinceEpoch(customer['dateOfBirth']);

    return CustomerModel(
        id: customer['id'],
        firstName: customer['firstName'],
        lastName: customer['lastName'],
        dateOfBirth: tsdate,
        phoneNumber: customer['phoneNumber'],
        email: customer['email'],
        bankAccountNumber: customer['bankAccountNumber']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': dateOfBirth.millisecondsSinceEpoch,
      'phoneNumber': phoneNumber,
      'email': email,
      'bankAccountNumber': bankAccountNumber,
    };
  }
}
