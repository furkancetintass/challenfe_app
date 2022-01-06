import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/extension/context_extension.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/view/screen/login_screen.dart';
import 'package:temp_app/view/screen/welcome_screen.dart';
import 'package:temp_app/view/widget/primary_button.dart';
import 'package:temp_app/view/widget/secondary_button.dart';

class BeginningScreen extends StatelessWidget {
  const BeginningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      decoration: BoxDecoration(
        image: DecorationImage(
          // bg saydamlaştırması colorFilter sınıfı vasıtasıyla gerçekleştirilmiştir.
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
          image: const AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              const Text(
                'Yeşil\nBelediyesi\nMobil Uygulaması',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Column(
                children: [
                  PrimaryButton(
                    title: 'Üye Girişi',
                    voidCallback: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SecondaryButton(
                      title: 'Misafir olarak devam et',
                      voidCallback: () {
                        // login olup geri dönüldüğünde misafir girişi yapılan senaryoda kullanıcı logout edildi.
                        Provider.of<UserVmInterface>(context, listen: false).logOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
