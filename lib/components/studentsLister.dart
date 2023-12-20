import 'package:flutter/material.dart';
import 'package:flutter_http/models/student.model.dart';
import 'package:flutter_http/services/student.service.dart';



// 5 - Créer le composant stateful permettant l'utilisation des models 

class StudentsLister extends StatefulWidget {
  const StudentsLister({super.key});


  @override
  State<StudentsLister> createState() => _StudentsListerState();
}

class _StudentsListerState extends State<StudentsLister> {

//Données dont on a besoin
late Future<StudentList?> students;

// Methode init()
@override
void initState(){
  super.initState();
  loadStudents();
}

void loadStudents(){
  setState((){
    // on peut appeler notre ProductService et notre methode car ils sont en static dans la classe donc accessible ici
  students = StudentService.getStudents();
  });
}



  @override
  Widget build(BuildContext context) {

    // Widget FutureBuilder => pour afficher des données
    return FutureBuilder(
      future: students, 
      builder: (context, snapshot){
        // les données sont arrivées sans erreur
        if(snapshot.hasData){
          List<Student> students = snapshot.data!.students;
          return ListView.builder(
            itemCount: snapshot.data!.students.length,
            itemBuilder: (context, index){
              Student student = students[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // You can customize Card properties here
                  child: ListTile(
                    title: Text("${student.nom} ${student.prenom}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Matières étudiées : ${student.matieres.join(',')}"),
                        Text("Moyenne générale ( /20) : ${student.getAverage()}"),
                      ],
                    ),
                    // You can handle onTap here
                    //attention si on utilise Chrome on doit mettre onTapDown() dans un gestureDetector pour encadrer ma card car Chrome ne gere pas onTap
                    onTap: () {
                      // Add your onTap logic
                    },
                  ),
                ),
              );
            }
          );



          // les données sont arrivées avec des erreurs
        } else if (snapshot.hasError){
          return Text("error: ${snapshot.error}");
        }

        // Les données ne sont pas encore arrivées et il n'y a pas d'erreurs
        return const Expanded(
          child: Center (
            // affichage du spinner
            child: CircularProgressIndicator(),
          ),
        );
      });
  }
}