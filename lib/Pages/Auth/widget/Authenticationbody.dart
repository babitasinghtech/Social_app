import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        isLogin.value = true;
                      },
                      child: Column(
                        children: [
                          Text(
                            "Login",
                            style:
                                isLogin.value
                                    ? Theme.of(context).textTheme.bodyLarge
                                    : Theme.of(context).textTheme.labelLarge,
                          ),
                          SizedBox(height: 5),
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
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
                    Column(
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
                          duration: Duration(seconds: 2),
                          width: isLogin.value ? 0 : 100,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
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
}
