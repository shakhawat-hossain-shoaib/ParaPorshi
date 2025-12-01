// lib/features/polls/presentation/screens/polls_list_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlocal_hub_bd/core/models/poll.dart';
import 'package:hyperlocal_hub_bd/config/app_colors.dart';
import 'package:hyperlocal_hub_bd/config/app_typography.dart';

class PollsListScreen extends StatelessWidget {
  const PollsListScreen({super.key});

  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildList(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/polls/create');
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final polls = [
      PollModel(
        id: '1',
        question: 'ময়লা তোলার সেরা সময় কোনটা?',
        options: [
          PollOption(id: '1', label: 'সকাল', votes: 12),
          PollOption(id: '2', label: 'বিকাল', votes: 8),
          PollOption(id: '3', label: 'রাত', votes: 3),
        ],
        expiresAt: DateTime.now().add(const Duration(days: 1)),
      ),
    ];

    if (polls.isEmpty) {
      return const Center(child: Text('কোনো পোল নেই।'));
    }

    return ListView.builder(
      itemCount: polls.length,
      itemBuilder: (context, index) {
        final poll = polls[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(poll.question, style: AppTypography.body1),
                const SizedBox(height: 8),
                ...poll.options.map((o) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Row(
                      children: [
                        Expanded(child: Text(o.label)),
                        Text('${o.votes} ভোট'),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
