// import 'package:path/path.dart';
// import 'package:quanlykhachsan/models/account.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseHelper {
//   final databaseName = "account.db";
//   String accountTable =
//       "CREATE TABLE accounts (accountID INTEGER PRIMARY KEY AUTOINCREMENT, tenDangNhap varchar(255) UNIQUE, matKhau varchar(255) NOT NULL)";
//   String clientTable =
//       "CREATE TABLE clients (cccd INTEGER PRIMARY KEY AUTOINCREMENT, hoTen TEXT NOT NULL, soDienThoai INTEGER NOT NULL)";

//   Future<Database> initDB() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, databaseName);

//     return openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute(accountTable);
//     });
//   }

//   Future<bool> loginMethod(Account account) async {
//     final Database db = await initDB();
//     var result = await db.rawQuery(
//         "select * from accounts where tenDangNhap = '${account.tenDangNhap}' AND matKhau = '${account.matKhau}'");
//     if (result.isNotEmpty) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<int> registerMethod(Account account) async {
//     final Database db = await initDB();
//     return db.insert("accounts", account.toMap());
//   }

//   Future<int> createAccount(Account account) async {
//     final Database db = await initDB();
//     return db.insert("accounts", account.toMap());
//   }

//   Future<List<Account>> getAccount() async {
//     final Database db = await initDB();
//     List<Map<String, Object?>> result = await db.query("accounts");
//     return result.map((e) => Account.fromMap(e)).toList();
//   }

//   Future<int> deleteAccount(int accountID) async {
//     final Database db = await initDB();
//     return db
//         .delete("accounts", where: "accountID = ?", whereArgs: [accountID]);
//   }

//   Future<int> updateAccount(accountID, tenDangNhap, matKhau) async {
//     final Database db = await initDB();
//     return db.rawUpdate(
//         "update accounts set username = ?, password = ? where accountID = ?",
//         [tenDangNhap, matKhau, accountID]);
//   }
// }
