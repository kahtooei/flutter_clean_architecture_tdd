import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/repository/customer_repository_impl.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

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

  CustomerModel customerModel = CustomerModel(
      id: 1,
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime(1992, 9, 14),
      phoneNumber: "+989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "987654321");
  CustomerParams customerParams = CustomerParams(
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime(1992, 9, 14),
      phoneNumber: "+989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "987654321");

  test("create new customer", () async {
    when(customerLocalDataSource.insertCustomer(customerParams))
        .thenAnswer((realInvocation) => Future.value(customerModel));
    var result = await customerRepositoryImpl.createNewCustomer(customerParams);
    verify(customerLocalDataSource.insertCustomer(customerParams));
    expect(result, isA<SuccessRequest<CustomerEntity>>());
    expect(result.response!.email, customerParams.email);
  });

  test("select all customers", () async {
    when(customerLocalDataSource.selectAllCustomers())
        .thenAnswer((realInvocation) => Future.value(<CustomerModel>[]));
    var result = await customerRepositoryImpl.getAllCustomers();
    verify(customerLocalDataSource.selectAllCustomers());
    expect(result, isA<SuccessRequest<List<CustomerEntity>>>());
  });

  test("update customer info", () async {
    when(customerLocalDataSource.updateCustomer(customerModel))
        .thenAnswer((realInvocation) => Future.value(customerModel));
    var result = await customerRepositoryImpl.editCustomer(
        customerModel.id, customerParams);
    verify(customerLocalDataSource.updateCustomer(customerModel));
    expect(result, isA<SuccessRequest<CustomerEntity>>());
    expect(result.response!.id, customerModel.id);
  });

  test("delete customer from local database", () async {
    when(customerLocalDataSource.deleteCustomer(customerModel.id))
        .thenAnswer((realInvocation) => Future.value(true));
    var result = await customerRepositoryImpl.deleteCustomer(customerModel.id);
    verify(customerLocalDataSource.deleteCustomer(customerModel.id));
    expect(result, isA<SuccessRequest<bool>>());
    expect(result.response, true);
  });
}
