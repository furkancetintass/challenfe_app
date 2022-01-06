import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/extension/context_extension.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/view/screen/welcome_screen.dart';
import 'package:temp_app/view/widget/primary_button.dart';
import 'package:temp_app/view/widget/primary_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserVmInterface userViewModel = Provider.of<UserVmInterface>(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(
              color: Colors.green.shade800,
            ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Üye Girişi'),
                  const SizedBox(height: 16),
                  PrimaryTextField(
                    labelText: 'Kullanıcı Adı',
                    isObsecture: false,
                    controller: userViewModel.usernameController,
                  ),
                  const SizedBox(height: 16),
                  PrimaryTextField(
                    labelText: 'Şifre',
                    isObsecture: true,
                    controller: userViewModel.passwordController,
                  ),
                  SizedBox(height: context.dynamicHeight(0.1)),
                  PrimaryButton(title: 'Üye Girişi', voidCallback: () => loginMethod(userViewModel, context))
                ]),
              ),
            ),
          )),
    );
  }

  loginMethod(UserVmInterface userViewModel, BuildContext context) {
    if (userViewModel.checkInputs(context)) {
      // giriş işlemi başarılı ise snackbar temizlenip hoş geldiniz sayfasına yönlendirildi.
      ScaffoldMessenger.of(context).clearSnackBars();
      userViewModel.usernameController.clear();
      userViewModel.passwordController.clear();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const WelcomeScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red.shade700, content: const Text('Lütfen girdiğiniz bilgileri kontrol edin.')));
    }
  }
}
