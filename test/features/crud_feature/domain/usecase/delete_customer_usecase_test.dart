import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
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
}
