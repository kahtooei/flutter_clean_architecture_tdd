import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

class EditCustomersUseCase extends UseCase<CustomerEntity, EditCustomerParams> {
  // A reference to the customer repository is stored in a final instance variable.
  final CustomerRepository customerRepository;

  // The constructor takes in the customer repository and stores it in the instance variable.
  EditCustomersUseCase(this.customerRepository);

  // This method takes in the ID of the customer to edit and the customer params (the new data) and returns the result of calling `editCustomer` on the customer repository.
  @override
  Future<RequestStatus<CustomerEntity>> execute(
      EditCustomerParams editCustomerParams) {
    // Calling the `editCustomer` method from `customerRepository` to edit a customer
    return customerRepository.editCustomer(
        editCustomerParams.customerID, editCustomerParams.customerParams);
  }
}
