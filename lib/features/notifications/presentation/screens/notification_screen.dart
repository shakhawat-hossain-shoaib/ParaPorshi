import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy notifications
    final notifications = [
      {
        'title': 'নতুন বিল এসেছে',
        'body': 'আপনার ডিসেম্বর মাসের বিদ্যুৎ বিল তৈরি হয়েছে।',
        'time': '১০ মিনিট আগে',
        'isRead': false,
      },
      {
        'title': 'মিটিং রিমাইন্ডার',
        'body': 'আজ সন্ধ্যা ৭টায় সোসাইটি মিটিং।',
        'time': '১ ঘণ্টা আগে',
        'isRead': true,
      },
      {
        'title': 'নিরাপত্তা সতর্কবার্তা',
        'body': 'ব্লক বি-তে অপরিচিত ব্যক্তি দেখা গেছে।',
        'time': '২ ঘণ্টা আগে',
        'isRead': true,
      },
    ];

    return Scaffold(
      appBar: const BackAppBar(title: 'নোটিফিকেশন'),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final isRead = notif['isRead'] as bool;
          return Container(
            color: isRead ? null : AppColors.primary.withOpacity(0.05),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isRead ? Colors.grey[200] : AppColors.primary.withOpacity(0.1),
                child: Icon(
                  Icons.notifications,
                  color: isRead ? Colors.grey : AppColors.primary,
                ),
              ),
              title: Text(
                notif['title'] as String,
                style: TextStyle(
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(notif['body'] as String),
                  const SizedBox(height: 4),
                  Text(
                    notif['time'] as String,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              onTap: () {
                // TODO: Mark as read or navigate
              },
            ),
          );
        },
      ),
    );
  }
}
