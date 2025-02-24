import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {
  final String orderId;
  final String transactionTitle;
  final String transactionSubtitle;
  final bool isDeducted;
  final int transactionPoints;

  const TransactionCard({
    super.key,
    required this.orderId,
    required this.transactionTitle,
    required this.transactionSubtitle,
    required this.isDeducted,
    required this.transactionPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.lightBlackColor),
      ),
      color: AppColors.primaryWhiteColor,
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Order Id : $orderId",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
            SizedBox(height: 4.h),
            Text(transactionTitle,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text(transactionSubtitle,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600])),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(isDeducted ? "Deducted" : "Added",
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
                Text(
                  "${isDeducted ? "-" : "+"}$transactionPoints",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isDeducted ? Colors.red : Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
