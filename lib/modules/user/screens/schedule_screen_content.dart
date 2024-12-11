import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/hyperlink_text.dart';
import 'package:aayu_app/modules/user/components/schedule_class_card.dart';
import 'package:aayu_app/modules/user/data/scheduled_class_data.dart';
import 'package:aayu_app/modules/user/screens/popups/informational_popup.dart';
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
  bool showTimeSlots = false;
  String? _selectedTimeSlot;
  final List<String> timeSlots = [
    "10:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "04:00 PM",
    "05:00 PM",
    "07:00 PM"
  ];

  void scheduleClass() {
    if (_selectedTimeSlot != null) {
      showDialog(
        context: context,
        builder: (context) => InformationalPopup(
          icon: Icons.check_circle,
          iconColor: AppColors.popupGreenColor,
          heading: "Congratulations!",
          description:
              "Your class is scheduled now hit the gym and stay stronger",
          buttonText: "Let's Go",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a time slot.")),
      );
    }
  }

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
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                    showTimeSlots =
                        true; // Show time slots when a date is selected
                    _selectedTimeSlot = null; // Reset time slot selection
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
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    if (day.isBefore(DateTime.now())) {
                      // Make previous days inactive and change font color
                      return Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                              color: AppColors.bodyNeutralColor),
                        ),
                      );
                    }
                    // For active days, use the default style
                    return null;
                  },
                  todayBuilder: (context, day, focusedDay) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppColors.secondaryLighterYellowColor,
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (context, day, focusedDay) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppColors.primaryBrownColor,
                        shape: BoxShape.rectangle,
                      ),
                      child: Center(
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                              color: AppColors.primaryWhiteColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
              if (showTimeSlots) ...[
                SizedBox(height: 20.h),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: timeSlots.map((timeSlot) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTimeSlot = timeSlot;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: _selectedTimeSlot == timeSlot
                              ? AppColors.secondaryLighterYellowColor
                              : AppColors.primaryWhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          timeSlot,
                          style: const TextStyle(
                            color: AppColors.titleHeadingColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),
                // Schedule Button
                SizedBox(height: 20.h),
                PrimaryButton(
                  text: 'Schedule Class',
                  onPressed: scheduleClass,
                  width: double.infinity,
                  height: 50.h,
                  buttonColor: AppColors.primaryBrownColor,
                  buttonTextColor: AppColors.primaryWhiteColor,
                ),
              ],
              const SizedBox(height: 20),
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
