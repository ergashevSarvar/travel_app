import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:travel_app/utils/image_dialog.dart';
import 'package:travel_app/utils/main_utils.dart';
import 'package:travel_app/utils/video_dialog.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Profile_screen.dart';
import 'app_style.dart';
import 'news_detail_screen.dart';
import 'notification_screen.dart';
import 'size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/main.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';


Future<void> main() async {
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://3fd08067495b4005a5751ad5c9a50ca2@o4504277294645248.ingest.sentry.io/4504277296939008';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(MyApp()),
  );

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  PageController pageController = PageController();
  List<Widget> pages = [
    HomeScreen(),
    NewsDetailScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      child: Container(
                        height: SizeConfig.blockSizeVertical == null ? 200 : SizeConfig.blockSizeVertical!*25,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/profile_header.png"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: kLightBlue,
                              border: Border.all(color: kWhite, width: 2),
                              image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/myImage.jpg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          horizontalSpace(12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Sarvar Ergashev",
                                style: kPoppinsBold.copyWith(
                                  color: kWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4,
                                ),
                              ),
                              verticalSpace(5),
                              Text(
                                "Web & Mobile Developer",
                                style: kPoppinsMedium.copyWith(
                                  color: kWhite,
                                  fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: [
                      const ListTile(
                        title: Text("All Inboxes"),
                        leading: Icon(
                          Icons.all_inbox,
                          color: kGrey,
                        ),
                        trailing: Text("15"),
                        horizontalTitleGap: 0,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      ListTile(
                        title: Container(
                          height: 0.7,
                          width: 200,
                          color: Colors.black,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      const ListTile(
                        title: Text("Primary"),
                        leading: Icon(
                          Icons.email,
                          color: kGrey,
                        ),
                        trailing: Text("21"),
                        horizontalTitleGap: 0,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                        title: Text("Social"),
                        leading: Icon(
                          Icons.people,
                          color: kGrey,
                        ),
                        horizontalTitleGap: 0,
                        trailing: Container(
                          height: 30,
                          width: 70,
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRaius),
                            color: Color(0xff96B6FF),
                          ),
                          child: Text("14 new"),
                        ),
                      ),
                      ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                        title: Text("Promotions"),
                        leading: Icon(
                          Icons.discount,
                          color: kGrey,
                        ),
                        horizontalTitleGap: 0,
                        trailing: Container(
                          height: 30,
                          width: 80,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kBorderRaius),
                            color: Color(0xff7DF5BF),
                          ),
                          child: Text("99+ new"),
                        ),
                      ),
                      ListTile(
                        title: Container(
                          height: 0.7,
                          width: 200,
                          color: Colors.black,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                        "All Labels",
                        style: kPoppinsBold.copyWith(fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4),
                      )),
                      const ListTile(
                        title: Text("Standart"),
                        leading: Icon(
                          Icons.star,
                          color: kGrey,
                        ),
                        horizontalTitleGap: 0,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      const ListTile(
                        title: Text("Important"),
                        leading: Icon(
                          Icons.label_important_rounded,
                          color: kGrey,
                        ),
                        trailing: Text("1"),
                        horizontalTitleGap: 0,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                      const ListTile(
                        title: Text("Sent"),
                        leading: Icon(
                          Icons.message_rounded,
                          color: kGrey,
                        ),
                        horizontalTitleGap: 0,
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        backgroundColor: kLighterWhite,
        body: PageView(
          controller: pageController,
          children: pages,
          onPageChanged: _onItemSelected,
        ),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: kWhite,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: _selectedIndex == 0
                    ? SvgPicture.asset("assets/home_selected_icon.svg")
                    : SvgPicture.asset("assets/home_unselected_icon.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? SvgPicture.asset("assets/bookmark_selected_icon.svg")
                    : SvgPicture.asset("assets/bookmark_unselected_icon.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? SvgPicture.asset("assets/notification_selected_icon.svg")
                    : SvgPicture.asset(
                        "assets/notification_unselected_icon.svg"),
                label: ""),
            BottomNavigationBarItem(
                icon: _selectedIndex == 3
                    ? SvgPicture.asset("assets/profile_selected_icon.svg")
                    : SvgPicture.asset("assets/profile_unselected_icon.svg"),
                label: ""),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemSelected,
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tagList = [
    "Health",
    "Sport",
    "Travelling",
    "Swimming",
    "Friendship",
    "Islands",
    "Reading",
    "Booking",
    "Eating",
    "Trending"
  ];
  List<String> ListViewImageUrlList = [
    "Bali1.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];
  List<String> ListViewImageDateList = [
    "Jan 12, 2022",
    "Apr 15, 2022",
    "Jun 20, 2022",
    "Sep 16, 2022",
    "Nov 05, 2022",
    "Dec 21, 2022",
  ];
  List<String> ListViewImageTitleList = [
    "Bali - Unique, unmatched. There is no other place in this world.",
    "Bali is the only Hindu-majority province in Indonesia",
    "Bali is part of the Coral Triangle, the area with the highest biodiversity of marine species",
    "The confederation is the successor of the Bali Kingdom",
    "Bali was inhabited around 2000 BCE by Austronesian people who migrated",
    "The first known European contact with Bali is thought to have been made in 1512",
  ];
  List<String> ListViewVideoUrlList = [
    "https://www.youtube.com/watch?v=BFS9n4B_2xA&t=1s",
    "https://www.youtube.com/watch?v=LCqK7wZd2Pk",
    "https://www.youtube.com/watch?v=nLeiVZ9BDKA",
    "https://www.youtube.com/watch?v=nNu1zuT_9uI",
    "https://www.youtube.com/watch?v=i810CxN5Q6Q",
    "https://www.youtube.com/watch?v=ay-KbtIza4E",
  ];
  List<String> ViewCountList = [
    "40,999",
    "25,103",
    "10,520",
    "98,520",
    "120,103",
    "523,500"
  ];
  List<String> TitlesList = [
    "Top trending Island",
    "Top Islands",
    "Most visited Island",
    "Most vieved Island",
    "Most expensive Island",
    "Most Beautiful Island"
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20.0),
        children: [
          Row(
            children: [
              Container(
                height: 51,
                width: 51,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kBorderRaius),
                    color: kLightBlue,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/avatar3.jpg"))),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back",
                    style: kPoppinsBold.copyWith(
                        fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4,),
                  ),
                  Text(
                    "03 December, 2022",
                    style: kPoppinsRegular.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal == null ? 14 : SizeConfig.blockSizeHorizontal! * 3,),
                  ),
                ],
              )
            ],
          ),
          verticalSpace(30),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRaius),
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                      color: kDarkBlue.withOpacity(0.051),
                      offset: const Offset(0.0, 3.0),
                      blurRadius: 24.0,
                      spreadRadius: 0.0)
                ]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: kPoppinsRegular.copyWith(
                        color: kBlue,
                        fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4,),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 13),
                      hintText: "Search for article",
                      border: kBorder,
                      errorBorder: kBorder,
                      disabledBorder: kBorder,
                      focusedBorder: kBorder,
                      focusedErrorBorder: kBorder,
                      hintStyle: kPoppinsRegular.copyWith(
                          color: kLightGrey,
                          fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4,),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: kBlue,
                      borderRadius: BorderRadius.circular(kBorderRaius)),
                  child: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/search_icon.svg"),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(15),
          SizedBox(
            height: 14,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 38),
                  child: Text(
                    "#${tagList[index]}",
                    style: kPoppinsMedium.copyWith(
                        color: kGrey,
                        fontSize: SizeConfig.blockSizeHorizontal == null ? 14 : SizeConfig.blockSizeHorizontal! * 3,),
                  ),
                );
              },
            ),
          ),
          verticalSpace(30),
          SizedBox(
            height: 304,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: ListViewImageUrlList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                print(ListViewImageUrlList.length);
                return Container(
                  padding: const EdgeInsets.all(12),
                  height: 304,
                  width: 255,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRaius),
                      color: kWhite,
                      boxShadow: [
                        BoxShadow(
                            color: kDarkBlue.withOpacity(0.051),
                            offset: Offset(0.0, 3.0),
                            blurRadius: 24.0,
                            spreadRadius: 0.0),
                      ]),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) => ImageDialog(
                                  'assets/images/${ListViewImageUrlList[index]}'));
                        },
                        child: Container(
                          height: 164,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRaius),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/${ListViewImageUrlList[index]}'),
                              )),
                        ),
                      ),
                      verticalSpace(18),
                      Flexible(
                        child: Text(
                          ListViewImageTitleList[index],
                          style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal == null ? 14 : SizeConfig.blockSizeHorizontal! * 3.5),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      verticalSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 19,
                                backgroundColor: kLightBlue,
                                backgroundImage:
                                    AssetImage("assets/images/myImage.jpg"),
                              ),
                              horizontalSpace(12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sarvar Ergashev",
                                    style: kPoppinsBold.copyWith(
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal == null ? 13 : SizeConfig.blockSizeHorizontal! * 3.5),
                                  ),
                                  Text(
                                    ListViewImageDateList[index],
                                    style: kPoppinsRegular.copyWith(
                                        color: kGrey,
                                        fontSize:
                                        SizeConfig.blockSizeHorizontal == null ? 13 : SizeConfig.blockSizeHorizontal! * 3.5),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            height: 38,
                            width: 38,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(kBorderRaius),
                                color: kLightWhite),
                            child: SvgPicture.asset("assets/share_icon.svg"),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          verticalSpace(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sort for You",
                style: kPoppinsBold.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal == null ? 16 : SizeConfig.blockSizeHorizontal! * 4.5,
                ),
              ),
              Text(
                "View All",
                style: kPoppinsMedium.copyWith(
                  color: kBlue,
                  fontSize: SizeConfig.blockSizeHorizontal == null ? 14 : SizeConfig.blockSizeHorizontal! * 3
                ),
              ),
            ],
          ),
          verticalSpace(19),
          SizedBox(
            height: 100,
            child: ListView.builder(
                itemCount: ListViewVideoUrlList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(right: 20),
                    height: 100,
                    width: 208,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(kBorderRaius),
                        boxShadow: [
                          BoxShadow(
                              color: kDarkBlue.withOpacity(0.051),
                              offset: Offset(0.0, 3.0),
                              blurRadius: 24.0,
                              spreadRadius: 0.0),
                        ]),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () => showDialog(
                              context: context,
                              builder: (_) =>
                                  VideoDialog(ListViewVideoUrlList[index])),
                          child: Container(
                            width: 70,
                            height: 70,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRaius),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/${ListViewImageUrlList[index]}'),
                                  fit: BoxFit.cover),
                            ),
                            child: SvgPicture.asset("assets/play_icon.svg"),
                          ),
                        ),
                        horizontalSpace(12),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                TitlesList[index],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: kPoppinsSemiBold.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal == null ? 14 : SizeConfig.blockSizeHorizontal! * 3.5),
                              ),
                              verticalSpace(4),
                              Row(
                                children: [
                                  SvgPicture.asset("assets/eye_icon.svg"),
                                  horizontalSpace(5),
                                  Text(
                                    ViewCountList[index],
                                    style: kPoppinsMedium.copyWith(
                                        color: kGrey,
                                        fontSize:
                                            SizeConfig.blockSizeHorizontal! *
                                                3),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

