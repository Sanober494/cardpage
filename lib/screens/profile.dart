import 'package:flutter/material.dart';
import 'package:cardpage/screens/base_scren.dart';

class SettingsUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  String panCardErrorText = '';
  String passwordErrorText = '';
  String selectedDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Profile Set-Up",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://static.vecteezy.com/system/resources/previews/005/544/718/original/profile-icon-design-free-vector.jpg",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              buildTextField("Full Name", "example: Adam Alex", false),
              buildTextField("E-mail", "example: adama@gmail.com", false),
              buildPasswordField(),
              buildTextField("Address", "example: Mumbai, India", false),
              buildDatePickerField(),
              buildPANCardField(),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "CANCEL",
                        style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BaseScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 2.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54, // Changed to light grey color
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: !showPassword,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.grey,
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Create password",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54, // Changed to light grey color
          ),
          errorText: passwordErrorText.isNotEmpty ? passwordErrorText : null,
        ),
        onChanged: (value) {
          setState(() {
            // Perform password validation using regular expressions
            RegExp regex = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9!#%]).{8,}$',
            );
            if (!regex.hasMatch(value)) {
              passwordErrorText = "The Password should contain: \n"
                  "An uppercase character (A-Z)\n"
                  "A lowercase character (a-z)\n"
                  "A number (0-9) and/or symbol (such as !, #, or %)\n"
                  "8 or more characters total";
            } else {
              passwordErrorText = '';
            }
          });
        },
      ),
    );
  }

  Widget buildDatePickerField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: GestureDetector(
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ).then((selectedDate) {
            setState(() {
              if (selectedDate != null) {
                this.selectedDate = selectedDate.toString();
              }
            });
          });
        },
        child: AbsorbPointer(
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 3),
              labelText: "Date of Birth",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: selectedDate.isNotEmpty
                  ? selectedDate
                  : "example: 23-04-1981",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54, // Changed to light grey color
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildPANCardField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: "PAN Card Number",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "example: ABC1234XXX",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54, // Changed to light grey color
          ),
          errorText: panCardErrorText.isNotEmpty ? panCardErrorText : null,
        ),
        onChanged: (value) {
          setState(() {
            // Perform PAN card number validation using regular expressions
            RegExp regex = RegExp(
              r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$',
            );
            if (!regex.hasMatch(value)) {
              panCardErrorText = "The PAN Card Number should be:\n"
                  "Ten characters long.\n"
                  "The first five characters should be any uppercase alphabets.\n"
                  "The next four characters should be any number from 0 to 9.\n"
                  "The last (tenth) character should be any uppercase alphabet.\n"
                  "It should not contain any white spaces.";
            } else {
              panCardErrorText = '';
            }
          });
        },
      ),
    );
  }
}
