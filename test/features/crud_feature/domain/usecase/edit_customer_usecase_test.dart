import 'package:flutter_test/flutter_test.dart';

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
}
