class CustomerParams {
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;

// Constructor that takes all required fields as arguments.
  const CustomerParams(
      {required this.firstName,
      required this.lastName,
      required this.dateOfBirth,
      required this.phoneNumber,
      required this.email,
      required this.bankAccountNumber});

  Map<String, dynamic> toMap() {
    int date = dateOfBirth.millisecondsSinceEpoch;

    return {
      'firstName': firstName,
      'lastName': lastName,
      'dateOfBirth': date,
      'phoneNumber': phoneNumber,
      'email': email,
      'bankAccountNumber': bankAccountNumber,
    };
  }
}
