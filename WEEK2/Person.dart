class Person {
  String firstName;
  String lastName;

  Person(this.firstName, this.lastName);

  String get fullName =>  firstName + " " + lastName;
}
void main() {
  Person p1 = Person("linh", "henry");
  print(p1.fullName);
}