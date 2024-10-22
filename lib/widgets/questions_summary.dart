import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            bool isCorrect = data['user_answer'] == data['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCorrect ? Colors.green[400] : Colors.red[400],
                  ),
                  child: Text(
                    ((data["question_index"] as int) + 1).toString(),
                    style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["question"] as String,
                          style: GoogleFonts.aBeeZee(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data["correct_answer"] as String,
                          style: GoogleFonts.aBeeZee(fontSize: 14, color: Colors.deepPurple[200]),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data["user_answer"] as String,
                          style: GoogleFonts.aBeeZee(fontSize: 14, color: Colors.green[200]),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
