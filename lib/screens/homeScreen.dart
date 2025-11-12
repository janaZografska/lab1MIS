import 'package:flutter/material.dart';
import 'package:lab1/screens/examscreen.dart';
import '../models/exam.dart';
import '../widgets/examcard.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Exam> exams = [
      Exam(subj: "Структурно Програмирање", dateTime: DateTime(2025, 11, 15, 8, 0), room: ["лаб. 2", "лаб. 3", "лаб. 12"]),
      Exam(subj: "Дигитизација", dateTime: DateTime(2025, 10, 17, 16, 0), room: ["лаб. 138", "лаб. 200а"]),
      Exam(subj: "Мобилни платформи и програмирање", dateTime: DateTime(2025, 11, 17, 15, 0), room: ["117"]),
      Exam(subj: "Бази на податоци", dateTime: DateTime(2025, 11, 19, 8, 0), room: ["лаб. 2", "лаб. 3", "лаб. 12","лаб. 13", "лаб. 138"]),
      Exam(subj: "Тестирање на софтвер", dateTime: DateTime(2025, 11, 20, 18, 0), room: ["лаб. 2", "лаб. 3"]),
      Exam(subj: "Алгоритми и податочни структури", dateTime: DateTime(2025, 10, 21, 8, 0), room: ["лаб. 2", "лаб. 3", "лаб. 12","лаб. 13", "лаб. 138"]),
      Exam(subj: "Калкулус", dateTime: DateTime(2025, 11, 21, 10, 0), room: ["Б2.2", "Б3.2"]),
      Exam(subj: "Компјутерски мрежи и безбедност", dateTime: DateTime(2025, 11, 22, 8, 0), room: ["лаб. 2", "лаб. 3", "лаб. 12","лаб. 13", "лаб. 138"]),
      Exam(subj: "Вовед во наука за податоци", dateTime: DateTime(2025, 10, 29, 8, 0), room: ["лаб. 2", "лаб. 3", "лаб. 12","лаб. 13", "лаб. 138"]),
      Exam(subj: "Физика", dateTime: DateTime(2025, 11, 27, 8, 0), room: ["Б2.2"]),
    ];

    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Распоред за испити - 213173"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ), 
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamScreen(exam: exam),
                      ),
                    );
                  },
                  child: ExamCard(exam: exam),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.deepPurple.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.library_books, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  "Вкупно полагања: ${exams.length}",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
