import 'package:flutter/cupertino.dart';
import 'package:lunchsphere/src/models/profile_model.dart';
import 'package:lunchsphere/src/util/style_consts.dart';

class ProfilePictureTextComponent extends StatelessWidget {
  final ProfileModel profile;
  const ProfilePictureTextComponent({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(profile.avatarUrl, width: 32, height: 32),
        const SizedBox(width: 8),
        Text(profile.name, style: StyleConsts.textPrimary),
      ],
    );
  }
}
