// lib/features/my_home/data/my_home_local_data.dart

import '../models/bill.dart';
import '../models/resident.dart';
import '../models/home_info.dart';

class MyHomeLocalData {
  static HomeInfo get homeInfo => HomeInfo(
    flatNumber: 'A-3',
    buildingName: 'Green View Residence',
    addressLine: 'Road 12, Mohammadpur',
    wardName: 'Ward 17, Mohammadpur',
    ownershipType: 'Owner',
    residentsCount: 4,
    notes: 'Registered in ParaConnect since 2024',
  );

  static List<Bill> get bills => [
    Bill(
      id: 'b1',
      type: BillType.electricity,
      monthLabel: 'January 2025',
      amount: 2350,
      dueDate: DateTime(2025, 2, 10),
      status: BillStatus.overdue,
    ),
    Bill(
      id: 'b2',
      type: BillType.water,
      monthLabel: 'January 2025',
      amount: 450,
      dueDate: DateTime(2025, 2, 8),
      status: BillStatus.unpaid,
    ),
    Bill(
      id: 'b3',
      type: BillType.serviceCharge,
      monthLabel: 'January 2025',
      amount: 1500,
      dueDate: DateTime(2025, 2, 15),
      status: BillStatus.paid,
    ),
  ];

  static List<Resident> get residents => [
    Resident(
      id: 'r1',
      name: 'Rahman Ahmed',
      role: 'Owner',
      phone: '017xxxxxxxx',
      isPrimary: true,
    ),
    Resident(
      id: 'r2',
      name: 'Nusrat Jahan',
      role: 'Owner',
      phone: '018xxxxxxxx',
    ),
    Resident(
      id: 'r3',
      name: 'Siam Rahman',
      role: 'Family',
    ),
    Resident(
      id: 'r4',
      name: 'Tanha Rahman',
      role: 'Family',
    ),
  ];
}
