import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/courses_provider.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CoursesProvider>(context);
    final courses = provider.courses;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (ctx, index) {
          final course = courses[index];
          return Dismissible(
            key: Key(course.id),
            child: CourseTile(course: course),
          );
        },
      ),
    );
  }
}

class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course});

  final Course course;

  int get numberOfScores => course.scores.length;

  String get numberText => course.hasScore ? "$numberOfScores scores" : 'No score';

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => CourseScreen(courseId: course.id),
              ),
            );
          },
          title: Text(course.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(numberText), Text(averageText)],
          ),
        ),
      ),
    );
  }
}
