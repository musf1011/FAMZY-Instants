import 'package:detail_information/UI/homeScreen.dart';
import 'package:detail_information/UI/signUp.dart';
import 'package:detail_information/main.dart';
import 'package:detail_information/mainScreen/settings.dart';
import 'package:detail_information/utils/toastPopUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signIn extends StatefulWidget {
  const signIn({super.key});

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  TextEditingController emailcont = TextEditingController();

  TextEditingController passcont = TextEditingController();

  final GlobalKey<FormState> keyOfForm = GlobalKey<FormState>();

  int cred = 1;

  bool isLoading = false;

  bool _isPasswordVisible = false;

  FirebaseAuth authentic = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bcnn.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
              width: .4.sw,
              height: .2.sh,
              child: Image.asset(
                'assets/images/FAMZYLogo.png',
                //fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: .1.sh,
            ),
            Form(
              key: keyOfForm,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: .1.sw),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Gmail field should be filled';
                        }
                        return null;
                      },
                      controller: emailcont,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Gmail',
                        hintText: 'you@gmail.com',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 226, 222, 209)),
                        labelStyle: TextStyle(color: Colors.yellow),
                        suffixIcon: Icon(
                          Icons.check,
                          color: cred == 0 ? Colors.red : Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 182, 146, 29)),
                        ),
                      ),
                    ),
                    SizedBox(height: .05.sh),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Passwrd field should be filled';
                        }
                        return null;
                      },
                      obscureText: _isPasswordVisible == false ? true : false,
                      controller: passcont,
                      decoration: InputDecoration(
                        hintText: 'password',
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 226, 222, 209)),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.yellow),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: _isPasswordVisible == false
                                ? Colors.grey
                                : Color.fromARGB(255, 123, 100, 22),
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 182, 146, 29)),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.01.sh),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                      ),
                    ),
                    SizedBox(height: .01.sh),
                    cred == 0
                        ? Text('*Complete the credentials',
                            style: TextStyle(
                                color: Color.fromARGB(255, 123, 100, 22),
                                fontSize: 12.sp))
                        : cred == 2
                            ? Text('*Incorrect Password',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 123, 100, 22),
                                    fontSize: 12.sp))
                            : SizedBox(
                                height: 0.03.sh,
                              ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          isLoading = true;
                        });
                        String g = emailcont.text;
                        String p = passcont.text;

                        // SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();
                        // String? em = prefs.getString('email');
                        // String? ps = prefs.getString('pass');

                        if (g == '' || p == '') {
                          setState(() {
                            cred = 0;
                          });
                          print('is empty');
                        } else if (keyOfForm.currentState!.validate()) {
                          authentic
                              .signInWithEmailAndPassword(
                            email: emailcont.text.toString().trim(),
                            password: passcont.text.toString().trim(),
                          )
                              .then((Value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                            setState(() {
                              isLoading = false;
                            });
                          }).onError((Error, Value) {
                            ToastPopUp()
                                .toastPopUp(Error.toString(), Colors.black);
                            setState(() {
                              isLoading = false;
                            });
                          });
                        }
                        setState(() {
                          isLoading = false;
                        });
                        print(emailcont.text);
                      },
                      child: Container(
                        height: .075.sh,
                        width: .75.sw,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.amber, Colors.black]),
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: isLoading == true
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white),
                                  )),
                      ),
                    ),
                    SizedBox(height: .2.sh),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.blue, fontSize: 12.sp),
                        ),
                        SizedBox(width: 8.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signUp()));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(color: Colors.yellow),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
