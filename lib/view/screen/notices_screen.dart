import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/model/notices_model.dart';
import 'package:temp_app/view/widget/delete_button.dart';
import 'package:temp_app/view_model/notices_view_model.dart';

class NoticesScreen extends StatelessWidget {
  const NoticesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<UserVmInterface, NoticesViewModel>(
      create: (_) => NoticesViewModel(Provider.of<UserVmInterface>(context, listen: false)),
      update: (context, userViewModel, noticesViewModel) => NoticesViewModel(userViewModel),
      child: Consumer2<NoticesViewModel, UserVmInterface>(builder: (context, noticesViewModel, userViewModel, child) {
        noticesViewModel.getNotices();
        return Scaffold(
          appBar: AppBar(
            title: const Text('Duyurular'),
            backgroundColor: Colors.green.shade800,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(child: Text(noticesViewModel.userViewModel.username)),
              )
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    NoticesModel noticesModel = noticesModelList[index];
                    return NoticesItem(
                      noticesModel: noticesModel,
                      userIsMember: userViewModel.userIsMember(),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: noticesModelList.length)),
        );
      }),
    );
  }
}

class NoticesItem extends StatelessWidget {
  const NoticesItem({
    Key? key,
    required this.noticesModel,
    required this.userIsMember,
  }) : super(key: key);

  final NoticesModel noticesModel;
  final bool userIsMember;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all()),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    noticesModel.title,
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  userIsMember ? DeleteButton(id: noticesModel.id) : const SizedBox(),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                noticesModel.subtitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              ...List.generate(
                noticesModel.content.length,
                (index) => Text(
                  noticesModel.content[index],
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
