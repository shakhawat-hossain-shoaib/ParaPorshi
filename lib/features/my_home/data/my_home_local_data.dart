// lib/features/my_home/data/my_home_local_data.dart
import 'package:hyperlocal_hub_bd/features/my_home/models/bill.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/home_info.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/resident.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/notice.dart';

class MyHomeLocalData {
  // Simulated "current user is owner" flag for demo.
  // In real app replace this check with actual auth / profile verification.
  static bool currentUserIsOwner = true;

  static final HomeInfo homeInfo = HomeInfo(
    buildingName: 'শান্তি নিকেতন',
    flatNo: 'বি-৪',
    road: 'রোড ৫',
    area: 'মোহাম্মদপুর',
    ward: 'ওয়ার্ড ১৭',
    city: 'ঢাকা',
    ownerName: 'মোঃ আসাদুজ্জামান',
    contactPhone: '017xxxxxxxx',
    familyMembers: 4,
    livingSince: DateTime(2018, 3, 15), flatNumber: '', addressLine: '', wardName: '', ownershipType: '', residentsCount: 4,
  );

  static final List<Bill> bills = [
    // ... existing bills ...
  ];

  static final List<Resident> residents = [
    // ... existing residents ...
  ];

  // Notices (Notice Board)
  static final List<Notice> notices = [
    Notice(
      id: 'n1',
      title: 'বার্ষিক বারান্দা পরিচ্ছন্নতা',
      body: 'আগামী শনিবার সকাল ৯টায় সবাই অংশগ্রহণ করবেন। ব্রাশ, বালতি আনতে বলছি।',
      authorName: 'বাড়ি কমিটি',
      createdAt: DateTime.now().subtract(const Duration(days: 2, hours: 3)),
    ),
    Notice(
      id: 'n2',
      title: 'জেনারেটর রক্ষণাবেক্ষণ',
      body: 'রোববার রাত ১০টা থেকে ১২টা পর্যন্ত জেনারেটর চেক করা হবে — শব্দ হবে।',
      authorName: 'মোঃ আসাদুজ্জামান',
      createdAt: DateTime.now().subtract(const Duration(days: 1, hours: 6)),
    ),
  ];
}
