import 'package:avo/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class CountryModel {
  final String name;
  final String flag;
  final String isoCode;
  final String dialCode;
  final String format;

  CountryModel({
    required this.name,
    required this.flag,
    required this.isoCode,
    required this.dialCode,
    required this.format,
  });
}

final List<CountryModel> countries = [
  CountryModel(
    name: LocaleKeys.country_kyrgyzstan.tr(),
    flag: "🇰🇬",
    isoCode: "KG",
    dialCode: "+996",
    format: "### ## ## ##",
  ),
  // CountryModel(
  //   name: LocaleKeys.country_turkey.tr(),
  //   flag: "🇹🇷",
  //   isoCode: "TR",
  //   dialCode: "+90",
  //   format: "### ### ## ##",
  // ),
  CountryModel(
    name: LocaleKeys.country_russia.tr(),
    flag: "🇷🇺",
    isoCode: "RU",
    dialCode: "+7",
    format: "### ### ## ##",
  ),

  // CountryModel(
  //   name: LocaleKeys.country_kazakhstan.tr(),
  //   flag: "🇰🇿",
  //   isoCode: "KZ",
  //   dialCode: "+7",
  //   format: "### ### ####",
  // ),
  // CountryModel(
  //   name: LocaleKeys.country_uzbekistan.tr(),
  //   flag: "🇺🇿",
  //   isoCode: "UZ",
  //   dialCode: "+998",
  //   format: "## ### ####",
  // ),
  // CountryModel(
  //   name: LocaleKeys.country_tajikistan.tr(),
  //   flag: "🇹🇯",
  //   isoCode: "TJ",
  //   dialCode: "+992",
  //   format: "### ### ###",
  // ),
  // CountryModel(
  //   name: LocaleKeys.country_turkmenistan.tr(),
  //   flag: "🇹🇲",
  //   isoCode: "TM",
  //   dialCode: "+993",
  //   format: "## ### ###",
  // ),
  // CountryModel(
  //   name: LocaleKeys.country_azerbaijan.tr(),
  //   flag: "🇦🇿",
  //   isoCode: "AZ",
  //   dialCode: "+994",
  //   format: "## ### ####",
  // ),
];
