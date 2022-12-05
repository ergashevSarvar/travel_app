import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/image_dialog.dart';
import 'package:travel_app/utils/main_utils.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<String> ListViewImageUrlList = [
    "Bali1.jpg",
    "1.jpg",
    "2.jpg",
    "3.jpg",
    "4.jpg",
    "5.jpg",
  ];
  List<String> ListViewImageTitleList = [
    "Bali - Unique, unmatched. \nThere is no other...",
    "Bali is the only Hindu \nmajority province in ...",
    "Bali is part of the Coral \nTriangle, the area...",
    "The confederation is the \nsuccessor of the...",
    "Bali was inhabited \naround 2000 bce..",
    "The first known European \ncontact with Bali...",
  ];
  List<String> ListViewImageDateList = [
    "Jan 12, 2022",
    "Apr 15, 2022",
    "Jun 20, 2022",
    "Sep 16, 2022",
    "Nov 05, 2022",
    "Dec 21, 2022",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            color: kLightBlue,
                            image: const DecorationImage(
                                image: AssetImage("assets/images/avatar3.jpg")),
                            borderRadius: BorderRadius.circular(kBorderRaius)),
                      ),
                      horizontalSpace(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Elly Byers",
                            style: kPoppinsBold.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              color: kDarkBlue,
                            ),
                          ),
                          verticalSpace(2),
                          Text(
                            "Author & Writer",
                            style: kPoppinsRegular.copyWith(
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                              color: kDarkBlue,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 119,
                  height: 42,
                  decoration: BoxDecoration(
                    color: kBlue,
                    borderRadius: BorderRadius.circular(kBorderRaius),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 11),
                  child: Text(
                    "Following",
                    style: kPoppinsRegular.copyWith(color: kWhite),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          verticalSpace(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Every piece of chocolate I ever ate is getting back at me.. desserts are very revengeful..",
              style: kPoppinsRegular.copyWith(color: kGrey),
              textAlign: TextAlign.justify,
            ),
          ),
          verticalSpace(30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 27, vertical: 20),
            width: 328,
            height: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRaius),
                color: kDarkBlue),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "54.21k",
                      style: kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                    Text(
                      "Followers",
                      style: kPoppinsRegular.copyWith(color: kWhite),
                    )
                  ],
                ),
                Container(
                  height: 38,
                  width: 0.5,
                  decoration: BoxDecoration(color: kWhite),
                ),
                Column(
                  children: [
                    Text(
                      "2.11k",
                      style: kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                    Text(
                      "Posts",
                      style: kPoppinsRegular.copyWith(color: kWhite),
                    )
                  ],
                ),
                Container(
                  height: 38,
                  width: 0.4,
                  decoration: BoxDecoration(color: kWhite),
                ),
                Column(
                  children: [
                    Text(
                      "36.40k",
                      style: kPoppinsBold.copyWith(
                          color: kWhite,
                          fontSize: SizeConfig.blockSizeHorizontal! * 5),
                    ),
                    Text(
                      "Followers",
                      style: kPoppinsRegular.copyWith(color: kWhite),
                    )
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Elly's Post",
                  style: kPoppinsBold.copyWith(
                    fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                  ),
                ),
                Text(
                  "View All",
                  style: kPoppinsMedium.copyWith(
                    color: kBlue,
                    fontSize: SizeConfig.blockSizeHorizontal! * 3,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: ListViewImageUrlList.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.symmetric(horizontal: 30),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => ImageDialog(
                                'assets/images/${ListViewImageUrlList[index]}'));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.all(5),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: kWhite,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/${ListViewImageUrlList[index]}",
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(kBorderRaius)),
                      ),
                    ),
                    horizontalSpace(20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "News: Politics",
                          style: kPoppinsRegular.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            color: kGrey,
                          ),
                        ),
                        verticalSpace(7),
                        Text(
                          ListViewImageTitleList[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: kPoppinsBold.copyWith(
                            fontSize: SizeConfig.blockSizeHorizontal! * 4,
                          ),
                        ),
                        verticalSpace(7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset("assets/calendar_icon.svg",
                                    color: kGrey),
                                horizontalSpace(9),
                                Text(
                                  ListViewImageDateList[index],
                                  style: kPoppinsRegular.copyWith(
                                    color: kGrey,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                )
                              ],
                            ),
                            horizontalSpace(30),
                            Row(
                              children: [
                                SvgPicture.asset("assets/clock_icon.svg",
                                    color: kGrey),
                                horizontalSpace(9),
                                Text(
                                  "09:45 pm",
                                  style: kPoppinsRegular.copyWith(
                                    color: kGrey,
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
          verticalSpace(20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text("Popular From Elly",
                    style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 4,
                    )),
              ],
            ),
          ),
          verticalSpace(19),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ListViewImageUrlList.length,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 30),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => ImageDialog(
                              'assets/images/${ListViewImageUrlList[index]}'));
                    },
                    child: Container(
                      width: 248,
                      height: 50,
                      margin: EdgeInsets.only(right: 12),
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(kBorderRaius),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/${ListViewImageUrlList[index]}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: kDarkBlue.withOpacity(0.051),
                                offset: const Offset(0.0, 3.0),
                                blurRadius: 24.0,
                                spreadRadius: 0.0)
                          ]),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
