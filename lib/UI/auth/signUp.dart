import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:detail_information/UI/auth/signin/signIn.dart';
import 'package:detail_information/UI/homeScreen.dart';
import 'package:detail_information/utils/custTextFormField.dart';
import 'package:detail_information/utils/toastPopUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final TextEditingController fullname = TextEditingController();

  final TextEditingController emailContr = TextEditingController();

  final TextEditingController passw = TextEditingController();

  final TextEditingController cpassw = TextEditingController();

  final TextEditingController agecontr = TextEditingController();

  int password =
      -1; // 0: mismatch, 1: match, 2: empty password, 3: empty confirm password

  int gmail = -1;

  int fullName = -1;
  final bool _isPasswordVisible = false;

  bool isLoading = false;

  final keyOfForm = GlobalKey<FormState>();

  FirebaseAuth authent = FirebaseAuth.instance;

  FirebaseFirestore fStore = FirebaseFirestore.instance;

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bcnn.jpg'), fit: BoxFit.fill)),
        height: 1.sh,
        width: 1.sw,
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
            Form(
                key: keyOfForm,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(0.05.sw, .02.sh, .05.sw, 0),
                    child: Column(children: [
                      fullName == 0
                          ? Text('*Full Name can\'t be empty',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.sp))
                          : SizedBox(
                              height: 0.03.sh,
                            ),
                      CustTextFormField(
                        label: 'Full Name',
                        hint: 'Billy Boy',
                        controller: fullname,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Full Name can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      gmail == 0
                          ? Text('*Phone or Gmail can\'t be empty',
                              style:
                                  TextStyle(color: Colors.red, fontSize: 12.sp))
                          : SizedBox(
                              height: 0.03.sh,
                            ),
                      CustTextFormField(
                        label: 'G-Mail',
                        hint: 'you@gmail.com',
                        controller: emailContr,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a valid G-Mail';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: .03.sh,
                      ),
                      CustTextFormField(
                        label: 'Password',
                        hint: 'password',
                        controller: passw,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Passwords can not be empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      password == 0
                          ? (Text('*Passwords doesn\'t match',
                              style: TextStyle(
                                  color: Colors.red, fontSize: 12.sp)))
                          : (password == 2
                              ? Text('*Passwords can\'t be empty',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 12.sp))
                              : (password == 3
                                  ? Text('*Confirm your Password',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 12.sp))
                                  : SizedBox(
                                      height: 0.03.sh,
                                    ))),
                      CustTextFormField(
                        label: 'Confirm Password',
                        hint: 'password',
                        controller: cpassw,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm your password as well';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: .02.sh,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: .5.sw,
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter an Valid Email or Phone No';
                                }
                                return null;
                              },
                              controller: agecontr,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Age',
                                hintText: '18',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 226, 222, 209)),
                                labelStyle: const TextStyle(
                                    color: Colors.yellow,
                                    fontWeight: FontWeight.bold),
                                suffixIcon: Icon(
                                  Icons.check,
                                  color: gmail == 1
                                      ? Colors.green
                                      : const Color.fromARGB(
                                          255, 227, 225, 225),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromARGB(255, 182, 146, 29)),
                                ),
                              ),
                            ),
                          ),
                          DropdownButton(
                            dropdownColor:
                                const Color.fromARGB(255, 15, 90, 15),
                            hint: const Text(
                              'Gender',
                              style: TextStyle(color: Colors.yellow),
                            ),
                            value: selectedGender,
                            items: const [
                              DropdownMenuItem(
                                value: 'male',
                                child: Text(
                                  'Male',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              ),
                              DropdownMenuItem(
                                value: 'female',
                                child: Text(
                                  'Female',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                              )
                            ],
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedGender = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          // Perform asynchronous operations outside of setState
                          String fn = fullname.text;
                          String gm = emailContr.text;
                          String pw = passw.text;
                          String cpw = cpassw.text;
                          int gmailStatus = gm.isNotEmpty ? 1 : 0;
                          int fullNameStatus = fn.isNotEmpty ? 1 : 0;
                          int passwordStatus;

                          if (pw.isEmpty) {
                            passwordStatus = 2; // Password is empty
                          } else if (cpw.isEmpty) {
                            passwordStatus = 3; // Confirm password is empty
                          } else if (pw != cpw) {
                            passwordStatus = 0; // Passwords don't match
                          } else {
                            passwordStatus = 1; // Passwords match
                          }
                          // Update the UI inside setState
                          setState(() {
                            gmail = gmailStatus;
                            fullName = fullNameStatus;
                            password = passwordStatus;
                            isLoading = true;
                          });

                          if (passwordStatus == 1 &&
                              fullNameStatus == 1 &&
                              gmailStatus == 1 &&
                              keyOfForm.currentState!.validate()) {
                            authent
                                .createUserWithEmailAndPassword(
                                    email: emailContr.text.toString().trim(),
                                    password: passw.text.toString().trim())
                                .then((value) {
                              DateTime currentDnT = DateTime.now();
                              fStore
                                  .collection('UserDetails')
                                  .doc(value.user!.uid)
                                  .set({
                                'fullName': fullname.text.toString().trim(),
                                'email': emailContr.text.toString().trim(),
                                'password': passw.text.toString().trim(),
                                'time': currentDnT.toIso8601String(),
                                'gender': selectedGender,
                                'userID': value.user!.uid,
                              });

                              ToastPopUp().toastPopUp(
                                  'Sign Up Successful', Colors.black);

                              // Navigate to SignIn screen or other screen after saving data
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                              setState(() {
                                isLoading = false;
                              });
                              fullname.clear();
                              emailContr.clear();
                              passw.clear();
                              cpassw.clear();
                            }).onError((error, value) {
                              ToastPopUp()
                                  .toastPopUp(error.toString(), Colors.black);
                              setState(() {
                                isLoading = false;
                              });
                            });
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                        child: Container(
                          width: .75.sw,
                          height: .075.sh,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Colors.amber, Colors.black]),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: isLoading == true
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text('SIGN UP',
                                    style: TextStyle(
                                        fontSize: 18.sp, color: Colors.white)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: .07.sh,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Already have an account?",
                            style:
                                TextStyle(color: Colors.blue, fontSize: 12.sp),
                          ),
                          const SizedBox(width: 8.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const signIn()));
                            },
                            child: const Text(
                              'Log In',
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ],
                      ),
                    ]))),
          ],
        ),
      ),
    );
  }
}
