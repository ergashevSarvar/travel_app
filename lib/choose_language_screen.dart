import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:travel_app/app_style.dart';
import 'package:travel_app/size_config.dart';
import 'package:travel_app/utils/main_utils.dart';
import 'dart:convert';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({Key? key}) : super(key: key);

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  List<String> flagUrl = [
    "https://flagcdn.com/256x192/us.png",
    "https://flagcdn.com/256x192/ru.png",
    "https://flagcdn.com/256x192/uz.png",
    "https://flagcdn.com/256x192/uz.png"
  ];
  List<String> flagTitle = [
    "English",
    "Русский язык",
    "O'zbek tili",
    "Узбек тили"
  ];
  List<String> ChooseLang = [
    "Choose the language",
    "Выберите язык",
    "Kerakli tilni tanlang",
    "Керакли тилни танланг"
  ];
  List<String> FindLang = [
    "Find a language",
    "Поиск язык",
    "Kerakli tilni qidiring",
    "Керакли тилни кидиринг"
  ];
  String lang = "en";
  String SelectLang = "Choose the language";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                      size: 24,
                      color: kDarkBlue,
                    )),
              ),
              verticalSpace(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  lang == "en"
                      ? ChooseLang[0]
                      : (lang == "ru"
                          ? ChooseLang[1]
                          : (lang == "oz" ? ChooseLang[2] : ChooseLang[3])),
                  style: kPoppinsBold.copyWith(
                      fontSize: SizeConfig.blockSizeHorizontal! * 7),
                ),
              ),
              verticalSpace(20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: kPoppinsRegular.copyWith(
                      color: kBlue,
                      fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 13),
                    border: kBorder,
                    errorBorder: kBorder,
                    disabledBorder: kBorder,
                    focusedBorder: kBorder,
                    focusedErrorBorder: kBorder,
                    hintText: lang == "en"
                        ? FindLang[0]
                        : (lang == "ru"
                        ? FindLang[1]
                        : (lang == "oz" ? FindLang[2] : FindLang[3])),
                    hintStyle: kPoppinsRegular.copyWith(
                        color: kLightGrey,
                        fontSize: SizeConfig.blockSizeHorizontal! * 4),
                  ),
                ),
              ),
              verticalSpace(30),
              ListView.builder(
                  itemCount: flagUrl.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                           setState(() {
                           lang = "en";
                          });
                        } else if (index == 1) {
                          setState(() {
                            lang = "ru";
                          });
                        } else if (index == 2) {
                          setState(() {
                            lang = "oz";
                          });
                        } else {
                          setState(() {
                            lang = "uz";
                          });
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width!,
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            horizontalSpace(20),
                            Container(
                              height: 35,
                              width: 45,
                              padding: EdgeInsets.all(20),
                              margin: EdgeInsets.only(bottom: 15, top: 15),
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                image: DecorationImage(
                                  image: NetworkImage(flagUrl[index]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(9),
                              ),
                            ),
                            horizontalSpace(20),
                            Text(
                              flagTitle[index],
                              style: kPoppinsRegular.copyWith(
                                fontSize: SizeConfig.blockSizeHorizontal! * 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    ));
  }
}
