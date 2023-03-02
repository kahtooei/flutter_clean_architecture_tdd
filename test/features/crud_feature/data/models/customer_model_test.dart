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

//check if customer model is subclass of customer entity
  test("should be a subclass of CustomerEntity", () {
    expect(customerModel, isA<CustomerEntity>());
  });
}
