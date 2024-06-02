import 'package:btl_recipes/components/custom_app_bar.dart';
import 'package:btl_recipes/pages/detail_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SavedRecipes extends StatefulWidget {
  const SavedRecipes({super.key});

  @override
  State<SavedRecipes> createState() => _SavedRecipesState();
}

class _SavedRecipesState extends State<SavedRecipes> {
  final CollectionReference myRecipes =
      FirebaseFirestore.instance.collection('recipes');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Món ăn đã lưu", back: false),
        body: Container(
          height: 220,
          width: double.infinity,
          // color: Colors.red,
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.only(left: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Món ăn",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: myRecipes.snapshots(),
                    // scrollDirection: Axis.horizontal,
                    // itemCount: snapshot.data!.length,
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      // Map<String, dynamic> recipeMap =
                      //     snapshot as Map<String, dynamic>;
                      // List<Container> recipesWidgets = [];
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Material(
                              child: Container(
                                width: 130,
                                child: Card(
                                  color: const Color.fromARGB(255, 46, 53, 58),
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 15),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          documentSnapshot['image'],
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                // Navigator.of(context)
                                                //     .push(MaterialPageRoute(
                                                //   builder: (context) =>
                                                //       DetailScreen(
                                                //           item: recipeMap),
                                                // ));
                                              },
                                              child: Container(
                                                color: Colors.transparent,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      documentSnapshot['name']
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontSize: 11,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          documentSnapshot[
                                                                  'totalTime']
                                                              .toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          " | ${documentSnapshot['calories'].toString()}",
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                        //   final recipes = snapshot.data?.docs.reversed.toList();
                        //   for (var recipe in recipes!) {
                        //     final recipeWidget =
                        //     recipesWidgets.add(recipeWidget);
                        //   }
                        // }
                        // return ListView(
                        //   children: recipesWidgets,
                        // );
                      }
                      return const Center();
                    }),
              ),
            ],
          ),
        ));
  }
}
