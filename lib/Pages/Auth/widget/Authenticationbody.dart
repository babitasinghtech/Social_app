import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/Pages/Auth/widget/Login.dart';
import 'package:social_media/Pages/Auth/widget/Signupform.dart';

class AuthenticationPageBody extends StatelessWidget {
  const AuthenticationPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isLogin = false.obs;
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Obx(
                  () => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          isLogin.value = true;
                        },
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Login",
                                style:
                                    isLogin.value
                                        ? Theme.of(context).textTheme.bodyLarge
                                        : Theme.of(
                                          context,
                                        ).textTheme.labelLarge,
                              ),
                              SizedBox(height: 5),
                              AnimatedContainer(
                                duration: Duration(microseconds: 200),
                                width: isLogin.value ? 100 : 0,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          isLogin.value = false;
                        },
                        // ignore: sized_box_for_whitespace
                        child: Container(
                          width: MediaQuery.sizeOf(context).width / 2.5,
                          child: Column(
                            children: [
                              Text(
                                "Sign Up",
                                style:
                                    isLogin.value
                                        ? Theme.of(context).textTheme.bodyLarge
                                        : Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 5),
                              AnimatedContainer(
                                duration: Duration(milliseconds: 200),
                                width: isLogin.value ? 0 : 100,
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => isLogin.value ? const LoginForm() : const Signupform(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
