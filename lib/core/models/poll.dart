// lib/core/models/poll.dart

class PollOption {
  final String id;
  final String label;
  final int votes;

  PollOption({
    required this.id,
    required this.label,
    required this.votes,
  });
}

class PollModel {
  final String id;
  final String question;
  final List<PollOption> options;
  final DateTime expiresAt;
  final bool hasVoted;

  PollModel({
    required this.id,
    required this.question,
    required this.options,
    required this.expiresAt,
    this.hasVoted = false,
  });
}
