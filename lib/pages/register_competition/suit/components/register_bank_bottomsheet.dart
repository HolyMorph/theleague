import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/basic_utils.dart';

class RegisterBankBottomSheet extends StatelessWidget {
  final dynamic bankList;
  const RegisterBankBottomSheet({required this.bankList, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 16),
        Text(
          'Төлбөрийн хэрэгсэл',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Divider(height: 1, thickness: 1, color: MyColors.grey200),
        const SizedBox(height: 8),
        GridView.count(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          crossAxisCount: 2,
          childAspectRatio: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            for (var bank in bankList)
              GestureDetector(
                onTap: () {
                  BasicUtils.openUrl(
                    url: bank['link'],
                    storeUrl: BasicUtils.getStoreUrl(bank['name']),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFEAECF0)),
                  ),
                  child: Row(
                    children: [
                      /// bank icon
                      CachedNetworkImage(
                        imageUrl: bank?['logo'] ?? '',
                        height: 47,
                        width: 47,
                      ),
                      const SizedBox(width: 8),

                      /// text
                      Expanded(
                        child: Text(
                          '${bank['description'] ?? bank['name'] ?? ''}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xff101828),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ).paddingAll(8),
      ],
    );
  }
}
