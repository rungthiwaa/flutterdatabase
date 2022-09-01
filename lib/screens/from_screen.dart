import 'package:flutter/material.dart';
import 'package:flutter_database/models/Transactions.dart';
import 'package:flutter_database/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

class Fromscreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  //controller
  final titleControiller = TextEditingController(); //รับค่าชื่อรายการ
  final amountController = TextEditingController(); //รับตัวเลขจำนวนเงิน
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: new InputDecoration(labelText: "ชื่อรายการ"),
                    autofocus: true,
                    controller: titleControiller,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนชื่อรายการ";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: new InputDecoration(labelText: "จำนวนเงิน"),
                    keyboardType: TextInputType.number,
                    controller: amountController,
                    validator: (String? str) {
                      if (str!.isEmpty) {
                        return "กรุณาป้อนจำนวนเงิน";
                      }

                      if (double.parse(str) <= 0) {
                        return "กรุณาป้อนตัวเลขมากกว่า0";
                      }
                      return null;
                    },
                  ),
                  FlatButton(
                      child: Text("เพิ่มข้อมูล"),
                      color: Colors.red.shade400,
                      textColor: Colors.white,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          var title = titleControiller.text;
                          var amount = amountController.text;

                          //เตรียมข้อมูล
                          Transactions statement = Transactions(
                              title: title,
                              amount: double.parse(amount),
                              date: DateTime.now()); //object

                          //เรียกprovider
                          var provider = Provider.of<TransactionProvider>(
                              context,
                              listen: false);
                          provider.addTransaction(statement);

                          print(title);
                          print(amount);

                          Navigator.pop(context);
                        }
                      })
                ],
              )),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
