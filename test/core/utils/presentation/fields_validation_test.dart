import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late ParamsValidation paramsValidation;
  late CustomerParams customerParams;
  setUp(() {
    paramsValidation = ParamsValidation();
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
      // paramsValidation = ParamsValidation(customerParams);
    });
    test("check valid parameters", () {
      var result = paramsValidation.checkValidation(customerParams);
      expect(result.status, true);
      expect(result.error, isA<Null>());
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
    });
    test("check invalid name", () {
      var result = paramsValidation.checkValidation(customerParams);
      expect(result.status, false);
      expect(result.error, isA<String>());
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
    });
    test("check invalid email", () {
      var result = paramsValidation.checkValidation(customerParams);
      expect(result.status, false);
      expect(result.error, isA<String>());
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
    });
    test("check invalid phone", () {
      var result = paramsValidation.checkValidation(customerParams);
      expect(result.status, false);
      expect(result.error, isA<String>());
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
    });
    test("check invalid account number", () {
      var result = paramsValidation.checkValidation(customerParams);
      expect(result.status, false);
      expect(result.error, isA<String>());
    });
  });
}
