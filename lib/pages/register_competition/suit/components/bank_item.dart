import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class BankItem extends StatelessWidget {
  final String bankIcon;
  final String bankName;
  final VoidCallback onTap;
  const BankItem({required this.onTap, required this.bankIcon, required this.bankName, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: MyColors.grey300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: '${bankIcon}?size=w250',
            imageBuilder: (context, imageProvider) => Container(
              height: 45,
              width: 45,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(image: imageProvider, fit: BoxFit.fitHeight),
              ),
            ),
            placeholder: (context, url) => Container(
              alignment: Alignment.center,
              height: 45,
              width: 45,
              child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
            ),
            errorWidget: (context, url, error) => Container(
              height: 45,
              width: 45,
              child: Icon(Icons.image, color: MyColors.primaryColor),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            bankName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: MyColors.neutral900,
            ),
          ),
        ],
      ),
    );
  }
}
