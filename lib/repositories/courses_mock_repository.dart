import '../models/course.dart';
import 'courses_repository.dart';

class CoursesMockRepository implements CoursesRepository {
  final List<Course> _courses = [
    Course(id: '1', name: 'HTML'),
    Course(id: '2', name: 'JAVA'),
  ];

  @override
  List<Course> getCourses() {
    return _courses;
  }

  @override
  Course getCourseFor(String id) {
    return _courses.firstWhere((course) => course.id == id);
  }

  @override
  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    course.addScore(score);
  }
}
