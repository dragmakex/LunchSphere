import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:provider/provider.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return const CupertinoPageScaffold(
      // insert some text
      child: Text("Hello World"),
    );
  }
}
