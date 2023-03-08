import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ParamsValidation paramsValidation;
  late CustomerParams customerParams;
  setUp(() {
    customerParams = CustomerParams(
        firstName: "Mohammad",
        lastName: "Kahtooei",
        bankAccountNumber: "10985478566",
        dateOfBirth: DateTime.now(),
        email: "m.kahtooei@gmail.com",
        phoneNumber: "00989179647448");
    paramsValidation = ParamsValidation(customerParams);
  });

  group("valid params", () {
    setUp(() {
      customerParams = CustomerParams(
          firstName: "Mohammad",
          lastName: "Kahtooei",
          bankAccountNumber: "10985478566",
          dateOfBirth: DateTime.now(),
          email: "m.kahtooei@gmail.com",
          phoneNumber: "00989179647448");
      paramsValidation = ParamsValidation(customerParams);
    });
    test("check valid parameters", () {
      var result = paramsValidation.isValid;
      expect(result.status, true);
    });
  });

  group("invalid name", () {
    setUp(() {
      customerParams = CustomerParams(
          firstName: "M",
          lastName: "Kahtooei",
          bankAccountNumber: "10985478566",
          dateOfBirth: DateTime.now(),
          email: "m.kahtooei@gmail.com",
          phoneNumber: "00989179647448");
      paramsValidation = ParamsValidation(customerParams);
    });
    test("check invalid name", () {
      var result = paramsValidation.isValid;
      expect(result.status, false);
    });
  });

  group("invalid email", () {
    setUp(() {
      customerParams = CustomerParams(
          firstName: "Mohammad",
          lastName: "Kahtooei",
          bankAccountNumber: "10985478566",
          dateOfBirth: DateTime.now(),
          email: "m.kahtooei",
          phoneNumber: "00989179647448");
      paramsValidation = ParamsValidation(customerParams);
    });
    test("check invalid email", () {
      var result = paramsValidation.isValid;
      expect(result.status, false);
    });
  });

  group("invalid phone", () {
    setUp(() {
      customerParams = CustomerParams(
          firstName: "Mohammad",
          lastName: "Kahtooei",
          bankAccountNumber: "10985478566",
          dateOfBirth: DateTime.now(),
          email: "m.kahtooei@gmail.com",
          phoneNumber: "+98");
      paramsValidation = ParamsValidation(customerParams);
    });
    test("check invalid phone", () {
      var result = paramsValidation.isValid;
      expect(result.status, false);
    });
  });

  group("invalid account number", () {
    setUp(() {
      customerParams = CustomerParams(
          firstName: "Mohammad",
          lastName: "Kahtooei",
          bankAccountNumber: "10a",
          dateOfBirth: DateTime.now(),
          email: "m.kahtooei@gmail.com",
          phoneNumber: "00989179647448");
      paramsValidation = ParamsValidation(customerParams);
    });
    test("check invalid account number", () {
      var result = paramsValidation.isValid;
      expect(result.status, false);
    });
  });
}
