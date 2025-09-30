import 'package:avo/presentation/const/asset_const.dart';
import 'package:avo/presentation/pages/splash/core/models/onboarding_model.dart';

final class OnboardingData {
  static const List<OnboardingModel> onboarding = [
    OnboardingModel(
      image: AssetConst.onboarding,
      title: "Avo.App всегда выручит",
      description:
          "Приложение Avo.App — это удобный способ получать бонусы и скидки в любимых заведениях. Сканируй QR-коды, собирай баллы и обменивай их на крутые подарки!",
    ),
    OnboardingModel(
      image: AssetConst.onboarding2,
      title: "Больше, чем просто скидки",
      description:
          "Это не только выгодные цены — это персонализированные акции, бонусы за покупки и приятные сюрпризы от любимых заведений.",
    ),
    OnboardingModel(
      image: AssetConst.onboarding3,
      title: "Быстрый доступ",
      description:
          "Войдите в Avo.App за секунды — войдите через Telegram или What’sApp. Безопасно, быстро, без паролей. Копите бонусы с первого входа!",
    ),
  ];
}
