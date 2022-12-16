import 'package:flutter/material.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/presentation/pages/profile/widgets/title_widget.dart';

class NameNumberCard extends StatelessWidget {
  final String nameText;
  final String phone;
  const NameNumberCard({
    required this.nameText,
    required this.phone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        color: CustomColors.whiteColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/profile_dummy.jpg'),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleWidget(
                    text: nameText,
                    fontSize: 20,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TitleWidget(
                    text: phone,
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}