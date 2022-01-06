import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temp_app/core/extension/context_extension.dart';
import 'package:temp_app/core/interface/user_vm_interface.dart';
import 'package:temp_app/model/favorites_model.dart';
import 'package:temp_app/view/widget/fav_button.dart';
import 'package:temp_app/view_model/favorites_view_model.dart';
import 'package:temp_app/core/globals/globals.dart' as globals;
import 'package:temp_app/view_model/user_view_model.dart';

class FacilitiesScreen extends StatelessWidget {
  const FacilitiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProxyProvider<UserVmInterface, FavoritesViewModel>(
      create: (_) => FavoritesViewModel(Provider.of<UserVmInterface>(context, listen: false)),
      update: (context, userViewModel, favoritesViewModel) => FavoritesViewModel(userViewModel),
      child:
          Consumer2<FavoritesViewModel, UserVmInterface>(builder: (context, favoritesViewModel, userViewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tesisler'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Center(child: Text(favoritesViewModel.userViewModel.username)),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                userViewModel.userIsMember() && globals.favoritesList.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Favori Tesislerim',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade800,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: context.dynamicHeight(0.3),
                            child: GridView.builder(
                                itemCount: globals.favoritesList.length,
                                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                                itemBuilder: (_, index) {
                                  return FavoritedItem(
                                    id: globals.favoritesList[index],
                                  );
                                }),
                          ),
                          // Wrap(children: globals.favoritesList.map((e) => FavoritedItem(id: e)).toList()),
                          //? alternatif kullanım wrap ile gerçekleştirilebilir.
                          const SizedBox(height: 12),
                        ],
                      )
                    : const SizedBox(),
                Text('Tüm Tesisler',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        FavoritesModel favoritesModel = favoritesModelList[index];
                        return FacilitiesItem(
                          favoritesModel: favoritesModel,
                          userIsMember: userViewModel.userStatus == UserStatus.member,
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      // yukarıdaki kısımda context ve indexe ihtiyacımız olmadığı için bu yöntemi tercih ettim.
                      // bu tarz durumlar için bu yöntem tavsiye edilmektedir.
                      itemCount: favoritesModelList.length),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class FavoritedItem extends StatelessWidget {
  const FavoritedItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    String title = favoritesModelList.firstWhere((element) => element.id == id).title;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Container(
        // height: 100,
        // width: context.dynamicWidth(0.33) - 18,
        // sabit olarak verilen 18 değeri paddinglerden geliyor.
        // genişliğin 1/3'ü alındıktan sonra kenarlardan verilen padding çıkartıldı
        // wrap widget'ı ile kullanılmak için yoruma alındı.
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Stack(
          children: [
            Center(child: Text(title)),
            Positioned(
              top: 2,
              right: 2,
              child: FavButton(id: id),
            ),
          ],
        ),
      ),
    );
  }
}

class FacilitiesItem extends StatelessWidget {
  const FacilitiesItem({
    Key? key,
    required this.favoritesModel,
    required this.userIsMember,
  }) : super(key: key);

  final FavoritesModel favoritesModel;
  final bool userIsMember;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              favoritesModel.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            userIsMember ? FavButton(id: favoritesModel.id) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
