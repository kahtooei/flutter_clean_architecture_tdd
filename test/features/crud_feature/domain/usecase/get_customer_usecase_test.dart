import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'create_customer_usecase_test.mocks.dart';

main() {
  // Creating a mock object of the customer repository
  MockCustomerRepository customerRepository = MockCustomerRepository();
  // Creating an instance of the GetCustomersUseCase class
  late GetCustomersUseCase useCase;

  setUp(() {
    //initiate GetCustomersUseCase with mock repository
    useCase = GetCustomersUseCase(customerRepository);
  });

  // Creating a list of customer entities to be used in the test cases
  final customerList = <CustomerEntity>[
    CustomerEntity(
        id: 1,
        firstName: "Mohammad",
        lastName: "Kahtooei",
        bankAccountNumber: "123456789",
        dateOfBirth: DateTime.now(),
        email: "m.kahtooei@gmail.com",
        phoneNumber: "+989179647448")
  ];

  // Test case for successful response for getting customers
  test('successful response for get customers', () async {
    // Setting up the mock repository to return a success response when getAllCustomers method is called
    when(customerRepository.getAllCustomers()).thenAnswer((realInvocation) =>
        Future.value(SuccessRequest<List<CustomerEntity>>(customerList)));

    // Executing the use case to retrieve the customers
    var res = await useCase.execute();

    // Checking if the response is the same as the expected customer list
    expect(res.response, customerList);
    //verify that customerRepository.getAllCustomers called in this scope
    verify(customerRepository.getAllCustomers());
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });

  // Test case for failed response for getting customers
  test('failed response for get customers', () async {
    // Setting up the mock repository to return a failed response when getAllCustomers method is called
    when(customerRepository.getAllCustomers())
        .thenAnswer((realInvocation) => Future.value(FailedRequest("Error")));

    // Executing the use case to retrieve the customers
    var res = await useCase.execute();

    // Checking if the error message is the same as expected
    expect(res.error, "Error");
    //verify that customerRepository.getAllCustomers called in this scope
    verify(customerRepository.getAllCustomers());
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });
}
