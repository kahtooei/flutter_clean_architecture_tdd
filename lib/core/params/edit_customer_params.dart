import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';

class EditCustomerParams {
  final CustomerParams customerParams;
  final int customerID;
  EditCustomerParams({required this.customerID, required this.customerParams});
}
