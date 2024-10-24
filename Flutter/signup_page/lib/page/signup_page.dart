import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this for input formatters
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  String selectedGender = 'Male'; // Default selected gender

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up Page",
          style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Name Field
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 25),

            // Email Field
            TextField(
              controller: email,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            SizedBox(height: 25),

            // Gender Selection (Radio Buttons)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Gender",
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Male',
                        groupValue: selectedGender,
                        title: Text('Male'),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Female',
                        groupValue: selectedGender,
                        title: Text('Female'),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        value: 'Other',
                        groupValue: selectedGender,
                        title: Text('Other'),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 25),

            // Phone Field
            TextField(
              controller: phone,
              keyboardType: TextInputType.number, // Ensures numeric keyboard
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly, // Only allows digits
              ],
              decoration: InputDecoration(
                labelText: "Phone",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 25),

            // Password Field
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 25),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                String userName = name.text;
                String em = email.text;
                String gen = selectedGender;
                String ph = phone.text;
                String pass = password.text;
                print('Name: $userName, Email: $em, Gender: $gen, Phone: $ph, Password: $pass');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: Text(
                "Sign Up",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
