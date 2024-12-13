// // import 'package:aayu_app/core/themes/app_colors.dart';
// // import 'package:aayu_app/modules/user/components/alert_bar.dart';
// // import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
// // import 'package:aayu_app/modules/user/components/schedule_class_card.dart';
// // import 'package:aayu_app/modules/user/data/scheduled_class_data.dart';
// // import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
// // import 'package:aayu_app/shared/components/primary_button.dart';
// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// // import 'package:aayu_app/modules/user/components/top_name_bar.dart';

// Container(
//   color: Colors.grey[200], // Set your desired background color
//   child: TableCalendar(
//     firstDay: DateTime.utc(2020, 1, 1),
//     lastDay: DateTime.utc(2030, 12, 31),
//     focusedDay: _focusedDay,
//     selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//     onDaySelected: (selectedDay, focusedDay) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         showTimeSlots = true; // Show time slots when a date is selected
//         _selectedTimeSlot = null; // Reset time slot selection
//       });
//     },
//     calendarFormat: CalendarFormat.month,
//     startingDayOfWeek: StartingDayOfWeek.sunday,
//     calendarStyle: CalendarStyle(
//       rowHeight: 40.0, // Adjust the height of each row
//       selectedDecoration: BoxDecoration(
//         color: AppColors.primaryBrownColor,
//         shape: BoxShape.rectangle,
//       ),
//       todayDecoration: BoxDecoration(
//         color: AppColors.secondaryLighterYellowColor,
//         shape: BoxShape.rectangle,
//       ),
//     ),
//     headerStyle: const HeaderStyle(
//       formatButtonVisible: false,
//       titleCentered: true,
//       titleTextStyle: TextStyle(
//         fontSize: 18.0,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//     calendarBuilders: CalendarBuilders(
//       defaultBuilder: (context, day, focusedDay) {
//         if (day.isBefore(DateTime.now())) {
//           return Center(
//             child: Text(
//               day.day.toString(),
//               style: const TextStyle(color: AppColors.bodyNeutralColor),
//             ),
//           );
//         }
//         return null;
//       },
//       todayBuilder: (context, day, focusedDay) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: AppColors.secondaryLighterYellowColor,
//             shape: BoxShape.rectangle,
//           ),
//           child: Center(
//             child: Text(
//               day.day.toString(),
//               style: const TextStyle(color: Colors.black),
//             ),
//           ),
//         );
//       },
//       selectedBuilder: (context, day, focusedDay) {
//         return Container(
//           decoration: const BoxDecoration(
//             color: AppColors.primaryBrownColor,
//             shape: BoxShape.rectangle,
//           ),
//           child: Center(
//             child: Text(
//               day.day.toString(),
//               style: const TextStyle(color: AppColors.primaryWhiteColor),
//             ),
//           ),
//         );
//       },
//     ),
//   ),
// )
