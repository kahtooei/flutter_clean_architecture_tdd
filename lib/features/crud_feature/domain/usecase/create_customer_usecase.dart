// CreateCustomersUseCase class is a UseCase class that uses customerRepository
// to create a new customer.
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class CreateCustomerUseCase extends UseCase<CustomerEntity, CustomerParams> {
  // customerRepository instance that is used to interact with the data layer.
  final CustomerRepository customerRepository;

  // Constructor that takes customerRepository as a parameter.
  CreateCustomerUseCase(this.customerRepository);

  // execute method to create a new customer.
  // It takes `CustomerParams` as a parameter and returns a `Future` of `RequestStatus<CustomerEntity>`.
  @override
  Future<RequestStatus<CustomerEntity>> execute(CustomerParams customerParams) {
    // Call `createNewCustomer` method on `customerRepository` to create a new customer
    return customerRepository.createNewCustomer(customerParams);
  }
}
