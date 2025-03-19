import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/courses_provider.dart';
import 'course_score_form.dart';

class CourseScreen extends StatelessWidget {
  final String courseId;

  const CourseScreen({super.key, required this.courseId});

  void _addScore(BuildContext context, CoursesProvider provider) async {
    final CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (_) => const CourseScoreForm()),
    );

    if (newScore != null) {
      provider.addScore(courseId, newScore);
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoursesProvider>(context);
    final course = provider.getCourseFor(courseId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(course.name, style: const TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: course.scores.length,
        itemBuilder: (ctx, index) {
          final score = course.scores[index];
          return ListTile(
            title: Text(score.studentName),
            trailing: Text(score.studenScore.toStringAsFixed(1)),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () => _addScore(context, provider),
        child: const Icon(Icons.add),
      ),
    );
  }
}
