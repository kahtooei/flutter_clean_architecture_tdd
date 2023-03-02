import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class EditCustomersUseCase extends UseCase<CustomerEntity, EditCustomerParams> {
  final CustomerRepository customerRepository;
  EditCustomersUseCase(this.customerRepository);
  @override
  Future<RequestStatus<CustomerEntity>> execute(
      EditCustomerParams editCustomerParams) {
    throw UnimplementedError();
  }
}
