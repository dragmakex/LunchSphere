import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/util/style_consts.dart';

class PageWidgetScrollable extends StatelessWidget {
  final String title;
  final bool canPop;
  final Widget child;

  const PageWidgetScrollable({
    super.key,
    required this.title,
    required this.canPop,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    if (canPop)
                      CupertinoButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: StyleConsts.blackPrimary,
                          size: 24,
                        ),
                      )
                    else
                      const SizedBox(height: 52),
                    Text(title, style: StyleConsts.pageTitle),
                  ],
                ),
                const SizedBox(height: 20),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageWidgetFixed extends StatelessWidget {
  final String title;
  final bool canPop;
  final Widget child;

  const PageWidgetFixed({
    super.key,
    required this.title,
    required this.canPop,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: StyleConsts.backgroundPrimary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  if (canPop)
                    CupertinoButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: StyleConsts.blackPrimary,
                        size: 24,
                      ),
                    )
                  else
                    const SizedBox(height: 52),
                  Text(title, style: StyleConsts.pageTitle),
                ],
              ),
              const SizedBox(height: 20),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
