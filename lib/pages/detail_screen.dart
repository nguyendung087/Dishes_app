import 'package:btl_recipes/components/circle_button.dart';
import 'package:btl_recipes/components/custom_clip_path.dart';
import 'package:btl_recipes/components/ingredient_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    String time = widget.item['totalTime'].toString();
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * .44,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.item['image']),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    top: h * .04,
                    left: w * .05,
                    child: const CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: BackButton(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * .04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.item['label'],
                    style: TextStyle(
                        fontSize: w * .05,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text('$time phút'),
                  SizedBox(
                    height: h * .01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleButton(
                        icon: Icons.share,
                        label: 'Chia sẻ',
                      ),
                      GestureDetector(
                        onTap: () {
                          CollectionReference collectionReference =
                              FirebaseFirestore.instance.collection('recipes');
                          collectionReference.add({
                            'name': widget.item['label'].toString(),
                            'totalTime': widget.item['totalTime'].toString(),
                            'calories': widget.item['calories'].toString(),
                            'image': widget.item['image'].toString()
                          });
                        },
                        child: const CircleButton(
                          icon: Icons.bookmark_border,
                          label: 'Yêu thích',
                        ),
                      ),
                      const CircleButton(
                        icon: Icons.monitor_heart_outlined,
                        label: 'Calories',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Hướng dẫn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: w * .06),
                      ),
                      SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Bắt đầu'),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * .02,
                  ),
                  Container(
                    height: h * .07,
                    width: w,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipPath(
                            clipper: CustomClipPath(),
                            child: Container(
                              color: Colors.redAccent,
                              child: Text(
                                'Nguyên liệu nấu',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: w * .05),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.white,
                            child: const Center(
                              child: Text('   6\nItems'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h * 1.8,
                    child: IngredientList(
                      ingredient: widget.item['ingredients'],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
