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
}
