import 'package:flutter/foundation.dart';
import 'package:flutter_database/models/Transaction.dart';

class TransactionProvider with ChangeNotifier {
  //ตัวอย่างข้อมูล
  List<Transaction> transactions = [
    Transaction(title: "หนังสือ", amount: 800, date: DateTime.now()),
    Transaction(title: "รองเท้า", amount: 1000, date: DateTime.now()),
    Transaction(title: "กระเป๋า", amount: 500, date: DateTime.now()),
    Transaction(title: "ปากกา", amount: 200, date: DateTime.now()),
  ];

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
