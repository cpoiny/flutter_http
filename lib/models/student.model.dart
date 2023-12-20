
// 2 - Créer le model en allant du plus impriqué au moins imbriqué (ex: Product puis ProductList)

class Student
{

  //Constructeur
  Student(
    this.nom,
    this.prenom,
    this.matieres,
    this.notes,
);

// Propriétés de la classe qui seront initialisés par le déclenchement de la méthode factory
  final String nom;
  final String prenom;
  final List<String> matieres;
  final List<double> notes;


// On utilise factory pour créer une map de string dynamic qu'on appelle json
// On vient de fabriquer des objets de type Product

// 3. Declenche le factory de Product
// Méthode factory utilisée pour implémenter des logiques de création d'objets avancées
// telles que la réutilisation d'instance existante, la création d'instance de sous classes
// en fonction de certains critères etc....
// Elle offre une fléxibilité supplémentaire par rapport au constructeur classique (elle est au dessus du constructeur classique)

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      json['nom'],
      json['prenom'],
      // Comment retourner un tableau en Json
      (json['matieres'] as List).map((e) => e as String).toList(),
      (json['notes'] as List).map((e) => e as double).toList(),
    );
  }

  double? getAverage(){
  return getNotes.isNotEmpty 
  ? getNotes.reduce((value, element) => value + element) / getNotes.length 
  : null;
}

  //Getter
  String get getNom => nom;
  String get getPrenom => prenom;
  List<String> get getMatieres => matieres;
  List<double> get getNotes => notes;

}


// La classe la moins imbriquée

class StudentList{

  // constructeur
  StudentList({required this.students});

  final List<Student> students;

  factory StudentList.fromJson(List<dynamic> parseJson) {
    List <Student> students = <Student>[];
    // 2. Appel Product en fromJson
    students = parseJson.map((s) => Student.fromJson(s)).toList();
    return StudentList(students : students);
  }
}


