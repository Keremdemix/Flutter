import 'package:flutter/material.dart';
import 'package:task_2/register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
                    'Giriş Yap',
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
            flex: 4,
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
                      myLabel: 'E-posta',
                    ),
                    const MyTextField(
                      myIcon: (Icons.lock_outline),
                      myLabel: 'Şifre',
                      mySuffixIcon: (Icons.remove_red_eye_outlined),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyCheckBox(isRemember: isRemember),
                            const Text(
                              'Beni Hatırla',
                              style: TextStyle(color: ColorsItems.colorGrey),
                            ),
                          ],
                        ),
                        TextButton(
                            style: const ButtonStyle(
                                alignment: Alignment.centerRight),
                            onPressed: () {},
                            child: const Text(
                              'Şifreni mi unuttun?',
                            ))
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
                          'Hesabın yok mu?',
                          style: TextStyle(color: ColorsItems.colorGrey),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()),
                              );
                            },
                            child: const Text(
                              'Kaydol',
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

class GoogleButton extends StatefulWidget {
  const GoogleButton({
    super.key,
  });

  @override
  State<GoogleButton> createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Stack(children: [
        const MyContainerButton(
            buttonText: 'Google ile Giriş Yap',
            textColor: ColorsItems.colorBlue,
            buttonColor: ColorsItems.colorWhite),
        Positioned(
            bottom: 18, left: 5, child: Image.asset('assets/google1.png')),
      ]),
      onTap: () {},
    );
  }
}

class MyContainerButton extends StatefulWidget {
  const MyContainerButton({
    super.key,
    required this.buttonText,
    this.buttonIcon,
    required this.textColor,
    required this.buttonColor,
  });
  final String buttonText;
  final Image? buttonIcon;
  final Color textColor;
  final Color buttonColor;

  @override
  State<MyContainerButton> createState() => _MyContainerButtonState();
}

class _MyContainerButtonState extends State<MyContainerButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.40),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: widget.buttonColor),
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  textAlign: TextAlign.center,
                  widget.buttonText,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: widget.textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}

// ignore: must_be_immutable
class MyCheckBox extends StatefulWidget {
  MyCheckBox({super.key, @required this.isRemember});
  bool? isRemember;

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        side: const BorderSide(color: ColorsItems.colorGrey),
        value: widget.isRemember,
        onChanged: (value) {
          setState(() {
            widget.isRemember = !widget.isRemember!;
          });
        });
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.myIcon,
    required this.myLabel,
    this.mySuffixIcon,
  });
  final String myLabel;
  final IconData myIcon;
  final IconData? mySuffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 40,
        child: TextField(
          style: const TextStyle(height: 1),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: (Colors.grey.shade400))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorsItems.colorBlue)),
            contentPadding: const EdgeInsets.all(0),
            labelText: myLabel,
            labelStyle: const TextStyle(color: ColorsItems.colorGrey),
            prefixIcon: Icon(
              myIcon,
              color: ColorsItems.colorGrey,
            ),
            suffixIcon: Icon(
              mySuffixIcon,
              color: ColorsItems.colorGrey,
            ),
          ),
        ),
      ),
    );
  }
}

class ColorsItems {
  static const Color colorBlue = Color(0xff6666ff);
  static const Color colorWhite = Colors.white;
  static const Color colorGrey = Colors.grey;
}
