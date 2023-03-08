import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';

abstract class Validation {
  final bool status;
  Validation(this.status);
}

abstract class InputValidation {
  Validation get isValid;
}

class ParamsValidationStatus extends Validation {
  final String? error;
  ParamsValidationStatus({required bool status, this.error}) : super(status);
}

class ParamsValidation extends InputValidation {
  final CustomerParams customerParams;
  ParamsValidation(this.customerParams);
  @override
  ParamsValidationStatus get isValid => _checkValidation();

  ParamsValidationStatus _checkValidation() {
    if (!_isValidName(customerParams.firstName)) {
      return ParamsValidationStatus(status: false, error: "Invalid FirstName");
    }
    if (!_isValidName(customerParams.lastName)) {
      return ParamsValidationStatus(status: false, error: "Invalid LastName");
    }
    if (!_isValidEmail(customerParams.email)) {
      return ParamsValidationStatus(status: false, error: "Invalid Email");
    }
    if (!_isValidPhone(customerParams.phoneNumber)) {
      return ParamsValidationStatus(
          status: false, error: "Invalid Phone Number");
    }
    if (!_isValidAccount(customerParams.bankAccountNumber)) {
      return ParamsValidationStatus(
          status: false, error: "Invalid Bank Account Number");
    }
    return ParamsValidationStatus(status: true);
  }

  bool _isValidPhone(String phone) {
    final bool phoneValid = RegExp("[0-9]").hasMatch(phone);
    if (phone.length > 15 || phone.length < 10 || !phoneValid) {
      return false;
    }
    return true;
  }

  bool _isValidEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (!emailValid) {
      return false;
    }
    return true;
  }

  bool _isValidAccount(String accountNumber) {
    final bool accountValid = RegExp("[0-9]").hasMatch(accountNumber);
    if (accountNumber.length > 25 ||
        accountNumber.length < 10 ||
        !accountValid) {
      return false;
    }
    return true;
  }

  bool _isValidName(String name) {
    if (name.length < 3 || name.length > 24) {
      return false;
    }
    return true;
  }
}
