List<String> getPassedStudents(Map<String, int> scores) {
  List<String> passedStudents = [];

  scores.forEach((name, score) {
    if (score >= 50) {
      passedStudents.add(name);
    }
  });

  return passedStudents;
}

void main() {
  Map<String, int> scores = {
    "Dara": 78,
    "Sokha": 45,
    "Lina": 62,
    "Vanna": 39,
    "Mony": 85
  };

  print(getPassedStudents(scores));
}
