// lib/features/my_home/data/my_home_repository.dart
import 'dart:async';
import 'package:uuid/uuid.dart';

import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_local_data.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/bill.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/home_info.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/resident.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/notice.dart';

class MyHomeRepository {
  Future<HomeInfo> getHomeInfo() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return MyHomeLocalData.homeInfo;
  }

  Future<List<Bill>> getBills() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return MyHomeLocalData.bills;
  }

  Future<List<Resident>> getResidents() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return MyHomeLocalData.residents;
  }

  // Notices
  Future<List<Notice>> getNotices() async {
    await Future.delayed(const Duration(milliseconds: 150));
    // return newest first
    final list = List<Notice>.from(MyHomeLocalData.notices);
    list.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return list;
  }

  Future<Notice> addNotice({
    required String title,
    required String body,
    required String authorName,
  }) async {
    // check permission (demo: only owner allowed)
    if (!MyHomeLocalData.currentUserIsOwner) {
      throw Exception('Not allowed');
    }

    final id = const Uuid().v4();
    final notice = Notice(
      id: id,
      title: title,
      body: body,
      authorName: authorName,
      createdAt: DateTime.now(),
    );

    // persist locally
    MyHomeLocalData.notices.add(notice);

    // simulate delay
    await Future.delayed(const Duration(milliseconds: 200));
    return notice;
  }
}

// singleton
final myHomeRepository = MyHomeRepository();
