import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts_rifqijovian/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}


class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController nickNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? fullName = "";
  String? nickName = "";
  String? password = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                 )),


          const Padding(padding: EdgeInsets.only(top: 4)),
          TextField(
              controller: nickNameController,
              decoration: InputDecoration(
                  labelText: "Username",
                 )),


          const Padding(padding: EdgeInsets.only(top: 4)),
          TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                 )),

          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 175, 165, 76))),
            child: const Text("Daftar", style: TextStyle(color: Colors.white),),
            onPressed: () {
              setIntoSharedPreferences();
            },
          ),


          const Padding(padding: EdgeInsets.only(top: 15)),
          Text(
            "Your Name : $fullName",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Your Username : $nickName",
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            "Your Password : $password",
            style: const TextStyle(fontSize: 20),
          ),

          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 175, 157, 76))),
            child: const Text("Cek", style: TextStyle(color: Colors.white),),
            onPressed: () {
              getFromSharedPreferences();
            },
          ),
          TextButton(
            child: const Text("Login Sekarang", style: TextStyle(color: Color.fromARGB(255, 175, 160, 76)),),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LoginScreen();
              }));
            },
          ),
        ],
      ),
    );
  }


// method ini berfungsi untuk memasukkan data ke dalam SharedPreferences
  void setIntoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    await prefs.setString("fullname", fullNameController.text);
    await prefs.setString("nickname", nickNameController.text);
    await prefs.setString("password", passwordController.text);
  }


// Method ini berfungsi untuk mengambil data Email dan Password dari SharedPreferences
// kemudian dimasukkan ke variable email dan password
  void getFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    setState(() {
      fullName = prefs.getString("fullname");
      nickName = prefs.getString("nickname");
      password = prefs.getString("password");
    });
  }
}
