import 'package:dailyexpenses/shared/extension.dart';
import 'package:flutter/material.dart';

class TipeDeposit extends StatelessWidget {
  const TipeDeposit(
    this.namaDeposit,
    this.isiSaldo,
  );

  final String namaDeposit;
  final String isiSaldo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$namaDeposit',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.height,
          Text(
            'Rp. ' + '$isiSaldo',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
              color: int.parse(isiSaldo) < 100000
                  ? Colors.red
                  : int.parse(isiSaldo) < 500000
                      ? Colors.blue
                      : Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
