import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tiktok Clone',
                  style: TextStyle(
                    fontSize: 35,
                    color: buttonColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Stack(
                  children: [
                    // const CircleAvatar(
                    //   radius: 64,
                    //   backgroundImage: NetworkImage(
                    //     'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
                    //   ),
                    //   backgroundColor: Colors.black,
                    // ),
                    SizedBox(
                      width: 128,
                      height: 128,
                      // child: authController.profilePhoto != null
                      //     ? Image.file(authController.profilePhoto!)
                      //     : Image.asset('images/profile.png'),
                      child: Image.asset('images/profile.png'),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () => authController.pickImage(),
                        icon: const Icon(
                          Icons.add_a_photo,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _usernameController,
                    labelText: 'Username',
                    icon: Icons.person,
                    validator: 'Enter your username',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _emailController,
                    labelText: 'Email',
                    icon: Icons.email,
                    validator: 'Enter your email',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextInputField(
                    controller: _passwordController,
                    labelText: 'Password',
                    icon: Icons.lock,
                    isObscure: true,
                    validator: 'Enter your password',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                authController.isLoading
                    ? CircularProgressIndicator(color: buttonColor)
                    : Container(
                        width: MediaQuery.of(context).size.width - 40,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            // if (_formKey.currentState!.validate()) {
                            //   authController.registerUser(
                            //     _usernameController.text,
                            //     _emailController.text,
                            //     _passwordController.text,
                            //     authController.profilePhoto,
                            //   );
                            // }
                            authController.registerUser(
                              _usernameController.text,
                              _emailController.text,
                              _passwordController.text,
                              authController.profilePhoto,
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20, color: buttonColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
