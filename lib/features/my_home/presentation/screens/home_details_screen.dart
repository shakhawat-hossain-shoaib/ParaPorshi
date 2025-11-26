// lib/features/my_home/presentation/screens/home_details_screen.dart
import 'package:flutter/material.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/home_info_row.dart';
import 'package:hyperlocal_hub_bd/features/my_home/presentation/widgets/my_home_header.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';

/// Home Details: shows detailed info about the home
class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  String _safe(dynamic src, List<String> keys) {
    if (src == null) return '';
    for (final k in keys) {
      try {
        final v = (src as dynamic).toJson != null ? (src as dynamic).toJson()[k] : null;
        if (v != null && v.toString().isNotEmpty) return v.toString();
      } catch (_) {}
      try {
        final v = (src as dynamic).__getProperty != null ? null : (src as dynamic);
        // ignore; fallback to direct property access below
      } catch (_) {}
      try {
        final v = (src as dynamic).buildinName; // ignore
        // ignore
      } catch (_) {}
      try {
        final value = (src as dynamic);
        // direct property attempts:
        try {
          final prop = (src as dynamic).getProperty != null ? null : null;
          // ignore
        } catch (_) {}
      } catch (_) {}
      // pragmatic direct property attempts
      for (final prop in keys) {
        try {
          final candidate = (src as dynamic);
          final val = (candidate as dynamic).__noSuchMethod != null ? null : null;
          // ignore — below try direct property
        } catch (_) {}
        try {
          final val = (src as dynamic).__getProperty == null ? null : null;
        } catch (_) {}
        try {
          final dynamic v = (src as dynamic);
          // direct named access:
          switch (propNameToConst(keys.first)) {
          // not needed here; handled in final block below
            default:
              break;
          }
        } catch (_) {}
      }
    }
    // simpler fallback: try common named getters
    try {
      final candidate = src as dynamic;
      for (final k in keys) {
        try {
          final v = candidate.__proto__ == null ? null : null;
        } catch (_) {}
      }
    } catch (_) {}
    // Last attempt: try direct known names
    try {
      final candidate = src as dynamic;
      for (final k in keys) {
        try {
          final val = (candidate as dynamic).toJson != null ? (candidate as dynamic).toJson()[k] : null;
          if (val != null && val.toString().isNotEmpty) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).buildingName;
          if (val != null && val.toString().isNotEmpty && keys.contains('buildingName')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).flatNo;
          if (val != null && val.toString().isNotEmpty && keys.contains('flatNo')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).flatNumber;
          if (val != null && val.toString().isNotEmpty && keys.contains('flatNumber')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).addressLine;
          if (val != null && val.toString().isNotEmpty && keys.contains('addressLine')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).road;
          if (val != null && val.toString().isNotEmpty && keys.contains('road')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).area;
          if (val != null && val.toString().isNotEmpty && keys.contains('area')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).ward;
          if (val != null && val.toString().isNotEmpty && keys.contains('ward')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).wardName;
          if (val != null && val.toString().isNotEmpty && keys.contains('wardName')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).city;
          if (val != null && val.toString().isNotEmpty && keys.contains('city')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).ownerName;
          if (val != null && val.toString().isNotEmpty && keys.contains('ownerName')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).owner;
          if (val != null && val.toString().isNotEmpty && keys.contains('owner')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).contactPhone;
          if (val != null && val.toString().isNotEmpty && keys.contains('contactPhone')) return val.toString();
        } catch (_) {}
        try {
          final val = (candidate as dynamic).phone;
          if (val != null && val.toString().isNotEmpty && keys.contains('phone')) return val.toString();
        } catch (_) {}
      }
    } catch (_) {}
    return '';
  }

  // helper for simple fallback access
  String propNameToConst(String s) => s;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
      future: myHomeRepository.getHomeInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        if (snapshot.hasError) {
          return Scaffold(body: Center(child: Text('ত্রুটি: ${snapshot.error}')));
        }
        final info = snapshot.data;
        if (info == null) {
          return const Scaffold(body: Center(child: Text('কোনো বাড়ির তথ্য পাওয়া যায়নি।')));
        }

        // try likely fields
        final building = _safe(info, ['buildingName', 'flatNumber', 'flatNo']);
        final flat = _safe(info, ['flatNo', 'flatNumber']);
        final road = _safe(info, ['road', 'addressLine']);
        final area = _safe(info, ['area', 'addressLine']);
        final ward = _safe(info, ['ward', 'wardName', 'wardNo']);
        final city = _safe(info, ['city', 'town']);
        final owner = _safe(info, ['owner', 'ownerName', 'buildingName']);
        final contact = _safe(info, ['contactPhone', 'phone']);
        final members = _safe(info, ['familyMembers', 'residentsCount']);

        return Scaffold(
          appBar: const BackAppBar(title: 'বাড়ির বিস্তারিত'),
          body: ListView(
            children: [
              // try to use MyHomeHeader if compatible
              tryBuildHeader(info),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('বাড়ির তথ্য', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    HomeInfoRow(label: 'বিল্ডিং নাম', value: building),
                    HomeInfoRow(label: 'ফ্ল্যাট নম্বর', value: flat),
                    HomeInfoRow(label: 'রোড', value: road),
                    HomeInfoRow(label: 'এলাকা', value: area),
                    HomeInfoRow(label: 'ওয়ার্ড', value: ward),
                    HomeInfoRow(label: 'শহর', value: city),
                    const SizedBox(height: 12),
                    const Text('যোগাযোগ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    HomeInfoRow(label: 'মালিক/প্রধান', value: owner),
                    HomeInfoRow(label: 'মোবাইল', value: contact),
                    const SizedBox(height: 16),
                    HomeInfoRow(label: 'পরিবারের সদস্য', value: members),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget tryBuildHeader(dynamic info) {
    try {
      return MyHomeHeader(homeInfo: info);
    } catch (_) {
      final building = _safe(info, ['buildingName', 'flatNumber', 'flatNo']);
      final flat = _safe(info, ['flatNo', 'flatNumber']);
      final area = _safe(info, ['area', 'addressLine']);
      final owner = _safe(info, ['owner', 'ownerName', 'buildingName']);
      final summary = '$building, ফ্ল্যাট $flat\n$area';
      return Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration:
              BoxDecoration(color: AppColors.primary.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
              child: const Icon(Icons.house_rounded, color: AppColors.primary, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(owner, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(summary, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
              ]),
            ),
          ],
        ),
      );
    }
  }
}
