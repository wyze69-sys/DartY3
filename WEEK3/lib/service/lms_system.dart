import '../model/student.dart';
import '../model/course.dart';
import '../model/course_result.dart';

class LmsSystem {
  final List<Student> students = [];
  final List<Course> courses = [];
  final List<CourseResult> results = [];

  void addStudent({required String studentId, required String studentName}) {
    // ! Student shall not exist already
    Student? student = _findStudentOrNull(studentId);
    if (student != null) {
      throw Exception('Student $studentId already exists');
    }

    students.add(Student(id: studentId, name: studentName));
  }

  void removeStudent({required String studentId}) {
    Student? student = _findStudentOrNull(studentId);
    if (student == null) {
      throw Exception('Student $studentId not found');
    }
    // 1- Remove student from the students list
    students.removeWhere((student) => student.id == studentId);
    for (Course course in courses) {
      course.studentIds.remove(studentId);
    }
    results.removeWhere((result) => result.studentId == studentId);
  }

  void addCourse({required String courseId, required String courseName}) {
    Course? course = _findCourseOrNull(courseId);
    if (course != null) {
      throw Exception('Course $courseId already exists');
    }
    courses.add(Course(id: courseId, name: courseName));
  }

  void removeCourse({required String courseId}) {
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    course.studentIds.clear();
    results.removeWhere((result) => result.courseId == courseId);
    courses.remove(course);
  }

  void enrollStudent({required String studentId, required String courseId}) {
    if (_findStudentOrNull(studentId) == null) {
      throw Exception('Student $studentId not found');
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    if (course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId already enrolled');
    }
    course.studentIds.add(studentId);
  }

  void discardStudentFromCourse({
    required String studentId,
    required String courseId,
  }) {
    if (_findStudentOrNull(studentId) == null) {
      throw Exception('Student $studentId not found');
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    if (!course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is not enrolled');
    }
    course.studentIds.remove(studentId);
    results.removeWhere(
      (result) => result.studentId == studentId && result.courseId == courseId,
    );
  }

  void addResult({
    required String studentId,
    required String courseId,
    required double score,
  }) {
    if (_findStudentOrNull(studentId) == null) {
      throw Exception('Student $studentId not found');
    }
    Course? course = _findCourseOrNull(courseId);
    if (course == null) {
      throw Exception('Course $courseId not found');
    }
    if (!course.studentIds.contains(studentId)) {
      throw Exception('Student $studentId is not enrolled');
    }
    if (!score.isFinite || score < 0 || score > 100) {
      throw Exception('Score must be between 0 and 100');
    }
    if (_findResultOrNull(studentId, courseId) != null) {
      throw Exception('Result already exists');
    }
    results.add(CourseResult(
      studentId: studentId,
      courseId: courseId,
      score: score,
    ));
  }

  void removeResult({required String studentId, required String courseId}) {
    CourseResult? result = _findResultOrNull(studentId, courseId);
    if (result == null) {
      throw Exception('Result not found');
    }
    results.remove(result);
  }

  Student? _findStudentOrNull(String studentId) {
    for (Student s in students) {
      if (s.id == studentId) {
        return s;
      }
    }
    return null; // not found
  }

  Course? _findCourseOrNull(String courseId) {
    for (Course course in courses) {
      if (course.id == courseId) {
        return course;
      }
    }
    return null;
  }

  CourseResult? _findResultOrNull(String studentId, String courseId) {
    for (CourseResult result in results) {
      if (result.studentId == studentId && result.courseId == courseId) {
        return result;
      }
    }
    return null;
  }
}
