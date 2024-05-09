import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import '../../../style/my_colors.dart';

class LocationDialog extends StatelessWidget {
  LocationDialog({super.key});

  final GeolocatorPlatform geoLocatorPlatform = GeolocatorPlatform.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Color(0xFF1B1B24),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: Color(0xFF262933)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF292A34),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.location_pin, color: Colors.white),
          ),
          const SizedBox(height: 32),
          Text(
            'Байршлыг идэвхжүүлнэ үү',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white, fontFamily: 'GIP'),
          ),
          const SizedBox(height: 12),
          Text(
            'Та байршлаа идэвхжүүлснээр бид таныг UG Arena-д байгаа эсэхийг шалган, таны саналыг хүлээн авах боломжтой болно.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.5), fontFamily: 'GIP'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: MyColors.secondaryColor),
            onPressed: () async {
              Get.isDialogOpen! ? Get.back() : null;
              await geoLocatorPlatform.openAppSettings();
            },
            child: Text(
              'Идэвxжүүлэх',
              style: TextStyle(fontFamily: 'GIP', color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              'Болих',
              style: TextStyle(fontFamily: 'GIP', color: Colors.white.withOpacity(0.5), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
