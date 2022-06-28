import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'question.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name can\'t be empty';
    } else if (value.length < 5) {
      return 'Name must be at least 5 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/LOGO.png',
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Text(
                "Let's Play Quiz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.comfortaa().fontFamily),
              ),
              const SizedBox(height: 30),
              Text(
                "Enter your name to start",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.lora().fontFamily,
                ),
              ),
              const SizedBox(height: 25),
              Form(
                key: _formKey,
                child: TextFormField(
                    controller: _nameController,
                    validator: nameValidator,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Full Name",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    )),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                  onPressed: () {
                    var status = _formKey.currentState?.validate();
                    if (status != null && status) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionPage(),
                        ),
                      ).then((_) => _formKey.currentState!.reset());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(204, 155, 205, 240)),
                  icon: Icon(Icons.arrow_forward),
                  label: Text("Start")),
            ],
          ),
        ),
      ],
    );
  }
}
