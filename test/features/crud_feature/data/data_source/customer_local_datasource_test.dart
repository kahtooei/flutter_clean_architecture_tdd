import 'package:flutter_clean_architecture_tdd/core/params/customer_params.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/data_source/local/customer_local_datasource.dart';
import 'package:flutter_clean_architecture_tdd/features/crud_feature/data/models/customer_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> getDB() async {
  const String createCustomerTable = '''
                  create table customer ( 
                      id integer primary key autoincrement,
                      firstName text not null,
                      lastName text not null,
                      dateOfBirth,
                      phoneNumber text not null,
                      email text UNIQUE not null,
                      bankAccountNumber text not null,

                      UNIQUE(firstName,lastName,dateOfBirth)
                      )
                  ''';
  return await openDatabase(inMemoryDatabasePath, version: 1,
      onCreate: (db, version) async {
    await db.execute(createCustomerTable);
  });
}

main() {
  late Database db;
  late CustomerSqliteDB localDataSource;
  setUpAll(() async {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
    db = await getDB();
    localDataSource = CustomerSqliteDB(database: db);
  });

//customer parameters to test database
  CustomerParams customerParams = CustomerParams(
      firstName: "Mohammad",
      lastName: "Kahtooei",
      dateOfBirth: DateTime(1992, 09, 14),
      phoneNumber: "00989179647448",
      email: "m.kahtooei@gmail.com",
      bankAccountNumber: "987456321");

//test create new customer in database
  test('Insert test', () async {
    var result = await localDataSource.insertCustomer(customerParams);
    // Check content
    expect(result, isA<CustomerModel>());
    expect(result.id, isA<int>());
    expect(result.email, customerParams.email);
  });
}
