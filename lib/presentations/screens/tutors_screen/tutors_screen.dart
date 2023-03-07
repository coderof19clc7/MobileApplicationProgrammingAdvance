import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutors_screen/widgets/filter_dropdown.dart';
import 'package:one_one_learn/presentations/screens/tutors_screen/widgets/tutor_card.dart';
import 'package:one_one_learn/presentations/screens/tutors_screen/widgets/upcoming_class_banner.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class TutorsScreen extends StatelessWidget {
  const TutorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nationalityCodes = [
      'VN', 'DE', 'US', 'GB', 'FR', 'IT', 'ES', 'CA', 'AU', 'JP', 'KR', 'CN',
    ];
    final sortValues = [1, -1];
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: Dimens.getTopSafeAreaHeight(context) + 10,
            left: Dimens.getScreenWidth(context) * 0.03,
            right: Dimens.getScreenWidth(context) * 0.03,
            bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
          ),
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // nearest upcoming class countdown
              UpcomingClassBanner(
                width: Dimens.getScreenWidth(context),
                topLabel: S.current.labelUpcomingClass,
                totalTime:
                ' ${S.current.hours} ${S.current.minutes}',
                buttonLabel: S.current.lessonHistory,
                onTap: () {},
              ),

              // search and filter field
              Row(
                children: [
                  Expanded(
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
                  const EmptyProportionalSpace(width: 10),
                  PrimaryOutlineButton(
                    width: Dimens.getProportionalScreenWidth(context, 37),
                    paddingVertical: Dimens.getProportionalScreenHeight(
                      context, 12,
                    ),
                    preferGradient: false,
                    bgColor: AppColors.primaryBlue500,
                    child: Icon(
                      Icons.filter_alt_rounded,
                      color: AppColors.primaryBlue500,
                    ),
                  ),
                ],
              ),
              const EmptyProportionalSpace(height: 10),

              // category filters
              SizedBox(
                height: Dimens.getScreenHeight(context) * 0.045,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    // category filter
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Dimens.getProportionalScreenWidth(context, 10),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(S.current.all)!,
                        isSelected: index.isEven,
                        onSelected: (value) {
                          // update state
                        },
                      ),
                    );
                  },
                ),
              ),
              const EmptyProportionalSpace(height: 10),

              // nationality and sort filters
              Row(
                children: [
                  // nationality filter
                  FilterDropDown<String>(
                    value: nationalityCodes.first,
                    data: nationalityCodes,
                    selectedItemBuilder: (context) {
                      return nationalityCodes.map((code) {
                        return Text(UIHelper.getIconFromNationalityCode(code));
                      }).toList();
                    },
                    itemBuilder: (item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(
                            text: UIHelper.getIconFromNationalityCode(item),
                            children: [TextSpan(text: '  ' + item),],
                            style: TextStyle(
                              fontSize: Dimens.getProportionalScreenWidth(
                                context, 12,),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  const EmptyProportionalSpace(width: 10),

                  // sort
                  FilterDropDown<int>(
                    value: sortValues.first,
                    data: sortValues,
                    leadingIcon: const Icon(Icons.sort_rounded),
                    itemBuilder: (item) {
                      return DropdownMenuItem<int>(
                        value: item,
                        alignment: Alignment.center,
                        child: Text(
                          toBeginningOfSentenceCase(
                            item == 1
                                ? S.current.sortRatingFromHighest
                                : S.current.sortRatingFromLowest,
                          )!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: Dimens.getProportionalScreenHeight(
                              context, 14,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const EmptyProportionalSpace(height: 10),

              // tutor list
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // tutor card
                    return TutorCard(
                      nationality: UIHelper.getIconFromNationalityCode('DE'),
                      name: 'Haylee Caillier', rating: 4.5,
                      description:  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pulvinar ante...',
                      categories: const [
                        'Machine Learning', 'Deep Learning',
                        'Computer Vision', 'Data Science',
                      ],
                      isFavorite: index.isOdd ,
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
