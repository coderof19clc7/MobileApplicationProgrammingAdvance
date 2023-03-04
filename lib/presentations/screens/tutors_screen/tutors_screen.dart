import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          shadowColor: AppColors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              Dimens.getProportionalScreenHeight(context, 8),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.getScreenWidth(context) * 0.03,
              ),
              child: TextField(
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: Dimens.getProportionalScreenHeight(context, 15),
                ),
                decoration: InputDecoration(
                  hintText: S.current.searchHintTutor,
                  hintStyle: TextStyle(
                    color: AppColors.neutralBlue500,
                    fontSize: Dimens.getProportionalScreenHeight(context, 15),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ),
        ),
        backgroundColor: AppColors.white,
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getScreenWidth(context) * 0.03,
          ),
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.getProportionalScreenHeight(context, 10)),
              // category filters
              SizedBox(
                height: Dimens.getProportionalScreenHeight(context, 30),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    const temp = false;
                    // category filter
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Dimens.getProportionalScreenWidth(context, 10),
                      ),
                      child: ChoiceChip(
                        label: Text(toBeginningOfSentenceCase(S.current.all)!),
                        selected: temp,
                        onSelected: (value) {
                          // update state
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Dimens.getProportionalScreenWidth(context, 10),
                        ),
                        visualDensity: VisualDensity.compact,
                        shape: StadiumBorder(
                          side: BorderSide(color: AppColors.grey),
                        ),
                        backgroundColor: AppColors.white,
                        selectedColor: AppColors.primaryBlue400,
                        labelStyle: TextStyle(
                          color: AppColors
                              .black, // listen to state to change color
                          fontSize:
                              Dimens.getProportionalScreenHeight(context, 12),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Dimens.getProportionalScreenHeight(context, 10)),
              Row(
                children: [
                  // nationality filter
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          Dimens.getProportionalScreenWidth(context, 10),
                    ),
                    height: Dimens.getProportionalScreenHeight(context, 36),
                    width: Dimens.getProportionalScreenWidth(context, 67),
                    child: DropdownButton<String>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      isExpanded: true,
                      alignment: Alignment.center,
                      items: const [
                        DropdownMenuItem(
                          child: Text('\u{1F1E9}\u{1F1EA}'),
                        ),
                      ],
                      onChanged: (value) {},
                      underline: const SizedBox.shrink(),
                    ),
                  ),
                  SizedBox(
                      width: Dimens.getProportionalScreenWidth(context, 10)),
                  // sort
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          Dimens.getProportionalScreenWidth(context, 10),
                    ),
                    height: Dimens.getProportionalScreenHeight(context, 36),
                    child: DropdownButton<int>(
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      alignment: Alignment.center,
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            toBeginningOfSentenceCase(
                                S.current.sortRatingFromHighest)!,
                            style: TextStyle(
                              fontSize: Dimens.getProportionalScreenHeight(
                                  context, 12),
                            ),
                          ),
                        ),
                      ],
                      onChanged: (value) {},
                      underline: const SizedBox.shrink(),
                    ),
                  ),
                ],
              ),
              SizedBox(height: Dimens.getProportionalScreenHeight(context, 10)),
              // tutor list
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // tutor card
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              Dimens.getProportionalScreenHeight(context, 10)),
                      child: Container(
                        width: Dimens.getScreenWidth(context) * 0.92,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(8, 0, 0, 0),
                              blurRadius: 30,
                              offset: Offset(-2, 5),
                            )
                          ],
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal:
                              Dimens.getProportionalScreenWidth(context, 13),
                          vertical:
                              Dimens.getProportionalScreenHeight(context, 14),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // image
                            Container(
                              width: Dimens.getProportionalScreenWidth(
                                  context, 94),
                              height: Dimens.getProportionalScreenHeight(
                                  context, 94),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.neutralBlue500,
                              ),
                            ),
                            SizedBox(
                                width: Dimens.getProportionalScreenWidth(
                                    context, 10)),
                            // tutor information
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // name & favorite
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Haylee Caillier',
                                        style: TextStyle(
                                          color: AppColors.black,
                                          fontSize: Dimens
                                              .getProportionalScreenHeight(
                                                  context, 15),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Icon(
                                          Icons.favorite_outline_rounded,
                                          color: AppColors.primaryBlue400,
                                          size: Dimens
                                              .getProportionalScreenHeight(
                                                  context, 25),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Dimens.getProportionalScreenHeight(
                                              context, 10)),
                                  // categories
                                  SizedBox(
                                    height: Dimens.getProportionalScreenHeight(
                                        context, 20),
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        // category
                                        return Padding(
                                          padding: EdgeInsets.only(
                                            right: Dimens
                                                .getProportionalScreenWidth(
                                                    context, 10),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: AppColors.primaryBlue200,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: Dimens
                                                  .getProportionalScreenWidth(
                                                      context, 10),
                                              vertical: Dimens
                                                  .getProportionalScreenHeight(
                                                      context, 2),
                                            ),
                                            child: Text(
                                              'Machine Learning',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: AppColors.primaryBlue400,
                                                fontSize: Dimens
                                                    .getProportionalScreenHeight(
                                                        context, 12),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          Dimens.getProportionalScreenHeight(
                                              context, 10)),
                                  // extra information
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star_rounded,
                                        size: Dimens.getProportionalScreenWidth(
                                            context, 14),
                                        color: AppColors.primaryBlue400,
                                      ),
                                      SizedBox(
                                          width:
                                              Dimens.getProportionalScreenWidth(
                                                  context, 7)),
                                      Text(
                                        '4.5/5',
                                        style: TextStyle(
                                          color: AppColors.neutralBlue500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              Dimens.getProportionalScreenWidth(
                                                  context, 7)),
                                      Text(
                                        '|',
                                        style: TextStyle(
                                          color: AppColors.neutralBlue500,
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              Dimens.getProportionalScreenWidth(
                                                  context, 7)),
                                      Text(
                                        '23,000 favorites',
                                        style: TextStyle(
                                          color: AppColors.neutralBlue500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      height:
                                          Dimens.getProportionalScreenHeight(
                                              context, 10)),
                                  // description
                                  Text(
                                    'Lorem ipsum dolor sit amet, consectetur\nadipiscing elit. Vivamus pulvinar ante...',
                                    style: TextStyle(
                                      color: AppColors.neutralBlue500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
