import 'package:btl_recipes/pages/homepage.dart';
import 'package:btl_recipes/pages/register.dart';
import 'package:btl_recipes/service/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isVisible = true;

  bool isLogin = false;

  // final db = DatabaseHelper();

  // login() async {
  //   var response = await db.loginMethod(
  //       Account(tenDangNhap: username.text, matKhau: password.text));
  //   if (response == true) {
  //     if (!mounted) return;
  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => const HomePage()));
  //   } else {
  //     setState(() {
  //       isLogin = true;
  //     });
  //   }
  // }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/BG1.jpg",
                  width: 200,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(.2),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mời nhập email";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Email",
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.deepPurple.withOpacity(.2),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Mời nhập mật khẩu";
                      }
                      return null;
                    },
                    obscureText: isVisible,
                    decoration: InputDecoration(
                        icon: Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Mật khẩu",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  height: 40,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple),
                  child: TextButton(
                    onPressed: login,
                    child: const Text(
                      "ĐĂNG NHẬP",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Chưa có tài khoản?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "ĐĂNG KÝ NGAY",
                          style: TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ))
                  ],
                ),
                isLogin
                    ? const Text(
                        "Tên đăng nhập hoặc mật khẩu không chính xác",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _authService.loginWithEmailAndPassword(email, password);

    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
