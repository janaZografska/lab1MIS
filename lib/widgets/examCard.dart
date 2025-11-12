import 'package:flutter/material.dart';
import '../models/exam.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);
    final formattedDate = DateFormat('dd MMM yyyy, HH:mm').format(exam.dateTime);

    return Card(
      color: isPast ? Colors.grey.shade200 : Colors.deepPurple.shade50,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          isPast ? Icons.check_circle : Icons.schedule,
          color: isPast ? Colors.green : Colors.deepPurple,
          size: 32,
        ),
        title: Text(
          exam.subj,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.black54 : Colors.deepPurple,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.calendar_month, size: 16),
                const SizedBox(width: 5),
                Text(formattedDate),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 5),
                Text(exam.room.join(', ')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
