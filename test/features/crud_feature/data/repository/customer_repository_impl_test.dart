import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'customer_repository_impl_test.mocks.dart';

// Annotation to generate mock objects
@GenerateMocks([CustomerLocalDataSource])
void main() {
  MockCustomerLocalDataSource customerLocalDataSource =
      MockCustomerLocalDataSource();
  late CustomerRepositoryImpl customerRepositoryImpl;
  setUp(() {
    customerRepositoryImpl = CustomerRepositoryImpl(customerLocalDataSource);
  });
}
