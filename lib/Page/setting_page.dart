import 'package:BOAIAM/provider/theme_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xff37d5d6), Color(0xff36096d)]),
          ),
        ),
        title: const Text(
          "My Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Students').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("Waiting"));
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      // User card
                      BigUserCard(
                        backgroundMotifColor: Colors.purple,
                        //cardRadius: 20,
                        cardColor: Colors.red,
                        userName: " Shubham Pal", //document["Name"],
                        userMoreInfo: Column(
                          children: [
                            Text(document["email"]),
                            //Text(document[""]),
                          ],
                        ),
                        userProfilePic: AssetImage("assets/profile.jpeg"),
                        cardActionWidget: SettingsItem(
                          icons: Icons.edit,
                          iconStyle: IconStyle(
                            withBackground: true,
                            borderRadius: 50,
                            backgroundColor: Colors.yellow[600],
                          ),
                          title: "Modify",
                          subtitle: "Tap to change your data",
                          onTap: () {
                            print("OK");
                          },
                        ),
                      ),
                      SettingsGroup(
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.dark_mode_rounded,
                            iconStyle: IconStyle(
                              iconsColor: Colors.white,
                              withBackground: true,
                              backgroundColor: Colors.red,
                            ),
                            title: 'Dark mode',
                            subtitle: "Automatic",
                            trailing: Switch.adaptive(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                final provider = Provider.of<ThemeProvider>(
                                    context,
                                    listen: false);
                                provider.toggleTheme(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      SettingsGroup(
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.info_rounded,
                            iconStyle: IconStyle(
                              backgroundColor: Colors.purple,
                            ),
                            title: 'About',
                            titleStyle: TextStyle(),
                            subtitle: "Learn more about BAOIAM App",
                          ),
                        ],
                      ),
                      // You can add a settings title
                      SettingsGroup(
                        settingsGroupTitle: "Account",
                        items: [
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.exit_to_app_rounded,
                            title: "Sign Out",
                          ),
                          SettingsItem(
                            onTap: () {},
                            icons: CupertinoIcons.repeat,
                            title: "Change email",
                          ),
                          SettingsItem(
                            onTap: () {},
                            icons: Icons.delete,
                            title: "Delete account",
                            titleStyle: const TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }),
    );
  }
}
