import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('LunchSphere'),
        leading: Icon(CupertinoIcons.person),
        backgroundColor: CupertinoColors.systemGrey6,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            lunchtimeTile('The bibstreet boys', '11:45',
                ['Lionel Messi', 'Aitana Bonmati']),
            lunchtimeTile(
                'HCI Group', '12:30', ['Frenkie De Jong', 'Ferran Torres']),
            lunchtimeTileWithComment(
                'Charles Kremer',
                '12:45',
                ['Lionel Messi', 'Aitana Bonmati', 'Andres Iniesta'],
                'There’s a special deal at RiceUp, Let’s head there!'),
            createCustomLunchtime(),
          ],
        ),
      ),
    );
  }

  Widget lunchtimeTile(String title, String time, List<String> participants) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(time),
            ...participants.map((participant) => Text(participant)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CupertinoButton(child: const Text('Accept'), onPressed: () {}),
            CupertinoButton(child: const Text('Decline'), onPressed: () {}),
            CupertinoButton(child: const Text('Options'), onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget lunchtimeTileWithComment(
      String title, String time, List<String> participants, String comment) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text(time),
            trailing: const Icon(CupertinoIcons.chat_bubble),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(comment),
          ),
          ListTile(
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  participants.map((participant) => Text(participant)).toList(),
            ),
            trailing:
                CupertinoButton(child: const Text('Accept'), onPressed: () {}),
          ),
        ],
      ),
    );
  }

  Widget createCustomLunchtime() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          const Text(
              'Reached the end and still hungry for plans? 🤔 If none of your group schedule fits, why not propose your own lunchtime? All people sharing a group with you will be able to join.'),
          CupertinoButton.filled(
            child: const Text('Create Custom Lunchtime'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
