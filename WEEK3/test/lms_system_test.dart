import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

    // Create a student
    lms.addStudent(studentId: 'S1', studentName: "ronan");

    expect(lms.students.first.name, 'ronan');

    // Remove the student
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  group('LMS operations', () {
    late LmsSystem lms;

    setUp(() {
      lms = LmsSystem();
      lms.addStudent(studentId: 'S1', studentName: 'ronan');
      lms.addStudent(studentId: 'S2', studentName: 'sara');
      lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
      lms.addCourse(courseId: 'C2', courseName: 'Dart');
    });

    test('rejects duplicate students and missing student removal', () {
      expect(
        () => lms.addStudent(studentId: 'S1', studentName: 'other'),
        throwsException,
      );
      expect(() => lms.removeStudent(studentId: 'S3'), throwsException);
      expect(lms.students.length, 2);
      expect(lms.students.first.name, 'ronan');
    });

    test('adds and removes courses and rejects invalid operations', () {
      expect(lms.courses.first.name, 'Mobile Development');
      expect(
        () => lms.addCourse(courseId: 'C1', courseName: 'Other'),
        throwsException,
      );
      expect(() => lms.removeCourse(courseId: 'C3'), throwsException);
      expect(lms.courses.length, 2);
      lms.removeCourse(courseId: 'C1');
      expect(lms.courses.single.id, 'C2');
      expect(lms.students.length, 2);
    });

    test('enrolls students and rejects invalid enrollment', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      expect(lms.courses.first.studentIds, ['S1']);
      expect(
        () => lms.enrollStudent(studentId: 'S3', courseId: 'C1'),
        throwsException,
      );
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'C3'),
        throwsException,
      );
      expect(
        () => lms.enrollStudent(studentId: 'S1', courseId: 'C1'),
        throwsException,
      );
      expect(lms.courses.first.studentIds, ['S1']);
    });

    test('discards enrollment and its result only', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S1', courseId: 'C2');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      lms.addResult(studentId: 'S1', courseId: 'C2', score: 90);
      lms.addResult(studentId: 'S2', courseId: 'C1', score: 75);
      lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');
      expect(lms.students.length, 2);
      expect(lms.courses.length, 2);
      expect(lms.courses.first.studentIds, ['S2']);
      expect(lms.courses.last.studentIds, ['S1']);
      expect(lms.results.map((result) => result.score), [90, 75]);
      expect(
        () => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1'),
        throwsException,
      );
      expect(
        () => lms.discardStudentFromCourse(studentId: 'S3', courseId: 'C1'),
        throwsException,
      );
      expect(
        () => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C3'),
        throwsException,
      );
      expect(lms.results.length, 2);
    });

    test('adds a result and rejects invalid or duplicate results', () {
      expect(
        () => lms.addResult(studentId: 'S3', courseId: 'C1', score: 85),
        throwsException,
      );
      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'C3', score: 85),
        throwsException,
      );
      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'C1', score: 85),
        throwsException,
      );
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      for (double score in [-1, 101, double.nan, double.infinity]) {
        expect(
          () => lms.addResult(studentId: 'S1', courseId: 'C1', score: score),
          throwsException,
        );
      }
      expect(lms.results, isEmpty);
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      expect(lms.results.single.studentId, 'S1');
      expect(lms.results.single.courseId, 'C1');
      expect(lms.results.single.score, 85);
      expect(
        () => lms.addResult(studentId: 'S1', courseId: 'C1', score: 90),
        throwsException,
      );
      expect(lms.results.single.score, 85);
    });

    test('accepts scores at both limits', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 0);
      lms.addResult(studentId: 'S2', courseId: 'C1', score: 100);
      expect(lms.results.map((result) => result.score), [0, 100]);
    });

    test('removes a result without changing other data', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      lms.addResult(studentId: 'S2', courseId: 'C1', score: 75);
      lms.removeResult(studentId: 'S1', courseId: 'C1');
      expect(lms.results.single.studentId, 'S2');
      expect(lms.results.single.score, 75);
      expect(lms.students.map((student) => student.id), ['S1', 'S2']);
      expect(lms.courses.map((course) => course.id), ['C1', 'C2']);
      expect(lms.courses.first.studentIds, ['S1', 'S2']);
      expect(
        () => lms.removeResult(studentId: 'S1', courseId: 'C1'),
        throwsException,
      );
      expect(lms.results.single.score, 75);
    });

    test('removes a student from all courses and results', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S1', courseId: 'C2');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      lms.addResult(studentId: 'S1', courseId: 'C2', score: 90);
      lms.addResult(studentId: 'S2', courseId: 'C1', score: 75);
      lms.removeStudent(studentId: 'S1');
      expect(lms.students.single.id, 'S2');
      expect(lms.students.single.name, 'sara');
      expect(lms.courses.length, 2);
      expect(lms.courses.first.studentIds, ['S2']);
      expect(lms.courses.last.studentIds, isEmpty);
      expect(lms.results.single.studentId, 'S2');
      expect(lms.results.single.courseId, 'C1');
      expect(lms.results.single.score, 75);
    });

    test('removes a course with enrollments and results', () {
      lms.enrollStudent(studentId: 'S1', courseId: 'C1');
      lms.enrollStudent(studentId: 'S2', courseId: 'C1');
      lms.enrollStudent(studentId: 'S1', courseId: 'C2');
      lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
      lms.addResult(studentId: 'S2', courseId: 'C1', score: 75);
      lms.addResult(studentId: 'S1', courseId: 'C2', score: 90);
      lms.removeCourse(courseId: 'C1');
      expect(lms.courses.single.id, 'C2');
      expect(lms.courses.single.studentIds, ['S1']);
      expect(lms.results.single.courseId, 'C2');
      expect(lms.results.single.score, 90);
      expect(lms.students.map((student) => student.id), ['S1', 'S2']);
    });
  });
}
