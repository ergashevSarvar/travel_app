import 'package:flutter/material.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/profile_screen_template.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/main_utils.dart';

import 'choose_language_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  child: Container(
                    height: SizeConfig.blockSizeVertical! * 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/profile_header.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width!,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(20),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.arrow_back_sharp,
                                color: kWhite, size: 24),
                            Text(
                              "Profile",
                              style: kPoppinsMedium.copyWith(
                                  color: kWhite,
                                  fontSize:
                                      SizeConfig.blockSizeHorizontal! * 4.5),
                            ),
                            PopupMenuButton(
                              onSelected: (value) {
                                if (value == 1) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return ChooseLanguageScreen();
                                  }));
                                } else {
                                  print("${value} selected");
                                }
                              },
                              child:
                                  Icon(Icons.settings, color: kWhite, size: 24),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text("Edit"),
                                  value: 0,
                                ),
                                PopupMenuItem(
                                  child: Text("Language"),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text("Settings"),
                                  value: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      verticalSpace(20),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: kLightBlue,
                          border: Border.all(color: kWhite, width: 2),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/myImage.jpg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      verticalSpace(12),
                      Text(
                        "Sarvar Ergashev",
                        style: kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      verticalSpace(5),
                      Text(
                        "Web & Mobile Developer",
                        style: kPoppinsMedium.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 4,
                        ),
                      ),
                      verticalSpace(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "1800 ",
                                style: kPoppinsBold.copyWith(
                                    color: kWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 4.5),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " Followers",
                                    style: kPoppinsRegular.copyWith(
                                        color: kWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5),
                                  )
                                ]),
                          ),
                          horizontalSpace(20),
                          Container(
                            height: 40,
                            width: 0.7,
                            decoration: BoxDecoration(color: kWhite),
                          ),
                          horizontalSpace(20),
                          RichText(
                            text: TextSpan(
                                text: "1200 ",
                                style: kPoppinsBold.copyWith(
                                    color: kWhite,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 4.5),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: " Following",
                                    style: kPoppinsRegular.copyWith(
                                        color: kWhite,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3.5),
                                  )
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            ProfileScreenTemplate(
                Icons.email, "Email", "Sarvarergashev776@gmail.com"),
            ProfileScreenTemplate(
                Icons.phone_android, "Mobile", "+998 93 179-20-19"),
            ProfileScreenTemplate(Icons.telegram, "Telegram", "@anonymous7se"),
            ProfileScreenTemplate(Icons.telegram_sharp, "Telegram channel",
                "t.me/Portfolio_Sarvar_Ergashev"),
            ProfileScreenTemplate(
                Icons.info, "Github", "github.com/ergashevSarvar"),
            ProfileScreenTemplate(
                Icons.video_camera_front, "Youtube", "@superkayfiyat2683"),
          ],
        ),
      ),
    );
  }
}
