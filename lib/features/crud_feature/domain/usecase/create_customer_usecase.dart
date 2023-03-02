// CreateCustomersUseCase class is a UseCase class that uses customerRepository
// to create a new customer.
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class CreateCustomerUseCase {
  // customerRepository instance that is used to interact with the data layer.
  final CustomerRepository customerRepository;

  // Constructor that takes customerRepository as a parameter.
  CreateCustomerUseCase(this.customerRepository);
}
