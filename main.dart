import 'package:flutter/material.dart';
import 'package:flutter_actividad13_20210170/model/movie_modal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SearchPage(),
    );
  }
}


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  static List<MovieModel> main_movies_list = [
    MovieModel("cap 1 Tem1 / Problemas de horno ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
    MovieModel("cap 2 Tem1 / Una frutita extraordinaria ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
    MovieModel("cap 3 Tem1 / El fantasma de los pasteles pasados ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
    MovieModel("cap 4 Tem1 / Es miau fiesta ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
    MovieModel("cap 5 Tem1 / La cacería de grosellas ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
    MovieModel("cap 6 Tem1 / La leyenda de la cuchara ", 2006, 10, 
    "https://img.pikbest.com/backgrounds/20190307/cartoon-cute-strawberry-pink-background_1871263.jpg!bw700"),
  ];

  // ignore: non_constant_identifier_names
  List<MovieModel> display_list = List.from(main_movies_list);

  void updateList(String value) //Esta función es para fltrar nuestra lista
  {
    setState(() {
      display_list = main_movies_list
        .where((element) => 
          element.movie_title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 176, 224),
      appBar: AppBar(
        backgroundColor:Color.fromARGB(255, 221, 125, 188),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CAPITULOS DE ROSITA FRESITA <3", 
              style: TextStyle(
                color: Color.fromARGB(255, 212, 84, 170), 
                fontSize: 22.0, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20.00,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
              decoration: InputDecoration(
                filled: true,
                fillColor:Color.fromARGB(255, 249, 132, 228),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none,
                ),
                hintText: "CAPITULOS COMPLETOS",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Color.fromARGB(255, 244, 244, 244),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.length == 0 ?Center(
                child: Text(
                  "Now result found",
                  style: TextStyle(
                    color: Color.fromARGB(163, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    ),
                  ))
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].movie_title!, 
                          style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0), 
                            fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            '${display_list[index].movie_release_year!}', 
                            style: TextStyle(
                              color: Color.fromARGB(153, 0, 0, 0)
                            ),
                          ),
                          trailing: Text(
                            "${display_list[index].rating}",
                            style: TextStyle(color: const Color.fromARGB(255, 246, 136, 173)),
                            ),
                          leading: Image.network(display_list[index].movie_poster_url!),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}