# Week 3 — LMS layered architecture

A simple Learning Management System for the five mandatory coding tasks. The project keeps the starter's `lib/model`, `lib/service`, and `test` structure.

## Project structure

```text
WEEK3/
├── lib/
│   ├── model/
│   │   ├── student.dart          Student data
│   │   ├── course.dart           Course data and enrolled student IDs
│   │   └── course_result.dart    Student score for one course
│   └── service/
│       └── lms_system.dart       Business operations and checks
├── test/
│   └── lms_system_test.dart      Service tests
├── pubspec.yaml                 Package and test dependency
├── pubspec.lock                 Resolved dependency versions
└── README.md
```

The tests call the service. The service stores and manages model objects. Models contain data, not the full LMS logic.

## Mandatory tasks

1. Add and remove courses: `addCourse`, `removeCourse`.
2. Enroll a student: `enrollStudent`.
3. Remove an enrollment: `discardStudentFromCourse`. Remove a student from the entire LMS: `removeStudent`.
4. Record a score: `addResult`.
5. Remove a score: `removeResult`.

## Rules

- Students and courses must have unique IDs.
- A student can enroll in several courses. A course stores enrolled student IDs.
- Enrollment requires an existing student and course. Duplicate enrollment is rejected.
- Removing an enrollment requires an existing student, course, and enrollment. It also removes that student's result in that course.
- Removing a student removes all their enrollments and results. Other students remain unchanged.
- Removing a course clears its enrollments and removes its results. Students and other courses remain unchanged.
- Scores must be finite numbers from 0 to 100, inclusive.
- Only enrolled students can receive results. Each student has at most one result per course.
- A result is identified by studentId and courseId together, so removeResult uses those two values instead of a separate result ID.
- Removing a result requires that result to exist. It does not remove students, courses, enrollments, or unrelated results. No user permissions are modeled.
- Assignment and stage features are optional bonuses and are not included.

## Run tests

Install the Dart SDK, then run these commands from the repository root:

```sh
cd WEEK3
dart pub get
dart analyze
dart test
```
