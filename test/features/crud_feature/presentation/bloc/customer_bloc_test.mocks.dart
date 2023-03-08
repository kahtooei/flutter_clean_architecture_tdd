// Mocks generated by Mockito 5.3.2 from annotations
// in flutter_clean_architecture_tdd/test/features/crud_feature/presentation/bloc/customer_bloc_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart'
    as _i8;
import 'package:flutter_clean_architecture_tdd/core/params/edit_customer_params.dart'
    as _i10;
import 'package:flutter_clean_architecture_tdd/core/resources/request_status.dart'
    as _i4;
import 'package:flutter_clean_architecture_tdd/core/utils/presentation/fields_validation.dart'
    as _i2;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/entities/customer_entity.dart'
    as _i7;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/repository/customer_repository.dart'
    as _i3;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/create_customer_usecase.dart'
    as _i5;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/delete_customer_usecase.dart'
    as _i11;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/edit_customer_usecase.dart'
    as _i9;
import 'package:flutter_clean_architecture_tdd/features/crud_feature/domain/usecase/get_customer_usecase.dart'
    as _i12;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeValidation_0 extends _i1.SmartFake implements _i2.Validation {
  _FakeValidation_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeCustomerRepository_1 extends _i1.SmartFake
    implements _i3.CustomerRepository {
  _FakeCustomerRepository_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRequestStatus_2<T> extends _i1.SmartFake
    implements _i4.RequestStatus<T> {
  _FakeRequestStatus_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [InputValidation].
///
/// See the documentation for Mockito's code generation for more information.
class MockInputValidation extends _i1.Mock implements _i2.InputValidation {
  MockInputValidation() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Validation get isValid => (super.noSuchMethod(
        Invocation.getter(#isValid),
        returnValue: _FakeValidation_0(
          this,
          Invocation.getter(#isValid),
        ),
      ) as _i2.Validation);
}

/// A class which mocks [CreateCustomerUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateCustomerUseCase extends _i1.Mock
    implements _i5.CreateCustomerUseCase {
  MockCreateCustomerUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CustomerRepository get customerRepository => (super.noSuchMethod(
        Invocation.getter(#customerRepository),
        returnValue: _FakeCustomerRepository_1(
          this,
          Invocation.getter(#customerRepository),
        ),
      ) as _i3.CustomerRepository);
  @override
  _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>> execute(
          _i8.CustomerParams? customerParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [customerParams],
        ),
        returnValue: _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>>.value(
            _FakeRequestStatus_2<_i7.CustomerEntity>(
          this,
          Invocation.method(
            #execute,
            [customerParams],
          ),
        )),
      ) as _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>>);
}

/// A class which mocks [EditCustomersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockEditCustomersUseCase extends _i1.Mock
    implements _i9.EditCustomersUseCase {
  MockEditCustomersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CustomerRepository get customerRepository => (super.noSuchMethod(
        Invocation.getter(#customerRepository),
        returnValue: _FakeCustomerRepository_1(
          this,
          Invocation.getter(#customerRepository),
        ),
      ) as _i3.CustomerRepository);
  @override
  _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>> execute(
          _i10.EditCustomerParams? editCustomerParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [editCustomerParams],
        ),
        returnValue: _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>>.value(
            _FakeRequestStatus_2<_i7.CustomerEntity>(
          this,
          Invocation.method(
            #execute,
            [editCustomerParams],
          ),
        )),
      ) as _i6.Future<_i4.RequestStatus<_i7.CustomerEntity>>);
}

/// A class which mocks [DeleteCustomerUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteCustomerUseCase extends _i1.Mock
    implements _i11.DeleteCustomerUseCase {
  MockDeleteCustomerUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CustomerRepository get customerRepository => (super.noSuchMethod(
        Invocation.getter(#customerRepository),
        returnValue: _FakeCustomerRepository_1(
          this,
          Invocation.getter(#customerRepository),
        ),
      ) as _i3.CustomerRepository);
  @override
  _i6.Future<_i4.RequestStatus<bool>> execute(int? customerID) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [customerID],
        ),
        returnValue: _i6.Future<_i4.RequestStatus<bool>>.value(
            _FakeRequestStatus_2<bool>(
          this,
          Invocation.method(
            #execute,
            [customerID],
          ),
        )),
      ) as _i6.Future<_i4.RequestStatus<bool>>);
}

/// A class which mocks [GetCustomersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCustomersUseCase extends _i1.Mock
    implements _i12.GetCustomersUseCase {
  MockGetCustomersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.CustomerRepository get customerRepository => (super.noSuchMethod(
        Invocation.getter(#customerRepository),
        returnValue: _FakeCustomerRepository_1(
          this,
          Invocation.getter(#customerRepository),
        ),
      ) as _i3.CustomerRepository);
  @override
  _i6.Future<_i4.RequestStatus<List<_i7.CustomerEntity>>> execute() =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
        ),
        returnValue:
            _i6.Future<_i4.RequestStatus<List<_i7.CustomerEntity>>>.value(
                _FakeRequestStatus_2<List<_i7.CustomerEntity>>(
          this,
          Invocation.method(
            #execute,
            [],
          ),
        )),
      ) as _i6.Future<_i4.RequestStatus<List<_i7.CustomerEntity>>>);
}
