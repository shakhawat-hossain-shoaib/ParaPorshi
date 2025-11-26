// lib/features/services_directory/presentation/screens/service_provider_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class ServiceProviderDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? provider;
  const ServiceProviderDetailScreen({super.key, this.provider});

  String _s(Map<String, dynamic>? m, String key, [String fallback = '']) {
    if (m == null) return fallback;
    final v = m[key];
    return v == null ? fallback : v.toString();
  }
  @override
  Widget build(BuildContext context) {
    final p = provider ??
        {
          'name': 'Jewel Electric',
          'role': 'ইলেক্ট্রিশিয়ান',
          'rating': 4.7,
          'reviews': 56,
          'tags': ['জরুরি সেবা', 'সাময়িক'],
          'about':
          '২৪/৭ ইলেকট্রিশিয়ান সার্ভিস, দ্রুত ও নির্ভরযোগ্য। ওয়ার্ড ১৭-এ কাজ করা হয়।',
          'services': [
            'পাইপ মেরামত ও পরিবর্তন',
            'চ্যানেলট ও বাথরুম মেরামত',
            'ওয়াটার ফিল্টার ইনস্টলেশন',
            'জেন পরিষ্কার'
          ],
          'distance': '৩০০ মিটার',
          'phone': '017xxxxxxxx',
          'photos': ['https://via.placeholder.com/800x450.png?text=Work+Photo+1'],
        };

    final tags = (p['tags'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? <String>[];
    final services = (p['services'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? <String>[];
    final photos = (p['photos'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? <String>[];

    // bottom bar height (used to pad the list so content not hidden)
    const double bottomBarHeight = 72.0;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              context.go('/services');
            }
          },
        ),
        title: const Text('সেবা প্রদানকারী'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primary.withOpacity(0.1),
                child: const Icon(Icons.build_outlined, size: 30),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_s(p, 'name', 'Jewel Electric'), style: AppTypography.h2),
                  const SizedBox(height: 4),
                  Text('${_s(p, 'role', 'ইলেকট্রিশিয়ান')} • ${_s(p, 'distance', '৩০০ মিটার দূরে')}', style: AppTypography.body2),
                  const SizedBox(height: 4),
                  Row(children: [
                    const Icon(Icons.star, size: 16, color: Colors.amber),
                    const SizedBox(width: 4),
                    Text(_s(p, 'rating', '4.7'), style: AppTypography.body2),
                    const SizedBox(width: 6),
                    Text('(${_s(p, 'reviews', '0')} রিভিউ)', style: AppTypography.body2),
                  ])
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // পরিচিতি
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('পরিচিতি', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Text(_s(p, 'about', 'বিস্তারিত পাওয়া যায়নি।'), style: AppTypography.body1),
                ]),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // সেবা সমূহ
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('সেবা সমূহ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  if (services.isEmpty)
                    Text('সেবা তালিকা খালি', style: AppTypography.body2)
                  else
                    Column(
                      children: services
                          .map(
                            (s) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Row(children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 18),
                            const SizedBox(width: 8),
                            Expanded(child: Text(s, style: AppTypography.body2)),
                          ]),
                        ),
                      )
                          .toList(),
                    ),
                ]),
              ),
            ),
          ),

          const SizedBox(height: 12),

          // রিভিউ
          const SizedBox(height: 24),

          const SizedBox(height: 12),

          // Big photo placeholder / first photo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: photos.isNotEmpty
                  ? Image.network(photos.first, height: 180, width: double.infinity, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 180, color: Colors.grey.shade200, child: const Center(child: Icon(Icons.broken_image, size: 42))))
                  : Container(height: 180, color: Colors.grey.shade100, child: const Center(child: Icon(Icons.photo, size: 42))),
            ),
          ),

          const SizedBox(height: 24),
        ],
      ),

      // Fixed bottom action bar: chat + call
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.all(12),
        child: Container(
          height: bottomBarHeight - 12,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              // chat circular button
              Material(
                elevation: 2,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: InkWell(
                  onTap: () {
                    final phone = _s(p, 'phone');
                    if (phone.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ফোন নম্বর পাওয়া যায়নি')));
                      return;
                    }
                    // placeholder: open chat
                    // ignore: avoid_print
                    print('Open chat with $phone');
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('চ্যাট খোला হবে')));
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 54,
                    height: 54,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.chat_bubble_outline, color: AppColors.primary),
                  ),
                ),
              ),

              const SizedBox(width: 12),

              // Expanded big call button
              Expanded(
                child: SizedBox(
                  height: 54,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                    ),
                    onPressed: () {
                      final phone = _s(p, 'phone');
                      if (phone.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('ফোন নম্বর পাওয়া যায়নি')));
                        return;
                      }
                      // placeholder: call action (use url_launcher for real call)
                      // ignore: avoid_print
                      print('Calling $phone');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('কল করা হচ্ছে: $phone')));
                    },
                    icon: const Icon(Icons.call, size: 18),
                    label: const Text('কল করুন'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _reviewTile(String initial, String name, int rating, String whenAgo, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 18, backgroundColor: AppColors.primary.withOpacity(0.12), child: Text(initial, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w700))),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(width: 8),
              const Icon(Icons.star, size: 14, color: Colors.amber),
              const SizedBox(width: 4),
              Text('$rating', style: const TextStyle(fontSize: 12)),
              const Spacer(),
              Text(whenAgo, style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ]),
            const SizedBox(height: 6),
            Text(text, style: const TextStyle(color: Colors.black87)),
          ]),
        )
      ]),
    );
  }
}
