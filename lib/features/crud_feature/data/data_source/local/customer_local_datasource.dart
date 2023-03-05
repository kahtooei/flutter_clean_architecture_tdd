import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';

abstract class CustomerLocalDataSource {
  //insert new customer to database
  Future<CustomerModel> insertCustomer(CustomerParams customer);
  //get list of all customers
  Future<List<CustomerModel>> selectAllCustomers();
  //update customer info
  Future<void> updateCustomer(CustomerModel customer);
  //delete customer from database
  Future<void> deleteCustomer(int customerID);
}
