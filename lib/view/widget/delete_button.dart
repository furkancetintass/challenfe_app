import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/view_model/notices_view_model.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    NoticesViewModel noticesViewModel = Provider.of<NoticesViewModel>(context);

    return OutlinedButton(
      child: Text(
        'Sil',
        style: TextStyle(color: Colors.green.shade800),
      ),
      onPressed: () => noticesViewModel.deleteNotice(id),
    );
  }
}
