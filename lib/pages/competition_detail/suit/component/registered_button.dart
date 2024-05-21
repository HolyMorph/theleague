import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../style/my_colors.dart';

class RegisteredButton extends StatelessWidget {
  const RegisteredButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 26,
                    width: 26,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.time_to_leave),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.time_to_leave),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(left: 40),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(Icons.time_to_leave),
                  ),
                  Container(
                    height: 26,
                    width: 26,
                    margin: const EdgeInsets.only(left: 60),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: MyColors.grey500),
                        shape: BoxShape.circle,
                        color: MyColors.grey100,
                      ),
                      child: Text(
                        '+5',
                        style: TextStyle(
                          fontSize: 12,
                          color: MyColors.grey600,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Бүртгүүлсэн',
              style: TextStyle(
                color: MyColors.grey500,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(Icons.chevron_right, color: Colors.black, size: 28),
          ],
        ),
      ),
    );
  }
}
