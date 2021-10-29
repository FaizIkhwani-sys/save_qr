import 'package:flutter/material.dart';
import 'package:masjid_pro/app/utils/styles/app_colors.dart';

class AppTextWithLabel extends StatelessWidget {
  final String title;
  final String subtitle;

  const AppTextWithLabel({
    Key key,
    this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleText(title: title),
        SizedBox(height: 4.0),
        _SubtitleText(subtitle: subtitle),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  final String title;

  const _TitleText({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: TextStyle(
        color: AppColors.labelTextColor,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _SubtitleText extends StatelessWidget {
  final String subtitle;

  const _SubtitleText({Key key, @required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle ?? '',
      style: TextStyle(
        color: AppColors.darkTextColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
