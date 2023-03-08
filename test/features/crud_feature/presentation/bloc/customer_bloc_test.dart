import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'customer_bloc_test.mocks.dart';

// Annotation to generate mock objects
@GenerateMocks([
  InputValidation,
  CreateCustomerUseCase,
  EditCustomersUseCase,
  DeleteCustomerUseCase,
  GetCustomersUseCase
])
void main() {
  late CustomerBloc customerBlock;
  MockInputValidation inputValidation = MockInputValidation();
  MockCreateCustomerUseCase createCustomer = MockCreateCustomerUseCase();
  MockEditCustomersUseCase editCustomer = MockEditCustomersUseCase();
  MockDeleteCustomerUseCase deleteCustomer = MockDeleteCustomerUseCase();
  MockGetCustomersUseCase getCustomers = MockGetCustomersUseCase();
  setUp(() {
    customerBlock = CustomerBloc(inputValidation, createCustomer, editCustomer,
        deleteCustomer, getCustomers);
  });
}
