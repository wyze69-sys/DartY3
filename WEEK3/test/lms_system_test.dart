import 'package:test/test.dart';

import '../lib/service/lms_system.dart';

void main() {
  test('creates a student', () {
    final lms = LmsSystem();

  
    lms.addStudent(studentId: 'S1', studentName: "ronan");
    expect(lms.students.first.name, 'ronan');

  
    lms.removeStudent(studentId: 'S1');
    expect(lms.students.length, 0);
  });

  late LmsSystem lms;

  setUp(() {
    lms = LmsSystem();
    lms.addStudent(studentId: 'S1', studentName: 'ronan');
    lms.addStudent(studentId: 'S2', studentName: 'sara');
    lms.addCourse(courseId: 'C1', courseName: 'Mobile Development');
    lms.addCourse(courseId: 'C2', courseName: 'Dart');
    lms.enrollStudent(studentId: 'S1', courseId: 'C1');
    lms.enrollStudent(studentId: 'S1', courseId: 'C2');
    lms.enrollStudent(studentId: 'S2', courseId: 'C1');
    lms.addResult(studentId: 'S1', courseId: 'C1', score: 85);
    lms.addResult(studentId: 'S1', courseId: 'C2', score: 90);
    lms.addResult(studentId: 'S2', courseId: 'C1', score: 75);
  });

  test('adds courses, rejects duplicates and removes course data', () {
    expect(lms.courses.first.name, 'Mobile Development');
    expect(
      () => lms.addCourse(courseId: 'C1', courseName: 'Other'),
      throwsException,
    );
    expect(() => lms.removeCourse(courseId: 'C3'), throwsException);
    lms.removeCourse(courseId: 'C1');
    expect(lms.courses.single.id, 'C2');
    expect(lms.courses.single.studentIds, ['S1']);
    expect(lms.results.single.courseId, 'C2');
    expect(lms.results.single.score, 90);
    expect(lms.students.map((student) => student.id), ['S1', 'S2']);
  });

  test('enrolls students and rejects invalid enrollment', () {
    expect(lms.courses.first.studentIds, ['S1', 'S2']);
    for (String studentId in ['S1', 'S3']) {
      expect(
        () => lms.enrollStudent(studentId: studentId, courseId: 'C1'),
        throwsException,
      );
    }
    expect(
      () => lms.enrollStudent(studentId: 'S1', courseId: 'C3'),
      throwsException,
    );
    expect(lms.courses.first.studentIds, ['S1', 'S2']);
  });

  test('discards enrollment and its result only', () {
    lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C1');
    expect(lms.students.length, 2);
    expect(lms.courses.length, 2);
    expect(lms.courses.first.studentIds, ['S2']);
    expect(lms.courses.last.studentIds, ['S1']);
    expect(lms.results.map((result) => result.score), [90, 75]);
    for (String studentId in ['S1', 'S3']) {
      expect(
        () =>
            lms.discardStudentFromCourse(studentId: studentId, courseId: 'C1'),
        throwsException,
      );
    }
    expect(
      () => lms.discardStudentFromCourse(studentId: 'S1', courseId: 'C3'),
      throwsException,
    );
  });

  test('checks result rules and score limits', () {
    expect(lms.results.first.studentId, 'S1');
    expect(lms.results.first.courseId, 'C1');
    expect(lms.results.first.score, 85);
    for (String studentId in ['S1', 'S3']) {
      expect(
        () => lms.addResult(studentId: studentId, courseId: 'C1', score: 50),
        throwsException,
      );
    }
    for (String courseId in ['C2', 'C3']) {
      expect(
        () => lms.addResult(studentId: 'S2', courseId: courseId, score: 50),
        throwsException,
      );
    }
    lms.enrollStudent(studentId: 'S2', courseId: 'C2');
    for (double score in [-1, 101, double.nan, double.infinity]) {
      expect(
        () => lms.addResult(studentId: 'S2', courseId: 'C2', score: score),
        throwsException,
      );
    }
    expect(lms.results.map((result) => result.score), [85, 90, 75]);
    for (double score in [0, 100]) {
      lms.addResult(studentId: 'S2', courseId: 'C2', score: score);
      expect(lms.results.last.score, score);
      lms.removeResult(studentId: 'S2', courseId: 'C2');
    }
  });

  test('removes a result without changing other data', () {
    lms.removeResult(studentId: 'S1', courseId: 'C1');
    expect(lms.results.map((result) => result.score), [90, 75]);
    expect(lms.results.first.courseId, 'C2');
    expect(lms.results.last.studentId, 'S2');
    expect(lms.students.map((student) => student.id), ['S1', 'S2']);
    expect(lms.courses.map((course) => course.id), ['C1', 'C2']);
    expect(lms.courses.first.studentIds, ['S1', 'S2']);
    expect(
      () => lms.removeResult(studentId: 'S1', courseId: 'C1'),
      throwsException,
    );
  });

  test('removes a student from every course and result', () {
    expect(
      () => lms.addStudent(studentId: 'S1', studentName: 'other'),
      throwsException,
    );
    expect(() => lms.removeStudent(studentId: 'S3'), throwsException);
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
}
