import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.title,
    this.sufixText = "voir plus",
    this.onSufixClick,
  });

  final String title;
  final String sufixText;
  final void Function()? onSufixClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.black),
        ),
        InkWell(
          onTap: onSufixClick,
          child: Text(
            sufixText,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
        )
      ],
    );
  }
}
