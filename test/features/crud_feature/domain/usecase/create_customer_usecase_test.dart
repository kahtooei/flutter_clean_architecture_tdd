import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart';

import 'create_customer_usecase_test.mocks.dart';

// Annotation to generate mock objects
@GenerateMocks([CustomerRepository])

// Main function to perform testing
main() {
  MockCustomerRepository customerRepository = MockCustomerRepository();
  late CreateCustomerUseCase useCase;
  setUp(() {
    useCase = CreateCustomerUseCase(customerRepository);
  });

  // Creating a customer parameter object to be passed to the use case
  final CustomerParams customerParams = CustomerParams(
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime.now(),
      phoneNumber: "+989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123654789");

  // Creating a customer entity object to be returned from the mock repository
  final customerEntity = CustomerEntity(
      id: 1,
      firstName: "Mohammad",
      lastName: "Kahtooei",
      bankAccountNumber: "123654789",
      dateOfBirth: DateTime.now(),
      email: "m.kahtooei@gmail.com",
      phoneNumber: "+989179647448");

// Test for successful response when creating a new customer
  test('successful response for create new customer', () async {
    // Setting up the mock repository to return the customer entity when createNewCustomer method is called
    when(customerRepository.createNewCustomer(customerParams)).thenAnswer(
        (_) => Future.value(SuccessRequest<CustomerEntity>(customerEntity)));

    // Executing the use case with the customer parameters
    var res = await useCase.execute(customerParams);

    // Asserting that the response from the use case is equal to the customer entity
    expect(res.response, customerEntity);
    //verify that customerRepository.createNewCustomer called in this scope
    verify(customerRepository.createNewCustomer(customerParams));
  });

  // Test for failed response when creating a new customer
  test('failed response for create new customer', () async {
    // Setting up the mock repository to return an error message when createNewCustomer method is called
    when(customerRepository.createNewCustomer(customerParams))
        .thenAnswer((realInvocation) => Future.value(FailedRequest("Error")));

    // Executing the use case with the customer parameters
    var res = await useCase.execute(customerParams);

    // Asserting that the error message from the use case is equal to "Error"
    expect(res.error, "Error");
    //verify that customerRepository.createNewCustomer called in this scope
    verify(customerRepository.createNewCustomer(customerParams));
  });
}
