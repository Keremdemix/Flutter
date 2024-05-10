import 'package:flutter/material.dart';
import 'package:task_2/Login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    bool isRemember = false;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorsItems.colorBlue,
        body: Column(children: [
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kaydol',
                    style:
                        TextStyle(color: ColorsItems.colorWhite, fontSize: 30),
                  ),
                  Icon(
                    Icons.access_alarms,
                    color: ColorsItems.colorWhite,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: ColorsItems.colorWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 34, horizontal: 24),
                child: Column(
                  children: [
                    const MyTextField(
                      myIcon: (Icons.mail_outline),
                      myLabel: 'Ad Soyad',
                    ),
                    const MyTextField(
                      myIcon: (Icons.lock_outline),
                      myLabel: 'E-Posta',
                    ),
                    const MyTextField(
                      myIcon: (Icons.mail_outline),
                      myLabel: 'Şifre',
                      mySuffixIcon: (Icons.remove_red_eye_outlined),
                    ),
                    const MyTextField(
                      myIcon: (Icons.mail_outline),
                      myLabel: 'Şifre Onayla',
                      mySuffixIcon: (Icons.remove_red_eye_outlined),
                    ),
                    Column(
                      children: [
                        CheckBoxWithText(
                            isRemember: isRemember,
                            buttonText: 'Şartlar & Koşullar',
                            remainingText: '\'ı okudum ve kabul ediyorum.'),
                        CheckBoxWithText(
                            isRemember: isRemember,
                            buttonText: 'Veri Gizliliği Politikası',
                            remainingText: '\'nı okudum ve kabul ediyorum.'),
                      ],
                    ),
                    const MyContainerButton(
                      buttonColor: ColorsItems.colorBlue,
                      textColor: ColorsItems.colorWhite,
                      buttonText: 'Giriş Yap',
                    ),
                    const GoogleButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Zaten bir Hesabın var m?',
                          style: TextStyle(color: ColorsItems.colorGrey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()),
                              );
                            },
                            child: const Text(
                              'Giriş Yap',
                              style: TextStyle(color: ColorsItems.colorBlue),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ]));
  }
}

class CheckBoxWithText extends StatelessWidget {
  const CheckBoxWithText({
    super.key,
    required this.isRemember,
    required this.buttonText,
    required this.remainingText,
  });

  final bool isRemember;
  final String buttonText;
  final String remainingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 20, child: MyCheckBox(isRemember: isRemember)),
          TextButton(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              ),
              onPressed: () {},
              child: Text(
                textAlign: TextAlign.left,
                buttonText,
              )),
          Text(
            remainingText,
            textAlign: TextAlign.left,
            style: const TextStyle(color: ColorsItems.colorGrey),
          ),
        ],
      ),
    );
  }
}
