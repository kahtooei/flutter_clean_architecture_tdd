import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'create_customer_usecase_test.mocks.dart';

main() {
  // create instance of mock repository
  MockCustomerRepository customerRepository = MockCustomerRepository();
  // create instance of DeleteCustomerUseCase
  late DeleteCustomerUseCase useCase;
  setUp(() {
    //initiate DeleteCustomerUseCase with mock repository
    useCase = DeleteCustomerUseCase(customerRepository);
  });

  const int customerID = 1;
  test('successful response for delete customer', () async {
    // set up mock repository to return success result when deleteCustomer is called
    when(customerRepository.deleteCustomer(customerID)).thenAnswer(
        (realInvocation) => Future.value(SuccessRequest<bool>(true)));

    // call execute method with customer ID on use case
    var res = await useCase.execute(customerID);

    // assert that the response is true
    expect(res.response, true);
    //verify that customerRepository.createNewCustomer called in this scope
    verify(customerRepository.deleteCustomer(customerID));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });

  test('failed response for delete customer', () async {
    // set up mock repository to return failed result when deleteCustomer is called
    when(customerRepository.deleteCustomer(customerID))
        .thenAnswer((realInvocation) => Future.value(FailedRequest("Error")));

    // call execute method with customer ID on use case
    var res = await useCase.execute(customerID);

    // assert that the error message is "Error"
    expect(res.error, "Error");
    //verify that customerRepository.createNewCustomer called in this scope
    verify(customerRepository.deleteCustomer(customerID));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(customerRepository);
  });
}
