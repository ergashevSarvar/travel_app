import 'package:flutter/material.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/main_utils.dart';

class ProfileScreenTemplate extends StatelessWidget {
  final IconData myIcon;
  final String title;
  final String content;

  const ProfileScreenTemplate(this.myIcon, this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          verticalSpace(20),
          Icon(myIcon, color: kGrey),
          horizontalSpace(12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Text(
                title,
                style: kPoppinsMedium.copyWith(
                  color: kGrey,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
              verticalSpace(3),
              Text(
                content,
                style: kPoppinsMedium.copyWith(
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
              verticalSpace(15),
              Container(
                height: 0.7,
                width: MediaQuery.of(context).size.width!*0.76,
                decoration: BoxDecoration(color: kLightGrey),
              ),

            ],
          )
        ],
      ),
    );
  }
}
