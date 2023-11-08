import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lunchsphere/src/pages/home_page_A.dart';
import 'package:lunchsphere/src/pages/home_page_B.dart';
import 'package:lunchsphere/src/providers/data_provider.dart';
import 'package:lunchsphere/src/services/api_service.dart';
import 'package:lunchsphere/src/util/routes.dart';
import 'package:lunchsphere/src/util/style_consts.dart';
import 'package:lunchsphere/src/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ABChooser extends StatelessWidget {
  const ABChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DataProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('AB Chooser'),
      ),
      child: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.aTest,
                        );
                      },
                      color: StyleConsts.greenBackground,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 40.0),
                      child: Text(
                        "A Test",
                        style: StyleConsts.buttonText
                            .copyWith(color: StyleConsts.purpleLight),
                      ),
                    ),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          Routes.bTest,
                        );
                      },
                      color: StyleConsts.greenBackground,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 40.0),
                      child: Text(
                        "B Test",
                        style: StyleConsts.buttonText
                            .copyWith(color: StyleConsts.purpleLight),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.account_circle,
            color: StyleConsts.greyDarker,
            size: 32,
          ),
          Image.asset(
            'assets/images/LunchSphereLogo_154x33.png',
            fit: BoxFit.cover,
            height: 32, // Adjust the size to fit your logo design
          ),
          Image.asset(
            'assets/images/avatar1.png',
            fit: BoxFit.cover,
            height: 32, // Adjust the size to fit your logo design
          ),
        ],
      ),
    );
  }
}
