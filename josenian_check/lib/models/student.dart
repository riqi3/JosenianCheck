class Student {
  String studentNo;
  String firstName;
  String middleName;
  String lastName;
  String program;
  String degree;

  Student(
      {required this.studentNo,
      required this.firstName,
      required this.middleName,
      required this.lastName,
      required this.program,
      required this.degree});
  
  String get id => studentNo;
  String get first => firstName;
  String get middle => middleName;
  String get last => lastName;
  String get prog => program;
  String get deg => degree;
  
  set setID(String id)
  {
    studentNo = id;
  }

  set setFirstName(String firstName)
  {
    this.firstName = firstName;
  }

  set setMiddleName(String middleName)
  {
    this.middleName = middleName;
  }

  set setLastName(String lastName)
  {
    this.lastName = lastName;
  }

  set setProgram(String program)
  {
    this.program = program;
  }

  set setDegree(String degree)
  {
    this.degree = degree;
  }
  
}
