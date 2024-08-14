import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../logic/register_competition_controller.dart';

class SelectedBankButton extends GetView<RegisterCompetitionController> {
  const SelectedBankButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(width: 1, color: MyColors.grey300)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '40000',
                    style: TextStyle(fontWeight: FontWeight.w600, color: MyColors.primaryColor),
                  ),
                  Text(
                    'Багийн хураамж',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: MyColors.grey500,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: MyColors.grey300),
                  ),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: '?size=w250',
                        imageBuilder: (context, imageProvider) => Container(
                          height: 28,
                          width: 28,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          height: 28,
                          width: 28,
                          child: CupertinoActivityIndicator(animating: true, radius: 10, color: Colors.white),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 8,
                                color: MyColors.grey200,
                              ),
                            ],
                          ),
                          child: Icon(Icons.person, color: MyColors.primaryColor),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'QPay',
                          style: TextStyle(
                            fontSize: 16,
                            color: MyColors.grey900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        FaIcon.edit,
                        style: FaIcon.regular().copyWith(fontSize: 18, color: MyColors.grey500),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Get.until((route) => Get.currentRoute == controller.state.from.value);
            },
            child: Text(
              'Төлбөр хийх',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
