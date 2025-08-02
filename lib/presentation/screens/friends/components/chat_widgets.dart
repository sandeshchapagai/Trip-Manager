import 'package:flutter/material.dart';
import 'package:trip_manager/core/app/constants/dimensions.dart';
import 'package:trip_manager/presentation/widgets/custom_search_textfield_widget.dart';

class ChatHomePage extends StatelessWidget {
  final List<Map<String, dynamic>> favorites = [
    {
      'title': 'Avengers Endgame',
      'avatars': [
        AssetImage('assets/avatar1.png'),
        AssetImage('assets/avatar2.png'),
        AssetImage('assets/avatar3.png'),
      ],
      'extraCount': 3,
    },
    {
      'title': 'Paris SG',
      'avatars': [
        AssetImage('assets/avatar4.png'),
        AssetImage('assets/avatar5.png'),
      ],
      'extraCount': 0,
      'badge': AssetImage('assets/psg_logo.png'),
    },
    // Add more favorites as needed
  ];

  final List<Map<String, dynamic>> chats = [
    {
      'avatar': NetworkImage('https://i.pravatar.cc/150?img=1'),
      'title': 'Keto recipes',
      'subtitle':
          'Here are 18 recipes for healthy low-carb breakfasts that also happen...',
      'time': '11:20',
      'avatars': [
        NetworkImage('https://i.pravatar.cc/150?img=2'),
        NetworkImage('https://i.pravatar.cc/150?img=3'),
        NetworkImage('https://i.pravatar.cc/150?img=4'),
      ],
      'extraCount': 3,
      'unreadCount': 4,
    },
    {
      'avatar': NetworkImage('https://i.pravatar.cc/150?img=5'),
      'title': 'Tatoo ideas',
      'subtitle':
          "So you can't waste surface area with a tattoo that's subpar. That's...",
      'time': '11:20',
      'avatars': [
        NetworkImage('https://i.pravatar.cc/150?img=6'),
        NetworkImage('https://i.pravatar.cc/150?img=7'),
        NetworkImage('https://i.pravatar.cc/150?img=8'),
      ],
      'extraCount': 0,
      'unreadCount': 2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextFormWidget(onChanged: () {}),
        kVSizedBox1,
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: chats.length,
          separatorBuilder: (c, i) => const Divider(),
          itemBuilder: (context, index) {
            final chat = chats[index];
            return ListTile(
              leading: ClipOval(
                child: Image.network(
                  'https://i.pravatar.cc/150?img=1',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                  loadingBuilder: (context, child, progress) =>
                      progress == null ? child : CircularProgressIndicator(),
                ),
              ),
              title: Text(
                chat['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                chat['subtitle'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(chat['time'], style: TextStyle(fontSize: 12)),
                  SizedBox(height: 6),
                  if (chat['unreadCount'] > 0)
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.green,
                      child: Text(
                        '${chat['unreadCount']}',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
