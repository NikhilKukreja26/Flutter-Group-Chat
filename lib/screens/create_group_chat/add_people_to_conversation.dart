import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:universal_platform/universal_platform.dart';

import '../../res/app_styles.dart';
import '../../res/app_colors.dart';
import '../../widgets/build_custom_circular_button.dart';
import '../../widgets/build_text.dart';
import 'build_add_people_to_chat.dart';
import 'create_group_chat_controller.dart';

class AddPeopleToConversation extends StatelessWidget {
  const AddPeopleToConversation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createGroupChatController = Get.find<CreateGroupChatController>();
    return Scaffold(
      appBar: UniversalPlatform.isWeb
          ? AppBar(
              title: BuildText(
                'Add people to conversation',
                color: AppColors.white,
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: AppStyles.kContainerBoxDecoration,
                padding: EdgeInsets.symmetric(horizontal: 1.h, vertical: 0.2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Search Peoples by name or email',
                        labelStyle: TextStyle(
                          color: AppColors.darkGrey,
                          fontSize: 10.5.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        hintText: 'George',
                        hintStyle: TextStyle(
                          color: AppColors.white,
                          fontSize: 10.5.sp,
                        ),
                        suffixIcon: Icon(
                          FeatherIcons.search,
                          color: AppColors.white,
                        ),
                        isDense: true,
                      ),
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount:
                      createGroupChatController.searchPeopleChatList.length,
                  itemBuilder: (_, int index) {
                    final searchList =
                        createGroupChatController.searchPeopleChatList[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Container(
                        decoration: AppStyles.kContainerBoxDecoration,
                        child: ListTile(
                          leading: Container(
                            height: 20.h,
                            width: 15.w,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              child: BuildCachedImage(
                                imageUrl: searchList.imageUrl,
                                height: 20.h,
                                width: 15.w,
                              ),
                            ),
                          ),
                          title: BuildText(
                            searchList.name!,
                            color: AppColors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          subtitle: BuildText(
                            searchList.role!,
                            color: AppColors.darkGrey,
                            fontSize: 9,
                            fontWeight: FontWeight.w600,
                          ),
                          trailing: BuildCustomCircularButton(
                            iconData: FontAwesomeIcons.plus,
                            onTap: () {},
                          ),
                          // dense: true,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
