import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../res/app_colors.dart';
import '../../../res/app_styles.dart';
import '../../../widgets/build_circular_loading.dart';
import '../../../widgets/build_text.dart';
import 'create_group_chat_controller.dart';

class BuildAddPeopleToChat extends StatelessWidget {
  const BuildAddPeopleToChat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyles.kContainerBoxDecoration,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 1.3.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildText(
                  'Add people to group chat',
                  fontSize: 10,
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w600,
                ),
                Material(
                  color: AppColors.transparent,
                  child: InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 15.0,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        FeatherIcons.plus,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            GetBuilder<CreateGroupChatController>(
              init: CreateGroupChatController(),
              builder: (controller) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 5.h,
                    mainAxisSpacing: 1.h,
                    crossAxisSpacing: 1.h,
                  ),
                  itemCount: controller.addPeopleChatList.length,
                  itemBuilder: (_, index) {
                    final people = controller.addPeopleChatList[index];
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.primary,
                          width: 0.6.w,
                        ),
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.h, vertical: 0.8.h),
                        child: Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: people.imageUrl,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 2.5.h,
                                width: 2.5.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.w),
                                  ),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (_, url) => BuildCircularLoading(),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                color: AppColors.black,
                              ),
                            ),
                            SizedBox(width: 3.w),
                            Expanded(
                              child: BuildText(
                                people.name,
                                fontSize: 10.5,
                                color: AppColors.white,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Material(
                              color: AppColors.transparent,
                              child: InkWell(
                                onTap: () {
                                  controller.removePeopleFromChat(index);
                                },
                                child: Icon(
                                  Icons.close,
                                  color: AppColors.white,
                                  size: 3.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
