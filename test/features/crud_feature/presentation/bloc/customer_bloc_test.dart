import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_bloc.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/presentation/bloc/customer_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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
  late CustomerBloc customerBloc;
  MockInputValidation inputValidation = MockInputValidation();
  MockCreateCustomerUseCase createCustomer = MockCreateCustomerUseCase();
  MockEditCustomersUseCase editCustomer = MockEditCustomersUseCase();
  MockDeleteCustomerUseCase deleteCustomer = MockDeleteCustomerUseCase();
  MockGetCustomersUseCase getCustomers = MockGetCustomersUseCase();
  setUp(() {
    customerBloc = CustomerBloc(inputValidation, createCustomer, editCustomer,
        deleteCustomer, getCustomers);
  });

  final CustomerParams customerParams = CustomerParams(
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime.now(),
      phoneNumber: "00989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123654789");
  final CustomerParams customerInvalidParams = CustomerParams(
      firstName: "M",
      lastName: "Kahtooei",
      dateOfBirth: DateTime.now(),
      phoneNumber: "+98",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123654789");
  final CustomerEntity customerEntity = CustomerEntity(
      id: 1,
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime.now(),
      phoneNumber: "00989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "123654789");

//test initial state
  test("initial state is Empty", () {
    expect(customerBloc.state.customerStatus, EmptyCustomerStatus());
  });

  //test create new customer event
  group("create new customer bloc test1", () {
    setUp(() {
      customerBloc = CustomerBloc(inputValidation, createCustomer, editCustomer,
          deleteCustomer, getCustomers);
      when(getCustomers.execute()).thenAnswer((_) =>
          Future.value(SuccessRequest<List<CustomerEntity>>([customerEntity])));

      when(createCustomer.execute(customerParams)).thenAnswer(
          (_) => Future.value(SuccessRequest<CustomerEntity>(customerEntity)));

      when(inputValidation.checkValidation(customerParams))
          .thenReturn(ParamsValidationStatus(status: true));

      when(inputValidation.checkValidation(customerInvalidParams)).thenReturn(
          ParamsValidationStatus(status: false, error: "invalid params"));
    });
    blocTest(
      "create new customer",
      build: () => customerBloc,
      act: (CustomerBloc bloc) => bloc.add(
        CreateNewCustomerEvent(customerParams: customerParams),
      ),
      expect: () => [
        CustomerState(customerStatus: CustomerLoadingStatus()),
        CustomerState(customerStatus: CustomerCompletedStatus([customerEntity]))
      ],
    );

    test("test calling methods", () async {
      customerBloc.add(CreateNewCustomerEvent(customerParams: customerParams));
      await untilCalled(getCustomers.execute());
      // await Future.delayed(const Duration(seconds: 5));
      verify(createCustomer.execute(customerParams));
      verify(getCustomers.execute());
      verify(inputValidation.checkValidation(customerParams));
    });

    test("test error params validation", () async {
      customerBloc
          .add(CreateNewCustomerEvent(customerParams: customerInvalidParams));
      await untilCalled(inputValidation.checkValidation(customerInvalidParams));
      // await Future.delayed(const Duration(seconds: 2));
      verify(inputValidation.checkValidation(customerInvalidParams));
      expect(customerBloc.state.customerStatus,
          FieldValidationErrorStatus("invalid params"));
    });
  });

//test delete customer event
  group("delete customer bloc test", () {
    setUp(() {
      customerBloc = CustomerBloc(inputValidation, createCustomer, editCustomer,
          deleteCustomer, getCustomers);
      when(getCustomers.execute()).thenAnswer(
          (_) => Future.value(SuccessRequest<List<CustomerEntity>>([])));

      when(deleteCustomer.execute(1))
          .thenAnswer((_) => Future.value(SuccessRequest<bool>(true)));
    });

    blocTest(
      "delete customer",
      build: () => customerBloc,
      act: (CustomerBloc bloc) => bloc.add(
        const DeleteCustomerEvent(customerID: 1),
      ),
      expect: () => [
        CustomerState(customerStatus: CustomerLoadingStatus()),
        CustomerState(customerStatus: CustomerCompletedStatus([]))
      ],
    );

    test("test calling methods", () async {
      customerBloc.add(const DeleteCustomerEvent(customerID: 1));
      await untilCalled(getCustomers.execute());
      // await Future.delayed(const Duration(seconds: 5));
      verify(deleteCustomer.execute(1));
      verify(getCustomers.execute());
    });
  });
}
