import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerLocalDataSource localDataSource;
  CustomerRepositoryImpl(this.localDataSource);
  @override
  Future<RequestStatus<CustomerEntity>> createNewCustomer(
      CustomerParams customerParams) async {
    try {
      // try to insert customer parameters into local database
      CustomerModel customer =
          await localDataSource.insertCustomer(customerParams);
      // return success with a customer entity created from returned data
      return SuccessRequest<CustomerEntity>(customer);
    } catch (e) {
      // return failed request with error message
      return FailedRequest(e.toString());
    }
  }

  @override
  Future<RequestStatus<bool>> deleteCustomer(int id) async {
    try {
      // try to delete customer from database using the id
      await localDataSource.deleteCustomer(id);
      // return success with true value
      return const SuccessRequest<bool>(true);
    } catch (e) {
      // return failed request with error message
      return FailedRequest(e.toString());
    }
  }

  @override
  Future<RequestStatus<CustomerEntity>> editCustomer(
      int id, CustomerParams customerParams) async {
    try {
      // create a map contains customer info from the customer parameters and set its id
      Map<String, dynamic> customerMap = customerParams.toMap();
      customerMap['id'] = id;
      //create customer model object from map
      CustomerModel customer = CustomerModel.fromMap(customerMap);
      // try to update the customer in the database
      await localDataSource.updateCustomer(customer);
      // return success with a customer entity created from returned data
      return SuccessRequest<CustomerEntity>(customer);
    } catch (e) {
      // return failed request with error message
      return FailedRequest(e.toString());
    }
  }

  @override
  Future<RequestStatus<List<CustomerEntity>>> getAllCustomers() async {
    try {
      // try to get a list of all customers from the database
      List<CustomerModel> customerList =
          await localDataSource.selectAllCustomers();

      // return success with a list of customer entities
      return SuccessRequest<List<CustomerEntity>>(customerList);
    } catch (e) {
      // return failed request with error message
      return FailedRequest(e.toString());
    }
  }
}
