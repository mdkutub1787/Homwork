import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page "),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 25,
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: () {
                String em = email.text;
                String pass = password.text;
                print('Email:$em,Password: $pass');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Login",
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: GoogleFonts.roboto().fontFamily),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
