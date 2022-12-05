import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/main_utils.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kLighterWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeConfig.blockSizeVertical! * 50,
              child: Stack(
                children: [
                  FullScreenSlider(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(42),
                            topRight: Radius.circular(42),
                          ),
                          color: kLighterWhite),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRaius),
                              border: Border.all(color: kWhite),
                            ),
                            padding: const EdgeInsets.all(12),
                            child:
                                SvgPicture.asset("assets/arrow_back_icon.svg"),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kBorderRaius),
                              border: Border.all(color: kWhite),
                            ),
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                                "assets/bookmark_white_icon.svg"),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              transform: Matrix4.translationValues(0, -14, 0),
              child: Text(
                "Unravel mysteries \n of the Maldives",
                style: kPoppinsBold.copyWith(
                  color: kDarkBlue,
                  fontSize: SizeConfig.blockSizeHorizontal! * 7,
                ),
              ),
            ),
            Container(
              height: 54,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.blockSizeHorizontal!*2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kBorderRaius),
                border: Border.all(color: kBorderColor),
              ),
              child: Row(
                children: [
                  horizontalSpace(SizeConfig.blockSizeHorizontal! * 2.5),
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: kBlue,
                    backgroundImage:
                        AssetImage("assets/images/circle-photo1.jpg"),
                  ),
                  horizontalSpace(SizeConfig.blockSizeHorizontal! * 2.5),
                  Text(
                    "Keanu Carpent Dec 04 ● 8 min read",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kPoppinsRegular.copyWith(
                      color: kGrey,
                      fontSize: SizeConfig.blockSizeHorizontal! * 3,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "\t\t Maldives Comprising a territory spanning roughly 90,000 square kilometres (35,000 sq mi) including the sea, land area of all the islands comprises 298 square kilometres (115 sq mi), Maldives is one of the world's most geographically dispersed sovereign states and the smallest Asian country as well as one of the smallest Muslim-majority countries by land area and, with around 557,751 inhabitants, the 2nd least populous country in Asia. Malé is the capital and the most populated city, traditionally called the King's Island where the ancient royal dynasties ruled for its central location.[13] "
                "\n\n The Maldivian Archipelago is located on the Chagos–Laccadive Ridge, a vast submarine mountain range in the Indian Ocean; this also forms a terrestrial ecoregion, together with the Chagos Archipelago and Lakshadweep.[14] With an average ground-level elevation of 1.5 metres (4 ft 11 in) above sea level,[15] and a highest natural point of only 2.4 meters, it is the world's lowest-lying country. (Note that some sources state the highest point, Mount Villingili, as 5.1 meters)[15]",
                textAlign: TextAlign.justify,
                style: kPoppinsRegular.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 4,
                  color: kDarkBlue
                ),
              ),
            ),
            verticalSpace(SizeConfig.blockSizeVertical!*5)
          ],
        ),
      ),
    );
  }
}

final List<String> imageList = [
  "assets/images/maldives1.jpg",
  "assets/images/maldives2.jpg",
  "assets/images/maldives3.jpg",
];

class FullScreenSlider extends StatefulWidget {
  const FullScreenSlider({Key? key}) : super(key: key);

  @override
  State<FullScreenSlider> createState() => _FullScreenSliderState();
}

class _FullScreenSliderState extends State<FullScreenSlider> {
  int _current = 1;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              height: SizeConfig.blockSizeVertical! * 50,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              initialPage: _current),
          items: imageList
              .map(
                (item) => Center(
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                    height: SizeConfig.blockSizeVertical! * 50,
                    width: double.infinity,
                  ),
                ),
              )
              .toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 52),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList
                    .asMap()
                    .entries
                    .map((entry) => GestureDetector(
                          onTap: () {
                            _controller.animateToPage(entry.key);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            child: SvgPicture.asset(_current == entry.key
                                ? "assets/carousel_indicator_enabled.svg"
                                : "assets/carousel_indicator_disabled.svg"),
                          ),
                        ))
                    .toList()),
          ),
        ),
      ],
    );
  }
}
