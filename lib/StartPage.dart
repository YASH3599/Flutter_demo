import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_form/Globals.dart';

//Global Variables
String name;
String surname;
String mobileNumber;
String address;
String age;
String time;
String email;
String password;
String cPassword;
String city = 'Bharuch';

String gender;
var date;
var msg;
var res;

//Radiobutton Object
enum Gender { male, female }

List<String> spinnerItems = [
  'Bharuch',
  'Vadodara',
  'Surat',
  'Ahemdabad',
  'Rajkot'
];

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  //radio button object Start
  int _groupValue = -1;
  //radio button obect End

  //Date Picker Start
  DateTime date = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != date)
      setState(() {
        date = pickedDate;
      });
  }
  //Date Picker End

  //FromField keyObject Strt
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  //FormField keyObject End

  //Main Widget Start
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Container(
            color: Colors.white54,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildText(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldName(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldSurname(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldMobilenumber(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldEmail(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldAddress(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldDate(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldPassword(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldCPassword(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldCity(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFormFieldGender(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  //Main Widget End

  Widget _buildText() {
    return Text(
      "State Manage Form",
      style: TextStyle(fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFormFieldName() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Enter Your Name",
          labelText: "User Name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        name = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onSaved: (value) {
        name = value;
      },
    );
  }

  Widget _buildFormFieldSurname() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Enter Your Surname",
          labelText: "User Surname",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        surname = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _buildFormFieldMobilenumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "Enter Your MobileNumber",
          labelText: "User MobileNumber",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        mobileNumber = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        if (value.length != 10) {
          return 'Mobile Number must be 10 digits';
        }
        return null;
      },
    );
  }

  Widget _buildFormFieldEmail() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Enter Your EmailAddress",
          labelText: "User EmailAddress",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        email = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        Pattern pattern =
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
          return 'Not Valid Email';
        else
          return null;
      },
    );
  }

  Widget _buildFormFieldAddress() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
          hintText: "Enter Your Adress",
          labelText: "User Address",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        address = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  Widget _buildFormFieldCity() {
    return Container(
      child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceEvenly, //Center Row contents horizontally,
          crossAxisAlignment:
              CrossAxisAlignment.center, //Center Row contents vertically,
          children: <Widget>[
            Text('City :', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: city,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String data) {
                setState(() {
                  city = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]),
    );
  }

  Widget _buildFormFieldDate() {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(date.toString()),
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormFieldPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Enter Your Password",
          suffix: InkWell(
            onTap: _toggle,
            child: Icon(Icons.visibility),
          ),
          labelText: "User Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        password = value;
      },
      obscureText: _obscureText,
      validator: (value) {
        Pattern pattern =
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regex = new RegExp(pattern);
        print(value);
        if (value.isEmpty) {
          return 'Please enter password';
        } else {
          if (!regex.hasMatch(value))
            return 'Enter valid password atleast 1 upper case,1 special character, & length is minimum 8';
          else
            return null;
        }
      },
    );
  }

  Widget _buildFormFieldCPassword() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Enter Your Confirm Password",
          suffix: InkWell(
            onTap: _toggle,
            child: Icon(Icons.visibility),
          ),
          labelText: "User Confirm Password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      onChanged: (value) {
        cPassword = value;
      },
      obscureText: _obscureText,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        if (value != password) return 'Password Does Not Match';

        return null;
      },
    );
  }

  Widget _buildFormFieldGender() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('Gender:', style: TextStyle(fontSize: 18)),
          Container(
            child: Column(
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Female',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    new Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Other',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return GestureDetector(
        onTap: () {
          if (_formKey.currentState.validate()) {
            print("Process data");
            submit();
          } else {
            print('Error');
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.amber),
          child: Text("Add Data",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ));
  }

  void submit() async {
    print('name:' + name);
    print('surname:' + surname);
    print('address:' + address);
    print('city:' + city);
    print('mobileNumber:' + mobileNumber);
    print('Email:' + email);
    print('Password:' + password);
    print('Confirm Password:' + cPassword);
    print('Date:' + date.toString());
    print('Gender:' + gender);
    String qstring = 'control=91' +
        "&data=" +
        jsonEncode(<String, String>{
          'name': name,
          'surname': surname,
          'Gender': gender,
          'address': address,
          'city': city,
          'mobileNumber': mobileNumber,
          'Email': email,
          'Password': password,
          'Confirm Password': cPassword,
          'Date': date.toIso8601String(),
        });
    print(qstring);
    sendTextToServer(qstring);
  }

  // Initially password is obscure
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //Radio Button
  int _radioValue = 0;

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;
      print(_radioValue);
      switch (_radioValue) {
        case 0:
          gender = 'Male';
          print(gender);
          break;
        case 1:
          gender = 'Female';
          print(gender);
          break;
        case 2:
          gender = 'Other';
          print(gender);
          break;
      }
    });
  }
}
