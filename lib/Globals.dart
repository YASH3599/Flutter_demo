import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;

String deviceId = 'Nova';
String otp = '1111';
String mobilenumber = '**********';
String isMobileVerified = 'false';
String fullName = '';
String firstName = '';
String lastName = '';
String koNumber = '';
String appId='K1';
String isSurveydoneToday='false';
String surveydatastring='';
String quote="Thank you for completing your daily Health assessment";
String serverresponse;
int internetOff =0; 

String randomOTP() {
  int min = 1000; //min and max values act as your 4 digit range
  int max = 9999;
  var randomizer = new Random();
  otp = (min + randomizer.nextInt(max - min)).toString();
  return otp;
}

String novaUrl = 'http://testemail.novasoftwares.com/';

Future<String> sendTextToServer(String stringToSend) async {
  String qstring = novaUrl + '?AppId=K01&device=' + deviceId + '&' + stringToSend;
print('submitting:' + qstring);
 var res = await http.post(qstring, headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8'
  });

  if (res.statusCode == 200) {
    print ('response 200 OK ..');
   //serverresponse = jsonDecode(res.body)['message'] as String;
  } else {
    print('Error Connecting Server...');
    throw Exception('there is some error');
  }

  return res.body;
}

void sendotp() async {
  String rNum = randomOTP();
  var res;
  print(rNum);
  print ('Before Post ..');

  res =await http.post(
    'http://novasms.mysmsapps.co.in/sendsms.jsp?user=NovaSoft&password=2f67109aa8XX&mobiles=' +
        mobilenumber +
        '&senderid=NovaSw&sms=Registration successfull use this : ' +
        rNum.toString() +
        ' OTP to verify your Mobile',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{"": ""}),
  );

   print ('After OTP Post ..');
  if (res.statusCode == 200) {
    print ('response 200 OK ..');
    print(res.body);
  } else {
    print('Error Connecting Server...');
    throw Exception('there is some error');
  }

  print ('OTP Exit ..');

}
