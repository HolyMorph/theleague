import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mezorn_dummy/demo/demo_alert/my_snack_bar_collection.dart';
import 'package:mezorn_dummy/demo/demo_icons/my_icon_button_collection.dart';
import 'package:mezorn_dummy/demo/demo_selectable_widgets/selectable_widget_collection.dart';
import 'package:mezorn_dummy/demo/demo_texts/text_collection.dart';

import 'demo_alert/my_dialog_collection.dart';
import 'demo_bottom_navigation/my_bottom_navigation_collection.dart';
import 'demo_alert/my_bottom_sheet_collection.dart';
import 'demo_buttons/button_collection.dart';
import 'demo_icons/my_icon_collection.dart';
import 'demo_progress/my_progress_collection.dart';
import 'demo_slider/my_slider_collection.dart';
import 'demo_textfield/textfields_collection.dart';

class MyStyleGuide extends StatefulWidget {
  const MyStyleGuide({Key? key}) : super(key: key);

  @override
  _MyStyleGuideState createState() => _MyStyleGuideState();
}

class _MyStyleGuideState extends State<MyStyleGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Style Guide'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  onPressed: () {
                    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    _rebuildAllChild();
                  },
                  child: const Text('Change theme'),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Доорх виджетүүдийн энгийн хувилбарууд нь гаргасан дезайны загвартай таарч байх ёстой'),

                      ///Товчлууруудын загвар
                      ButtonCollection(),

                      ///TextField-ийн загварууд
                      TextFieldsCollection(),

                      ///Текстүүдийн загвар
                      TextCollection(),

                      ///Сонгогдох боломжтой виджетүүдийн загвар
                      SelectableWidgetCollection(),

                      ///Icon жагсаалтууд
                      MyIconCollection(),

                      ///IconButton жагсаалтууд
                      MyIconButtonCollection(),

                      ///[BottomNavigation] буюу хөл хэсгийн таб-ын загвар
                      MyBottomNavigationCollection(),

                      ///Dialog харуулах жагсаалтууд
                      MyDialogCollection(),

                      ///BottomSheet харуулах жагсаалтууд
                      MyBottomSheetCollection(),

                      ///SnackBar харуулах жагсаалтууд
                      MySnackBarCollection(),

                      ///Уншиж буй индикато харуулах жагсаалтууд
                      MyProgressCollection(),

                      ///Slider загварууд
                      MySliderCollection(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///Бүх виджетүүдийг хүчээр дахин зурах функц
  _rebuildAllChild() {
    Future.delayed(const Duration(milliseconds: 200), () {
      void rebuild(Element el) {
        el.markNeedsBuild();
        el.visitChildren(rebuild);
      }

      (context as Element).visitChildren(rebuild);
    });
  }
}
