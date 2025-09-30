// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ru = {
  "routes": {
    "home": "Главная",
    "favorites": "Избранное",
    "orders": "Заказы",
    "profile": "Профиль",
    "settings": "Настройки"
  },
  "buttons": {
    "skip": "Пропустить",
    "next": "Далее",
    "start": "Начать",
    "go_to_register": "Перейти к регистрации",
    "done": "Готово",
    "resend_code": "Отправить код снова"
  },
  "country": {
    "kyrgyzstan": "Киргизия",
    "kazakhstan": "Казахстан",
    "russia": "Россия"
  },
  "warning": {
    "please_enter_a_number": "Пожалуйста, введите номер",
    "please_enter_a_valid_number": "Пожалуйста, введите валидный номер"
  },
  "forms": {
    "enter_verification_code": "Введите код",
    "resend_code_in": "Код будет отправлен через",
    "enter_phone_number_for_login": "Введите номер для входа",
    "login_description": "Мы отправим код для подтверждения",
    "enter_verification_code_description": "Введите код, который мы отправили на ваш номер"
  },
  "general": {
    "or_try_through": "Или попробуйте через"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": _ru};
}
