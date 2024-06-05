import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/my_image_picker.dart';
import '../../../../style/my_colors.dart';
import '../../../../utils/fa_icon.dart';
import '../../logic/edit_team_controller.dart';

class EditImagePicker extends GetView<EditTeamController> {
  const EditImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.state.myTeam['team']['logoUrl'] != null && controller.state.myTeam['team']['logoUrl'].isNotEmpty)
          ? Row(
              children: [
                CachedNetworkImage(
                  imageUrl: '${controller.state.myTeam['team']['logoUrl']}?size=w150',
                  imageBuilder: (context, imageProvider) => Container(
                    height: 80,
                    width: 80,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: MyColors.grey300),
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    height: 80,
                    width: 80,
                    child: CupertinoActivityIndicator(animating: true, radius: 10, color: MyColors.primaryColor),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 80,
                    width: 80,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: MyColors.grey100),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.person, size: 32),
                  ),
                ),
                const SizedBox(width: 16),
                if (controller.state.isMeOwner.value)
                  Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () {
                        controller.state.myTeam['team']['logoUrl'] = '';
                        controller.state.myTeam.refresh();
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: MyColors.grey300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            Text(
                              FaIcon.trash,
                              style: FaIcon.regular().copyWith(
                                color: MyColors.greyBlue800,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Устгах',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: MyColors.greyBlue800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : MyImagePicker(
              selectedImage: controller.state.selectedImage,
              isHaveCamera: false,
              onDelete: () {},
            ),
    );
  }
}
