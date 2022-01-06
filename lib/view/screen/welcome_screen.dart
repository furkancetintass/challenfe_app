import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/extension/context_extension.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/view/screen/beginning_screen.dart';
import 'package:temp_app/view/screen/facilities_screen.dart';
import 'package:temp_app/view/screen/notices_screen.dart';
import 'package:temp_app/view/widget/letter_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserVmInterface userViewModel = Provider.of<UserVmInterface>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hoş Geldiniz'),
        actions: [
          userViewModel.userIsMember()
              ? IconButton(
                  onPressed: () {
                    userViewModel.logOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const BeginningScreen()),
                      (route) => false,
                    );
                  },
                  icon: const Icon(Icons.exit_to_app))
              : const SizedBox()
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/bg.jpg',
            fit: BoxFit.fitWidth,
          ),
          SizedBox(height: context.dynamicHeight(0.04)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LetterContainer(
                title: 'Tesisler',
                voidCallback: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FacilitiesScreen()),
                ),
              ),
              LetterContainer(
                title: 'Duyurular',
                voidCallback: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const NoticesScreen()),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
