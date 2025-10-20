import 'package:auto_route/auto_route.dart';
import 'package:avo/generated/locale_keys.g.dart';
import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/profile/widgets/edit_profile_photo_widget.dart';
import 'package:avo/presentation/theme/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

@RoutePage(name: "EditProfileRoute")
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(LocaleKeys.routes_personal_data.tr()),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              padding: EdgeInsets.all(AppDimens.paddingLarge),
              margin: EdgeInsets.symmetric(vertical: AppDimens.paddingMedium),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(AppDimens.radiusLarge),
              ),
              child: Column(
                spacing: AppDimens.paddingMedium,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditProfilePhotoWidget(
                    onChanged: (value) {},
                    imageUrl: "https://picsum.photos/600/1800?random=1",
                  ),
                  _buildForm(
                    LocaleKeys.forms_full_name.tr(),
                    LocaleKeys.forms_enter_full_name.tr(),
                    theme,
                  ),
                  _buildForm(
                    LocaleKeys.forms_number.tr(),
                    LocaleKeys.forms_enter_number.tr(),
                    theme,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: AppDimens.paddingSmall,
                    children: [
                      Text(
                        LocaleKeys.forms_birth_date.tr(),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimens.paddingHorizontal,
                          vertical: AppDimens.paddingLarge + 2,
                        ),
                        decoration: BoxDecoration(
                          color: theme.inputDecorationTheme.fillColor,
                          borderRadius: BorderRadius.circular(
                            AppDimens.radiusMedium,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "29",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "Май",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "1990",
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(LocaleKeys.buttons_save.tr()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildForm(String title, String hintText, ThemeData theme) {
    return Column(
      spacing: AppDimens.paddingSmall,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodySmall?.color,
          ),
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.radiusMedium),
              borderSide: BorderSide.none,
            ),
            hintText: hintText,
          ),
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
