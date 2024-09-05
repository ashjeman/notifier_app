import 'package:flutter/material.dart';
import 'package:notifier_app/components/assets_components/asset_items_component.dart';

import '../../components/background_container.dart';
import '../../components/custom_app_bar.dart';
import '../../components/nav_bar.dart';
import '../../components/search_field.dart';

class AssetItemsPage extends StatefulWidget {
  const AssetItemsPage({super.key});

  @override
  State<AssetItemsPage> createState() => _AssetItemsPageState();
}

class _AssetItemsPageState extends State<AssetItemsPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CustomAppBar(
                appBarTitle: 'Asset Items'
            )
        ),
        bottomNavigationBar: NavBar(currentPageIndex: 0),
        body: Container(
          padding: const EdgeInsets.only(top: 70),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/app-bg.png'),
              fit: BoxFit.cover, // This makes sure the image covers the entire background
            ),
          ),
          child: BackgroundContainer(
              boxHeight: 800,
              bgChild: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: SearchField(controller: controller, onChanged: (String ) {  },)),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/assetdetailspage'),
                        child: const Icon(
                          Icons.add,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0.0),
                          itemCount: 20,
                          itemBuilder: (context, index){
                            return AssetItemsComponent();
                          }
                      )
                  )
                ],
              )
          ),
        )
    );
  }
}
