import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final Map<String, dynamic> player;
  const DrawerItem({required this.player, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Color(0xFF272739)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1, color: Color(int.parse('0xFF${player['teamColor']}'))),
              image: DecorationImage(image: AssetImage('assets/images/ic_player.png'), fit: BoxFit.fitHeight),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 8,
                  color: Color(int.parse('0xFF${player['teamColor']}')).withOpacity(0.5),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                player['playerFirstName'],
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                '${player['playerNumber']} - IHC Apes',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
