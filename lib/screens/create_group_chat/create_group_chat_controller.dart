import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/add_people_model.dart';
import '../../routes/app_routes.dart';

class CreateGroupChatController extends GetxController
    with SingleGetTickerProviderMixin {
  TabController? tabController;

  List<Tab> interestsTabs = [
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Tech',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Programming',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: interestsTabs.length, vsync: this);
  }

  final addPeopleChatList = [
    AddPeopleModel(
      imageUrl:
          'https://www.vhv.rs/dpng/d/5-55710_face-people-png-transparent-png.png',
      name: 'Surendra Bhat',
    ),
    AddPeopleModel(
      imageUrl:
          'https://img.pngio.com/man-face-png-people-without-face-png-1042_788.png',
      name: 'Brain Cant',
    ),
    AddPeopleModel(
      imageUrl: 'https://pngfree.io/upload/imgs/pngwing/free-png-bddxy.png',
      name: 'Kim Cattrall',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/362/857/png-clipart-smile-dentistry-smile-child-people.png',
      name: 'Katherine Wo',
    ),
    AddPeopleModel(
      imageUrl:
          'https://i.pinimg.com/originals/2f/da/7f/2fda7f7f4290fc93445002a4d89f5bd1.png',
      name: 'Tim Roth',
    ),
    AddPeopleModel(
      imageUrl:
          'https://w7.pngwing.com/pngs/908/280/png-transparent-graphy-smile-dentistry-smile-face-photography-people.png',
      name: 'Alex Roth',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/34/116/png-clipart-book-restylane-facial-1malaysia-people-s-housing-programme-face-steinway-street.png',
      name: 'Sienna Miller',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/127/466/png-clipart-hairstyle-male-facial-man-hair-face-people.png',
      name: 'Jeremy Irons',
    ),
  ];

  final sportsList = [
    'Horse racing',
    'Basketball',
    'Baseball',
    'Roller skating',
    'Baseball',
    'Horse racing',
    'Basketball',
    'Baseball',
    'Roller skating',
    'Baseball',
  ];

  final searchPeopleChatList = [
    AddPeopleModel(
      imageUrl:
          'https://i.pinimg.com/originals/2f/da/7f/2fda7f7f4290fc93445002a4d89f5bd1.png',
      name: 'George Lengyey',
      role: 'CEO',
    ),
    AddPeopleModel(
      imageUrl:
          'https://www.vhv.rs/dpng/d/5-55710_face-people-png-transparent-png.png',
      name: 'Surensra Bahti',
      role: 'UI/UX Designer',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/362/857/png-clipart-smile-dentistry-smile-child-people.png',
      name: 'Alexandra Pierce',
      role: 'HeyHub Ltd. Facilities Manager',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/362/857/png-clipart-smile-dentistry-smile-child-people.png',
      name: 'Jessy Walker',
      role: 'CEO',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/362/857/png-clipart-smile-dentistry-smile-child-people.png',
      name: 'Jessy Walker',
      role: 'CEO',
    ),
    AddPeopleModel(
      imageUrl:
          'https://e7.pngegg.com/pngimages/362/857/png-clipart-smile-dentistry-smile-child-people.png',
      name: 'Jessy Walker',
      role: 'CEO',
    ),
  ];

  void removePeopleFromChat(int index) {
    addPeopleChatList.removeAt(index);
    update();
  }

  void toAddPeopleToConversation() =>
      Get.toNamed(AppRoutes.addPeopleToConversation);

  @override
  void onClose() {
    super.onClose();
    tabController!.dispose();
  }
}
