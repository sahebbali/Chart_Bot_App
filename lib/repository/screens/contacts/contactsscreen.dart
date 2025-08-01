import 'package:chatappui/domain/constants/appcolors.dart';
import 'package:chatappui/repository/screens/widgets/uihelper.dart';
import 'package:chatappui/repository/screens/chats/chatsscreen.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ContactsScreen({super.key});

  final List<Map<String, String>> arrContacts = [
    {
      "img": "Frame 3293.png",
      "name": "Athalia Putri",
      "lastseen": "Last seen yesterday",
      "message": "Hey! Are we still on for tomorrow?",
    },
    {
      "img": "Avatar.png",
      "name": "Erlan Sadewa",
      "lastseen": "Online",
      "message": "Sure, I’ve sent you the files.",
    },
    {
      "img": "Avatar (1).png",
      "name": "Midala Huera",
      "lastseen": "Last seen 3 hours ago",
      "message": "Let’s catch up sometime soon!",
    },
    {
      "img": "Avatar (2).png",
      "name": "Nafisa Gitari",
      "lastseen": "Online",
      "message": "Can you review the document I sent?",
    },
    {
      "img": "Frame 3293 (1).png",
      "name": "Raki Devon",
      "lastseen": "Online",
      "message": "I'll be there in 10 minutes.",
    },
    {
      "img": "Avatar (3).png",
      "name": "Salsabila Akira",
      "lastseen": "Last seen 30 minutes ago",
      "message": "Thanks! That helped a lot.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.scaffolddark
            : AppColors.scaffoldlight,
        title: UiHelper.customtext(
          text: "Contacts",
          fontsize: 18,
          context: context,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            UiHelper.customtextField(
              controller: searchController,
              text: "Search",
              textinputtype: TextInputType.name,
              context: context,
              icondata: Icons.search,
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ListTile(
                      leading: UiHelper.customimage(
                        imgurl: arrContacts[index]["img"].toString(),
                      ),
                      title: UiHelper.customtext(
                        text: arrContacts[index]["name"].toString(),
                        fontsize: 14,
                        context: context,
                        fontweight: FontWeight.w600,
                      ),
                      subtitle: UiHelper.customtext(
                        text: arrContacts[index]["lastseen"].toString(),
                        fontsize: 12,
                        context: context,
                        color: Color(0XFFADB5BD),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChatScreen(
                              contactName: arrContacts[index]["name"]
                                  .toString(),
                              demoMessage:
                                  arrContacts[index]["message"]?.toString() ??
                                  "No message",
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: arrContacts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
