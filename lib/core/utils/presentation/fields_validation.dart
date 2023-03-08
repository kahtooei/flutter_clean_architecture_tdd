abstract class Validation {
  final bool status;
  Validation(this.status);
}

abstract class InputValidation {
  Validation get isValid;
}
