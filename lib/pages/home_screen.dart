import 'package:btl_recipes/components/home_appbar.dart';
import 'package:btl_recipes/components/tab_bar.dart';
import 'package:btl_recipes/components/text_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(
                height: h * .022,
              ),
              TextFieldWidget(),
              SizedBox(
                height: h * .022,
              ),
              Container(
                height: h * .25,
                width: w,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/image.png"),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                height: h * .023,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Loại món',
                    style: TextStyle(
                        fontSize: w * .045, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Tất cả',
                  ),
                  SizedBox(
                    width: w * .022,
                  )
                ],
              ),
              SizedBox(
                height: h * .022,
              ),
              const TabBarWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
