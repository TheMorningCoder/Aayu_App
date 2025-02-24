import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/transaction_card.dart';
import 'package:aayu_app/modules/user/data/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({super.key});

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text("Purchase History",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 16.sp,
            ),
            onPressed: () {
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
          backgroundColor: AppColors.primaryWhiteColor,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ListView.builder(
              itemCount: transactionData.length,
              itemBuilder: (context, index) {
                final transaction = transactionData[index];
                return TransactionCard(
                  orderId: transaction['orderId'],
                  transactionTitle: transaction['title'],
                  transactionSubtitle: transaction['subtitle'],
                  isDeducted: transaction['isDeducted'],
                  transactionPoints: transaction['points'],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
