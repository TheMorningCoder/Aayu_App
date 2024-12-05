import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/components/schedule_class_card.dart';
import 'package:aayu_app/modules/user/data/scheduled_class_data.dart';
import 'package:aayu_app/shared/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aayu_app/modules/user/components/top_name_bar.dart';

class ScheduleScreenContent extends StatefulWidget {
  const ScheduleScreenContent({super.key});

  @override
  ScheduleScreenContentState createState() => ScheduleScreenContentState();
}

class ScheduleScreenContentState extends State<ScheduleScreenContent> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration:
              const BoxDecoration(color: AppColors.lighterBrownBackgroundColor),
          child: Column(
            children: [
              // Top Bar Section
              SizedBox(height: 14.h),
              const TopNameBar(name: "Karthik"),
              // Calendar Widget
              TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay; // Update focusedDay as well
                  });
                },
                calendarFormat: CalendarFormat.month,
                startingDayOfWeek: StartingDayOfWeek.sunday,
                calendarStyle: const CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: AppColors.primaryBrownColor,
                    shape: BoxShape.rectangle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: AppColors.secondaryLighterYellowColor,
                    shape: BoxShape.rectangle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: AppColors.secondaryLighterYellowColor,
                    shape: BoxShape.rectangle,
                  ),
                  // Customize text styles
                  todayTextStyle: TextStyle(
                    color:
                        Colors.black, // Change to your desired color for today
                    fontWeight: FontWeight.bold,
                  ),
                  selectedTextStyle: TextStyle(
                    color: Colors
                        .white, // Change to your desired color for selected days
                  ),
                  defaultTextStyle: TextStyle(
                    color: Colors
                        .black, // Change to your desired default text color
                  ),
                  weekendTextStyle: TextStyle(
                    color: Colors.red, // Change to your desired weekend color
                  ),
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Schedule Button
              PrimaryButton(
                text: 'Schedule Class',
                onPressed: () {},
                width: double.infinity,
                height: 50.h,
                buttonColor: AppColors.primaryBrownColor,
                buttonTextColor: AppColors.primaryWhiteColor,
              ),
              const SizedBox(height: 20),
              // Upcoming Classes Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming Classes",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.titleHeadingColor,
                    ),
                  ),
                  const HyperlinkText(text: "see more"),
                ],
              ),

              LayoutBuilder(
                builder: (context, constraints) {
                  return Column(
                    children: scheduleData.map((schedule) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: ScheduleClassCard(
                          classDate: schedule['classDate']!,
                          instructorName: schedule['instructorName']!,
                          classTime: schedule['classTime']!,
                        ),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
