import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  //create an instant of customer model
  CustomerModel customerModel = CustomerModel(
      id: 1,
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime(1992, 9, 14),
      phoneNumber: "+989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123456789");

//customer data as map
  Map<String, dynamic> mapCustomer = {
    'id': 1,
    'firstName': "Mohammad",
    'lastName': "Kahtooei",
    'dateOfBirth': 1677770996,
    'phoneNumber': "+989179647448",
    'email': "m.kahtooei@gmail.com",
    'bankAccountNumber': "123456789"
  };

//test if customer model is subclass of customer entity
  test("should be a subclass of CustomerEntity", () {
    expect(customerModel, isA<CustomerEntity>());
  });

//test create model from Map
  test('create model from Map', () {
    final result = CustomerModel.fromMap(mapCustomer);
    expect(result, isA<CustomerModel>());
    expect(result.email, mapCustomer['email']);
  });

  //test convert model to Map
  test('convert model to Map', () {
    final result = customerModel.toMap();
    expect(result, isA<Map<String, dynamic>>());
    expect(result['email'], customerModel.email);
  });
}
