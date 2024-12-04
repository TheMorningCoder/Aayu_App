import 'package:aayu_app/core/themes/app_colors.dart';
import 'package:aayu_app/modules/user/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommunityStreakCard extends StatefulWidget {
  final int streakDays;
  final List<Map<String, String>> users;

  const CommunityStreakCard({
    required this.streakDays,
    required this.users,
    super.key,
  });

  @override
  _CommunityStreakCardState createState() => _CommunityStreakCardState();
}

class _CommunityStreakCardState extends State<CommunityStreakCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: ListTile(
              title: Text(
                '${widget.streakDays} Day Streak',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.titleHeadingColor),
              ),
              subtitle: Text(
                'Checkout community members with ${widget.streakDays} days streak',
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.bodyNeutralColor),
              ),
              trailing: Icon(
                _isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
            ),
          ),
          if (_isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: widget.users
                    .map(
                      (user) => UserBasicInfoCard(
                        userName: user['name']!,
                        userImage: user['image']!,
                      ),
                    )
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}

class UserBasicInfoCard extends StatelessWidget {
  final String userName;
  final String userImage;

  const UserBasicInfoCard({
    required this.userName,
    required this.userImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(userImage),
              radius: 18.sp,
            ),
            SizedBox(width: 10.w),
            Text(
              userName,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
