import 'package:flutter/material.dart';

import 'controller.dart';
import 'model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int id;

  MovieDetailsScreen({Key? key, required this.id}) : super(key: key);

  final controller = MovieDtController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: controller.getData(id: id),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const CircularProgressIndicator();
            }
            var model = snapshot.data as MovieDtModel;
            return ListView(
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: const Offset(0, 0))
                      ]),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/original" + model.backdropPath,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 0, 170, 255)),
                        child: Text(
                          model.originalTitle,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 0, 170, 255)),
                        child: const Text(
                          'overview',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.5),
                                  blurRadius: 7,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 0, 170, 255)),
                        child: Text(
                          model.overview,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
