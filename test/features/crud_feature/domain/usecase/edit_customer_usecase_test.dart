import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'create_customer_usecase_test.mocks.dart';

main() {
  // Creating instance of mock class for customer repository
  MockCustomerRepository customerRepository = MockCustomerRepository();

  // Creating instance of EditCustomersUseCase class
  late EditCustomersUseCase useCase;

  setUp(() {
    //initiate EditCustomersUseCase with mock repository
    useCase = EditCustomersUseCase(customerRepository);
  });

  // Creating instance of customer params for passing parameters to EditCustomerParams
  final CustomerParams customerParams = CustomerParams(
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime.now(),
      phoneNumber: "+989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123654789");

// Creating instance of EditCustomerParams for passing to editCustomer
  final EditCustomerParams editCustomerParams =
      EditCustomerParams(customerID: 1, customerParams: customerParams);

  // Creating instance of customer entity for creating an instance of successful response
  final customerEntity = CustomerEntity(
      id: 1,
      firstName: "Mohammad",
      lastName: "Kahtooei",
      bankAccountNumber: "123654789",
      dateOfBirth: DateTime.now(),
      email: "m.kahtooei@gmail.com",
      phoneNumber: "+989179647448");

  // Test case for successful edit of customer
  test('successful response for edit customer', () async {
    // Mock the editCustomer method of customer repository to return successful response
    when(customerRepository.editCustomer(
            editCustomerParams.customerID, editCustomerParams.customerParams))
        .thenAnswer((realInvocation) =>
            Future.value(SuccessRequest<CustomerEntity>(customerEntity)));

    // Calling execute method of EditCustomersUseCase to edit customer
    var res = await useCase.execute(editCustomerParams);

    // Checking if the response is equal to customer entity
    expect(res.response, customerEntity);
    //verify that customerRepository.editCustomer called in this scope
    verify(customerRepository.editCustomer(
        editCustomerParams.customerID, editCustomerParams.customerParams));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });

  // Test case for failed edit of customer
  test('failed response for edit customer', () async {
    // Mock the editCustomer method of customer repository to return failed response
    when(customerRepository.editCustomer(
            editCustomerParams.customerID, editCustomerParams.customerParams))
        .thenAnswer((realInvocation) => Future.value(FailedRequest("Error")));

    // Calling execute method of EditCustomersUseCase to edit customer
    var res = await useCase.execute(editCustomerParams);

    // Checking if the error message is equal to "Error"
    expect(res.error, "Error");
    //verify that customerRepository.editCustomer called in this scope
    verify(customerRepository.editCustomer(
        editCustomerParams.customerID, editCustomerParams.customerParams));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });
}
