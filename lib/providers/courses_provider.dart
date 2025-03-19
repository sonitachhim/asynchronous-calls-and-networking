import 'package:flutter/material.dart';
import '../models/course.dart';
import '../repositories/courses_mock_repository.dart';

class CoursesProvider with ChangeNotifier {
  final _repository = CoursesMockRepository();

  List<Course> _courses = [];

  List<Course> get courses => _courses;

  void loadCourses() {
    _courses = _repository.getCourses();
    notifyListeners();
  }

  Course getCourseFor(String id) {
    return _repository.getCourseFor(id);
  }

  void addScore(String courseId, CourseScore score) {
    _repository.addScore(courseId, score);
    notifyListeners();
  }
}
