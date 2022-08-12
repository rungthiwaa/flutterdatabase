import 'package:flutter/material.dart';

class Fromscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แบบฟอร์มบันทึกข้อมูล"),
        ),
        body: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: new InputDecoration(labelText: "ชื่อรายการ"),
            ),
            TextFormField(
              decoration: new InputDecoration(labelText: "จำนวนเงิน"),
            ),
            FlatButton(
                child: Text("เพิ่มข้อมูล"),
                color: Colors.red.shade400,
                textColor: Colors.white,
                onPressed: () {})
          ],
        )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
