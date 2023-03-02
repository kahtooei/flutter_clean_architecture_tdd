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
}
