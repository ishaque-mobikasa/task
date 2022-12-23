import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/utils/app_colors.dart';
import 'package:task/core/routes.dart';
import 'package:task/presentation/pages/profile/controller/profile_controller.dart';

import 'widgets/account_grid_item.dart';
import 'widgets/double_color_title.dart';
import 'widgets/name_number_card.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.3,
            width: size.width,
            child: const ColoredBox(
              color: CustomColors.themeColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: DoubleColorTitle(
                    text1: 'My',
                    text2: 'Account',
                    firstColor: CustomColors.whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Obx(() => NameNumberCard(
                    image: controller.userData.value.image,
                    nameText: controller.userData.value.email.toString(),
                    phone: controller.userData.value.phoneNumber.toString())),
                const SizedBox(
                  height: 10,
                ),
                GridView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  children: [
                    AccountGridItem(
                      icon: Icons.manage_accounts,
                      title: 'Edit Profile',
                      onTap: () {
                        Get.toNamed(Routes.editProfileScreen);
                      },
                    ),
                    AccountGridItem(
                      icon: Icons.info,
                      title: 'About',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.headset_mic,
                      title: 'Contact us',
                      onTap: () {},
                    ),
                    AccountGridItem(
                      icon: Icons.share_outlined,
                      title: 'Share',
                      onTap: () {},
                    ),
                    Obx(() => AccountGridItem(
                          icon: Icons.security,
                          title: controller.userData.value.state,
                          onTap: () {},
                        )),
                    AccountGridItem(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {
                          controller.onLogoutButtonClick();
                        }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
