import 'package:get/get.dart';

import '../screens/create_group_chat/create_group_chat.dart';
import '../screens/create_group_chat/add_people_to_conversation.dart';

class AppRoutes {
  static const String createGroupChat = '/createGroupChat';
  static const String addPeopleToConversation = '/addPeopleToConversation';

  static final List<GetPage> pages = [
    GetPage(
      name: createGroupChat,
      page: () => CreateGroupChat(),
    ),
    GetPage(
      name: addPeopleToConversation,
      page: () => AddPeopleToConversation(),
    ),
  ];
}
