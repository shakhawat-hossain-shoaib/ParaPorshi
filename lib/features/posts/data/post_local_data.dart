// lib/features/posts/data/post_local_data.dart
import 'package:hyperlocal_hub_bd/core/models/post.dart';

class PostLocalData {
  static final List<Post> posts = [
    Post(
      id: '1',
      type: 'alert',
      title: 'আজ সকাল ১০টা থেকে পানি থাকবে না',
      content:
      'লাইন মেরামতের কাজ চলবে ১০টা–৪টা পর্যন্ত। আগে থেকে পানি জমা করে রাখুন।',
      authorName: 'Ward 17 Office',
      createdAt: DateTime.now().subtract(const Duration(minutes: 20)),
      upvotes: 12,
      commentsCount: 3,
      comments: [
        PostComment(
          id: 'c1',
          authorName: 'Shila Apa',
          text: 'ধন্যবাদ আগেই জানিয়ে দেওয়ার জন্য।',
          createdAt: DateTime.now().subtract(const Duration(minutes: 15)),
        ),
        PostComment(
          id: 'c2',
          authorName: 'Rafi',
          text: 'Hostel এও কি একই টাইম?',
          createdAt: DateTime.now().subtract(const Duration(minutes: 10)),
        ),
        PostComment(
          id: 'c3',
          authorName: 'Ward 17 Office',
          text: 'হ্যাঁ, পুরো ওয়ার্ডের জন্য প্রযোজ্য।',
          createdAt: DateTime.now().subtract(const Duration(minutes: 8)),
        ),
      ],
    ),
    Post(
      id: '2',
      type: 'marketplace',
      title: 'স্টাডি টেবিল বিক্রি হবে',
      content: '২ বছর ব্যবহার, ভালো কন্ডিশন। নিজে এসে নিয়ে যেতে হবে।',
      authorName: 'Rafi',
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      upvotes: 4,
      commentsCount: 2,
      comments: [
        PostComment(
          id: 'c4',
          authorName: 'Sumon',
          text: 'টেবিলের উচ্চতা কত ইঞ্চি?',
          createdAt:
          DateTime.now().subtract(const Duration(hours: 1, minutes: 30)),
        ),
        PostComment(
          id: 'c5',
          authorName: 'Rafi',
          text: 'প্রায় ৩০-৩১ ইঞ্চি।',
          createdAt:
          DateTime.now().subtract(const Duration(hours: 1, minutes: 10)),
        ),
      ],
    ),
    Post(
      id: '3',
      type: 'service',
      title: 'ইলেকট্রিশিয়ান প্রয়োজন হলে কল করুন',
      content: '২৪/৭ সার্ভিস, Ward 17 এলাকায়। ঘন্টা অনুযায়ী চার্জ।',
      authorName: 'Jewel Electric',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      upvotes: 8,
      commentsCount: 1,
      comments: [
        PostComment(
          id: 'c6',
          authorName: 'Nasima Begum',
          text: 'আগেও কাজ করিয়েছি, বেশ ভালো কাজ করেন।',
          createdAt: DateTime.now().subtract(const Duration(hours: 3)),
        ),
      ],
    ),
  ];
}
