import 'package:flutter/foundation.dart';
import 'package:flutter_database/database/transaction_db.dart';
import 'package:flutter_database/models/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transactions> transactions = [];

//ดึงข้อมูล
  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = await TransactionDB(dbName: "transaction.db");
    print(db);
    transactions.insert(0, statement);
    //แจ้งเตือน consumer
    notifyListeners();
  }
}
