import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';

/// Abstract class for implementing customer repository operations
abstract class CustomerRepository {
  /// Method to create a new customer using [CustomerParams]
  Future<RequestStatus<CustomerEntity>> createNewCustomer(
      CustomerParams customerParams);

  /// Method to delete a customer with given [id]
  Future<RequestStatus<bool>> deleteCustomer(int id);

  /// Method to edit a customer with given [id] and [CustomerParams]
  Future<RequestStatus<CustomerEntity>> editCustomer(
      int id, CustomerParams customerParams);

  /// Method to get a list of all customers
  Future<RequestStatus<List<CustomerEntity>>> getAllCustomers();
}
