import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';

abstract class Validation {
  final bool status;
  Validation(this.status);
}

abstract class InputValidation {
  Validation get isValid;
}

class ValidationStatus extends Validation {
  final String? error;
  ValidationStatus({required bool status, this.error}) : super(status);
}

class ParamsValidation extends InputValidation {
  final CustomerParams customerParams;
  ParamsValidation(this.customerParams);
  @override
  Validation get isValid => ValidationStatus(status: true);
}
