import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class DeleteCustomerUseCase extends UseCase<bool, int> {
  final CustomerRepository customerRepository;
  DeleteCustomerUseCase(this.customerRepository);

  @override
  Future<RequestStatus<bool>> execute(int customerID) {
    throw UnimplementedError();
  }
}
