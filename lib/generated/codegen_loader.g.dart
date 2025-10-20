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
    "settings": "Настройки",
    "personal_data": "Личные данные"
  },
  "buttons": {
    "skip": "Пропустить",
    "next": "Далее",
    "start": "Начать",
    "go_to_register": "Перейти к регистрации",
    "done": "Готово",
    "resend_code": "Отправить код снова",
    "save": "Сохранить"
  },
  "country": {
    "kyrgyzstan": "Киргизия",
    "kazakhstan": "Казахстан",
    "russia": "Россия"
  },
  "warning": {
    "please_enter_a_number": "Пожалуйста, введите номер",
    "please_enter_a_valid_number": "Пожалуйста, введите валидный номер",
    "qr_description": "Покажите QR для начисления или списания баллов и кофе",
    "scan_or_upload_qr": "Отсканируйте или загрузите QR"
  },
  "forms": {
    "enter_verification_code": "Введите код",
    "resend_code_in": "Код будет отправлен через",
    "enter_phone_number_for_login": "Введите номер для входа",
    "login_description": "Мы отправим код для подтверждения",
    "enter_verification_code_description": "Введите код, который мы отправили на ваш номер",
    "full_name": "Фио",
    "enter_full_name": "Введите ФИО",
    "number": "Номер",
    "enter_number": "Введите номер",
    "birth_date": "Дата рождения",
    "male": "Мужской",
    "female": "Женский"
  },
  "general": {
    "or_try_through": "Или попробуйте через"
  },
  "titles": {
    "orders_history": "История",
    "orders_active": "Активные заказы",
    "balance": "Баланс",
    "total_points": "{} бонусов",
    "my_qr": "Мой QR",
    "scan": "Сканировать",
    "company": "Компания",
    "products": "Продукты",
    "levels": "Уровни"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ru": _ru};
}
