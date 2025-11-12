import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/exam.dart';


class ExamScreen extends StatelessWidget {
  final Exam exam;
  const ExamScreen({super.key, required this.exam});

  String getTimeRemaining() {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now);

    if (difference.isNegative) {
      return "Испитот е завршен";
    } else {
      final days = difference.inDays;
      final hours = difference.inHours % 24;
      return "$days дена, $hours часа до испит";
    }
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(exam.dateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subj),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exam.subj,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Text(formattedDate, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.room, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        exam.room.join(', '),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.timer_outlined, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    Text(
                      getTimeRemaining(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
