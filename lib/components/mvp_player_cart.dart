import 'package:flutter/material.dart';

class MvpPlayerCart extends StatelessWidget {
  const MvpPlayerCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Color(0xFF1A1A27),
      child: Row(
        children: [
          Column(
            children: [
              Image.asset('assets/icons/ic_player.png', width: 45, height: 45),
              const SizedBox(height: 4),
              Text(
                'Г. Өлзий-Орших',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    'IHC | ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    '#6 | ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Text(
                    'PG',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          playerItem(number: '32', text: 'Оноо'),
          const SizedBox(width: 16),
          playerItem(number: '2', text: 'Самбар'),
          const SizedBox(width: 16),
          playerItem(number: '11', text: 'Дамжуулалт'),
        ],
      ),
    );
  }

  Widget playerItem({required String number, required String text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
