import 'package:flutter/material.dart';

class TeamsMatchCart extends StatelessWidget {
  const TeamsMatchCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          teamItem(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '1 сарын 26',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '148',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.chevron_left,
                      color: Colors.white,
                    ),
                    Text(
                      'оноо',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '148',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          teamItem(),
        ],
      ),
    );
  }

  Widget teamItem() {
    return Column(
      children: [
        Container(
          height: 40,
          width: 40,
          child: Image.asset('assets/images/ic_team_dummy.png'),
        ),
        Text(
          'Apes',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        Text(
          '17-5',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}
