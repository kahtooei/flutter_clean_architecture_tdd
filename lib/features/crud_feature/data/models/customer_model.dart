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
}
