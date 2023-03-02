import 'package:flutter_test/flutter_test.dart';

import 'create_customer_usecase_test.mocks.dart';

main() {
  // Creating a mock object of the customer repository
  MockCustomerRepository customerRepository = MockCustomerRepository();
  // Creating an instance of the GetCustomersUseCase class
  GetCustomersUseCase useCase;

  setUp(() {
    //initiate GetCustomersUseCase with mock repository
    useCase = GetCustomersUseCase(customerRepository);
  });
}
