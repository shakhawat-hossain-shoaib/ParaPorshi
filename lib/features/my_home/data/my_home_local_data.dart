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
    Bill(
      id: 'b1',
      type: BillType.electricity,
      monthLabel: 'নভেম্বর ২০২৪',
      amount: 1250.0,
      dueDate: DateTime(2024, 12, 10),
      status: BillStatus.unpaid,
    ),
    Bill(
      id: 'b2',
      type: BillType.gas,
      monthLabel: 'নভেম্বর ২০২৪',
      amount: 975.0,
      dueDate: DateTime(2024, 12, 15),
      status: BillStatus.paid,
    ),
    Bill(
      id: 'b3',
      type: BillType.serviceCharge, // Using serviceCharge as proxy for internet or add internet to enum if needed. For now using serviceCharge.
      monthLabel: 'ইন্টারনেট - নভেম্বর ২০২৪',
      amount: 800.0,
      dueDate: DateTime(2024, 12, 5),
      status: BillStatus.unpaid,
    ),
  ];

  static final List<Resident> residents = [
    Resident(
      id: 'r1',
      name: 'আব্দুর রহিম',
      role: 'Owner',
      flatNumber: 'A-1',
      phone: '01711111111',
      isPrimary: true,
    ),
    Resident(
      id: 'r2',
      name: 'করিম মিয়া',
      role: 'Tenant',
      flatNumber: 'A-2',
      phone: '01822222222',
    ),
    Resident(
      id: 'r3',
      name: 'রহিমা বেগম',
      role: 'Tenant',
      flatNumber: 'B-1',
      phone: '01933333333',
    ),
    Resident(
      id: 'r4',
      name: 'জামাল উদ্দিন',
      role: 'Owner',
      flatNumber: 'B-2',
      phone: '01644444444',
    ),
    Resident(
      id: 'r5',
      name: 'সালমা খাতুন',
      role: 'Tenant',
      flatNumber: 'C-1',
      phone: '01555555555',
    ),
    Resident(
      id: 'r6',
      name: 'রফিক আহমেদ',
      role: 'Tenant',
      flatNumber: 'C-2',
      phone: '01766666666',
    ),
    Resident(
      id: 'r7',
      name: 'নাজমা আক্তার',
      role: 'Owner',
      flatNumber: 'D-1',
      phone: '01877777777',
    ),
    Resident(
      id: 'r8',
      name: 'কামাল হোসেন',
      role: 'Tenant',
      flatNumber: 'D-2',
      phone: '01988888888',
    ),
    Resident(
      id: 'r9',
      name: 'ফাতেমা বেগম',
      role: 'Tenant',
      flatNumber: 'E-1',
      phone: '01699999999',
    ),
    Resident(
      id: 'r10',
      name: 'হাসান মাহমুদ',
      role: 'Owner',
      flatNumber: 'E-2',
      phone: '01500000000',
    ),
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
