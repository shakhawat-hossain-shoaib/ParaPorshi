// lib/features/my_home/presentation/screens/notice_board_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_repository.dart';
import 'package:hyperlocal_hub_bd/features/my_home/models/notice.dart';
import 'package:hyperlocal_hub_bd/features/my_home/data/my_home_local_data.dart';
import 'package:hyperlocal_hub_bd/core/widgets/back_app_bar.dart';
import 'create_notice_screen.dart';

class NoticeBoardScreen extends StatefulWidget {
  const NoticeBoardScreen({super.key});

  @override
  State<NoticeBoardScreen> createState() => _NoticeBoardScreenState();
}

class _NoticeBoardScreenState extends State<NoticeBoardScreen> {
  late Future<List<Notice>> _futureNotices;

  @override
  void initState() {
    super.initState();
    _futureNotices = myHomeRepository.getNotices();
  }

  Future<void> _refresh() async {
    setState(() {
      _futureNotices = myHomeRepository.getNotices();
    });
    await _futureNotices;
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return 'এখনই';
    if (diff.inMinutes < 60) return '${diff.inMinutes} মিনিট আগে';
    if (diff.inHours < 24) return '${diff.inHours} ঘন্টা আগে';
    return '${diff.inDays} দিন আগে';
  }

  @override
  Widget build(BuildContext context) {
    final isOwner = MyHomeLocalData.currentUserIsOwner;

    return Scaffold(
      appBar: const BackAppBar(title: 'নোটিশ বোর্ড'),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<Notice>>(
          future: _futureNotices,
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final notices = snap.data ?? [];
            if (notices.isEmpty) {
              return ListView(children: const [SizedBox(height: 60), Center(child: Text('কোনো নোটিশ নেই।'))]);
            }
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final n = notices[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    title: Text(n.title, style: AppTypography.body1),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(n.body, style: AppTypography.body2),
                        const SizedBox(height: 8),
                        Text('${n.authorName} • ${_timeAgo(n.createdAt)}',
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: isOwner
          ? FloatingActionButton.extended(
        onPressed: () async {
          await context.push('/my-home/notice-board/create');
          _refresh();
        },
        label: const Text('নতুন নোটিশ'),
        icon: const Icon(Icons.post_add),
      )
          : null,
    );
  }
}
