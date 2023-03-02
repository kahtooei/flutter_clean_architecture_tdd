import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

// class GetCustomersUseCase defines the use case of getting all the customers
class GetCustomersUseCase extends UseCaseNoParams<List<CustomerEntity>> {
  // final instance variable to store the customer repository instance
  final CustomerRepository customerRepository;

  // constructor to initialize the customer repository instance
  GetCustomersUseCase(this.customerRepository);

  // method to execute the use case and return the request status
  @override
  Future<RequestStatus<List<CustomerEntity>>> execute() {
    // return the result from getAllCustomers method in customer repository
    return customerRepository.getAllCustomers();
  }
}
