import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class DeleteCustomerUseCase extends UseCase<bool, int> {
  // Declaring the `CustomerRepository` instance
  final CustomerRepository customerRepository;

  // Constructor for `DeleteCustomerUseCase` class
  DeleteCustomerUseCase(this.customerRepository);

// `execute` function returns a future that contains the `RequestStatus`
  @override
  Future<RequestStatus<bool>> execute(int customerID) {
    throw UnimplementedError();
  }
}
