import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class CustomerRepositoryImpl extends CustomerRepository {
  final CustomerLocalDataSource localDataSource;
  CustomerRepositoryImpl(this.localDataSource);
  @override
  Future<RequestStatus<CustomerEntity>> createNewCustomer(
      CustomerParams customerParams) {
    // TODO: implement createNewCustomer
    throw UnimplementedError();
  }

  @override
  Future<RequestStatus<bool>> deleteCustomer(int id) {
    // TODO: implement deleteCustomer
    throw UnimplementedError();
  }

  @override
  Future<RequestStatus<CustomerEntity>> editCustomer(
      int id, CustomerParams customerParams) {
    // TODO: implement editCustomer
    throw UnimplementedError();
  }

  @override
  Future<RequestStatus<List<CustomerEntity>>> getAllCustomers() {
    // TODO: implement getAllCustomers
    throw UnimplementedError();
  }
}
