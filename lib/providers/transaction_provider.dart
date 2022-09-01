import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [];

//ดึงข้อมูล
  List<Transaction> getTransaction() {
    return transactions;
  }

  void addTransaction(Transaction statement) {
    transactions.insert(0, statement);
    //แจ้งเตือน consumer
    notifyListeners();
  }
}
