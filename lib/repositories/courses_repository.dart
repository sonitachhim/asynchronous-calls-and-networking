import '../models/course.dart';

abstract class CoursesRepository {
  List<Course> getCourses();
  Course getCourseFor(String id);
  void addScore(String courseId, CourseScore score);
}
