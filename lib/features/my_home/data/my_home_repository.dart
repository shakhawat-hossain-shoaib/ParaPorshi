// lib/features/my_home/data/my_home_repository.dart

import 'dart:async';
import 'my_home_local_data.dart';
import '../models/home_info.dart';
import '../models/bill.dart';
import '../models/resident.dart';

class MyHomeRepository {
  Future<HomeInfo> fetchHomeInfo() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MyHomeLocalData.homeInfo;
  }

  Future<List<Bill>> fetchBills() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MyHomeLocalData.bills;
  }

  Future<List<Resident>> fetchResidents() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return MyHomeLocalData.residents;
  }
}
