import 'package:avo/presentation/pages/home/core/models/story_model.dart';

class StoryDataDraft {
  static List<StoryModel> storyDataDraft = [
    // 1. Hikaye Grubu: Moda ve Stil
    StoryModel(
      createdAt: DateTime.now().toIso8601String(),
      image: 'https://picsum.photos/700/800?random=1',
      items: [
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=1',
          title: 'Весенний гардероб: Главные тренды 2025',
          subtitle:
              'От пастельных оттенков до смелых принтов. Показываем, что будет в моде в этом сезоне и как это носить.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=2',
          title: 'Секреты идеального образа',
          subtitle:
              'Как сочетать аксессуары и одежду, чтобы выглядеть стильно без лишних усилий. Советы от ведущих стилистов.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=3',
        ), // Başlıksız hikaye
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=4',
          title: 'Обувь сезона: Что выбрать?',
          subtitle:
              'Классические лоферы, яркие кеды или удобные балетки? Собрали гид по самой актуальной обуви на каждый день.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=5',
        ), // Başlıksız hikaye
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=6',
          title: 'Капсула для офиса',
          subtitle:
              'Всего 10 вещей, из которых можно составить десятки комбинаций для рабочих будней. Экономим время и бюджет!',
        ),
      ],
    ),
    // 2. Hikaye Grubu: Seyahat
    StoryModel(
      createdAt: DateTime.now().toIso8601String(),
      image: 'https://picsum.photos/700/800?random=2',
      items: [
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=7',
          title: 'Неизведанная Европа: 5 мест для отпуска',
          subtitle:
              'Забудьте о Париже и Риме. Мы нашли живописные уголки, где можно отдохнуть без толп туристов.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=8',
          title: 'Восхождение на вулкан: Путешествие на Камчатку',
          subtitle:
              'Дым гейзеров, марсианские пейзажи и невероятная природа. Наш фотоотчет о поездке на край света.',
        ),
      ],
    ),
    // 3. Hikaye Grubu: Yemek ve Tarifler
    StoryModel(
      createdAt: DateTime.now().toIso8601String(),
      image: 'https://picsum.photos/900/1200?random=3',
      items: [
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=9',
          title: 'Простые рецепты для ужина на двоих',
          subtitle:
              'Впечатлите свою вторую половинку изысканным, но быстрым ужином. Пошаговые инструкции, которые получатся у каждого.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=10',
          title: 'Гастро-тур по Стамбулу: Что попробовать?',
          subtitle:
              'От уличной еды до ресторанов с вековой историей. Наш гид по самым вкусным местам города.',
        ),
      ],
    ),
    // 4. Hikaye Grubu: Hobi ve Doğa
    StoryModel(
      createdAt: DateTime.now().toIso8601String(),
      image: 'https://picsum.photos/900/1200?random=4',
      items: [
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=11',
          title: 'Городские джунгли: Как выбрать растение для дома',
          subtitle:
              'Создайте уютный зеленый уголок у себя в квартире. Рассказываем о неприхотливых растениях для начинающих.',
        ),
        StoryItems(
          image: 'https://picsum.photos/600/1800?random=12',
          title: 'Звездное небо: Астрофотография для новичков',
          subtitle:
              'Какое оборудование нужно и как сделать свой первый впечатляющий снимок Млечного Пути. Все секреты в одной статье.',
        ),
      ],
    ),
  ];
}
