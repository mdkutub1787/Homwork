import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String selectedGender = 'Male'; // Default gender selection

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
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(
              height: 25,
            ),

            // Email Field
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

            // Gender Dropdown
            DropdownButtonFormField<String>(
              value: selectedGender,
              items: ['Male', 'Female', 'Other'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                gender.text = newValue!; // Save gender to controller
              },
              decoration: InputDecoration(
                labelText: "Gender",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            SizedBox(
              height: 25,
            ),

            // Phone Field
            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  labelText: "Phone",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)),
            ),
            SizedBox(
              height: 25,
            ),

            // Password Field
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)),
            ),
            SizedBox(
              height: 25,
            ),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                String userName = name.text;
                String em = email.text;
                String gen = gender.text;
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
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
