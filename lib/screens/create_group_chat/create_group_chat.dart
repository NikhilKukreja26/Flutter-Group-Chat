import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:group_chat_ui/widgets/build_circular_loading.dart';
import 'package:group_chat_ui/widgets/build_custom_circular_button.dart';
import 'package:group_chat_ui/widgets/build_text.dart';

import 'package:sizer/sizer.dart';

import '../../res/app_colors.dart';
import '../../res/app_styles.dart';
import 'build_add_people_to_chat.dart';
import 'create_group_chat_controller.dart';

class CreateGroupChat extends StatelessWidget {
  const CreateGroupChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateGroupChatController());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: Container(
                //     width: 50.0,
                //     height: 50.0,
                //     decoration: BoxDecoration(
                //       color: AppColors.primary,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Icon(
                //       Icons.arrow_back_ios,
                //     ),
                //   ),
                // ),
                SizedBox(height: 1.h),
                BuildCreateGroupChatRow(
                  text: 'Create group chat',
                ),
                SizedBox(height: 10.h),
                BuildCircularChatImage(),
                SizedBox(height: 5.5.h),
                BuildChatpGroupName(),
                SizedBox(height: 4.h),
                BuildAddPeopleToChat(),
                SizedBox(height: 2.h),
                BuildText(
                  'Link to interests',
                  fontSize: 13,
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 2.h),
                TabBar(
                  controller: controller.tabController,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 2.5,
                  labelColor: AppColors.white,
                  isScrollable: true,
                  enableFeedback: true,
                  unselectedLabelColor: AppColors.darkGrey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  tabs: controller.interestsTabs,
                ),
                SizedBox(
                  height: 40.h,
                  child: TabBarView(
                    controller: controller.tabController,
                    children: <Widget>[
                      Container(),
                      Container(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Wrap(
                          runSpacing: 4.0,
                          spacing: 10.0,
                          alignment: WrapAlignment.center,
                          children: controller.sportsList
                              .map(
                                (sport) => Chip(
                                  backgroundColor: AppColors.primary,
                                  label: BuildText(
                                    sport,
                                    color: AppColors.white,
                                  ),
                                  labelPadding:
                                      EdgeInsets.symmetric(horizontal: 2.h),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      Container(),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      onPrimary: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: BuildText(
                      'Save',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildChatpGroupName extends StatelessWidget {
  const BuildChatpGroupName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.kContainerBoxDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
              'Chat Group Name',
              fontSize: 11,
              color: AppColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 0.2.h),
            BuildText(
              'Friday football',
              fontSize: 13,
              color: AppColors.white,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCreateGroupChatRow extends StatelessWidget {
  const BuildCreateGroupChatRow({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: AppColors.primary,
          width: 0.7.w,
          height: 3.h,
        ),
        SizedBox(width: 2.8.w),
        BuildText(
          text!,
          color: AppColors.white,
        )
      ],
    );
  }
}

class BuildCircularChatImage extends StatelessWidget {
  const BuildCircularChatImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      // alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://www.pngpix.com/wp-content/uploads/2016/11/PNGPIX-COM-Football-PNG-Transparent-Image.png',
            imageBuilder: (context, imageProvider) => Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.white,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.w),
                ),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (_, url) => BuildCircularLoading(),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: Colors.black),
          ),
          Positioned(
            left: 26.w,
            bottom: 1.0,
            child: BuildCustomCircularButton(
              iconData: FontAwesomeIcons.pencilAlt,
              radius: 5,
              iconSize: 5,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
