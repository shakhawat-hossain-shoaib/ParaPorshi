// lib/features/alerts/presentation/screens/alerts_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class AlertItem {
  final String title;
  final String subtitle;
  final String time;
  final String severity; // high / medium / low
  final String category; // safety / lost / utility / other

  AlertItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.severity,
    required this.category,
  });
}

class AlertsListScreen extends StatefulWidget {
  const AlertsListScreen({super.key});

  @override
  State<AlertsListScreen> createState() => _AlertsListScreenState();
}

class _AlertsListScreenState extends State<AlertsListScreen> {
  String _selectedCategory = 'all';

  final List<AlertItem> _alerts = [
    AlertItem(
      title: 'গ্যাস লিকের সন্দেহ',
      subtitle: 'Block C, Road 5 • জানালাগুলো খুলে রাখুন, সাবধানে থাকুন।',
      time: '৫ মিনিট আগে',
      severity: 'high',
      category: 'safety',
    ),
    AlertItem(
      title: 'শিশু হারিয়ে গেছে',
      subtitle: '৭ বছরের ছেলে, নীল টি-শার্ট। কেউ দেখলে যোগাযোগ করুন।',
      time: '২০ মিনিট আগে',
      severity: 'high',
      category: 'lost',
    ),
    AlertItem(
      title: 'বিদ্যুৎ বিভ্রাট',
      subtitle: 'রাত ১২টা পর্যন্ত লাইনে কাজ চলবে বলে জানানো হয়েছে।',
      time: '৩০ মিনিট আগে',
      severity: 'medium',
      category: 'utility',
    ),
    AlertItem(
      title: 'ড্রেন পরিষ্কার করা হবে',
      subtitle: 'রোড ৭, কাল সকাল ৯টা থেকে। গাড়ি সরিয়ে রাখুন।',
      time: '১ ঘন্টা আগে',
      severity: 'low',
      category: 'other',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredAlerts = _selectedCategory == 'all'
        ? _alerts
        : _alerts.where((a) => a.category == _selectedCategory).toList();

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header: title + "+ নতুন" button
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                Text(
                  'সতর্কতা',
                  style: AppTypography.h2.copyWith(fontSize: 20),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () {
                    debugPrint('Alerts: create button pressed');
                    context.go('/alerts/create');
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text(
                    'নতুন',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),

          // Category chips
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildCategoryChips(),
          ),

          const SizedBox(height: 8),

          // Alerts list
          Expanded(
            child: ListView.builder(
              itemCount: filteredAlerts.length,
              itemBuilder: (context, index) {
                final alert = filteredAlerts[index];
                return _AlertCard(alert: alert);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = [
      {'key': 'all', 'label': 'সব'},
      {'key': 'safety', 'label': 'নিরাপত্তা'},
      {'key': 'lost', 'label': 'হারিয়ে গেছে'},
      {'key': 'utility', 'label': 'ইউটিলিটি'},
      {'key': 'other', 'label': 'অন্যান্য'},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((cat) {
          final isSelected = _selectedCategory == cat['key'];
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(cat['label']!),
              selected: isSelected,
              selectedColor: AppColors.primary,
              labelStyle: TextStyle(
                fontSize: 13,
                color: isSelected ? Colors.white : AppColors.textPrimary,
              ),
              backgroundColor: const Color(0xFFF1F5F9),
              onSelected: (_) {
                setState(() => _selectedCategory = cat['key']!);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _AlertCard extends StatelessWidget {
  final AlertItem alert;

  const _AlertCard({required this.alert});

  Color _severityColor() {
    switch (alert.severity) {
      case 'high':
        return AppColors.alertDanger;
      case 'medium':
        return AppColors.alertWarning;
      default:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    final sevColor = _severityColor();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: sevColor.withOpacity(0.12),
          child: Icon(
            Icons.warning_amber_rounded,
            color: sevColor,
          ),
        ),
        title: Text(
          alert.title,
          style: AppTypography.body1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 2),
            Text(
              alert.subtitle,
              style: AppTypography.body2,
            ),
            const SizedBox(height: 4),
            Text(
              alert.time,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
