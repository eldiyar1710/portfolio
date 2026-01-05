import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    delegate,
  ];
  static const supportedLocales = [
    Locale('ru'),
    Locale('en'),
    Locale('kk'),
  ];

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'headline_title': 'My Personal Portfolio',
      'subtitle_flutter': 'Flutter ',
      'subtitle_developer': 'Developer ',
      'download_cv': 'Download CV',
      'nav_home': 'Home',
      'nav_about': 'About us',
      'nav_projects': 'Projects',
      'description':
          'Flutter developer from Astana. I build commercial apps on Flutter + Firebase. Full cycle: analysis, design, development, publishing.',
      'contact': 'Contact',
      'email': 'Email',
      'github': 'GitHub',
      'skills': 'Skills',
      'latest': 'Latest',
      'read_more': 'Read More >>',
      'check_github': 'Check on Github',
      'knowledge_title': 'Knowledge',
      'knowledge_1': 'Flutter, Dart, Firebase',
      'knowledge_2': 'Android, iOS, Responsive UI',
      'knowledge_3': 'Git, GitHub, CI/CD',
      'knowledge_4': 'SQL, MySQL, PostgreSQL',
      'knowledge_5': 'Kazakh, Russian, English',
      'experience_title': 'Experience',
      'experience_role': 'Flutter Developer',
      'exp_p1': 'Develop commercial mobile applications on Flutter.',
      'exp_p2': 'Design architecture, write clean and maintainable code.',
      'exp_p3': 'Integrate Firebase (Auth, Firestore, Storage), REST API.',
      'exp_p4': 'Configure builds, publish to Play Market and App Store.',
      'exp_p5': 'Optimize performance, test and fix bugs.',
      'skill_flutter': 'Flutter',
      'skill_dart': 'Dart',
      'skill_firebase': 'Firebase',
      'skill_sqlite': 'Sqlite',
      'skill_responsive': 'Responsive Design',
      'skill_clean_arch': 'Clean Architecture',
      'skill_bloc': 'Bloc',
      'skill_getx': 'Getx',
      'project_1_name': 'Fintracker (commercial app)',
      'project_1_desc':
          'You can photograph receipts, record voice comments, and log income and expenses in a couple of taps. Helps organize company finances and keep the budget under control at all times.',
      'project_2_name': 'Juie Mobile (commercial app)',
      'project_2_desc':
          'Juie Mobile is the mobile version of the Juie POS terminal: sell products, add items, close shifts, accept payments — all built in.',
      'project_3_name': 'Juie Sales (commercial app)',
      'project_3_desc':
          'Juie Sales for agents: sell products easily, access training, view balance and sales history, and more.',
    },
    'ru': {
      'headline_title': 'Моё персональное портфолио',
      'subtitle_flutter': 'Flutter ',
      'subtitle_developer': 'Разработчик ',
      'download_cv': 'Скачать резюме',
      'nav_home': 'Главная',
      'nav_about': 'Обо мне',
      'nav_projects': 'Проекты',
      'description':
          'Flutter‑разработчик из Астаны. Делаю коммерческие приложения на Flutter + Firebase. Полный цикл: анализ, дизайн, разработка, публикация.',
      'contact': 'Контакт',
      'email': 'Email',
      'github': 'Github',
      'skills': 'Навыки',
      'latest': 'Последние',
      'read_more': 'Подробнее >>',
      'check_github': 'Смотреть на GitHub',
      'knowledge_title': 'Знания',
      'knowledge_1': 'Flutter, Dart, Firebase',
      'knowledge_2': 'Android, iOS, адаптивные интерфейсы',
      'knowledge_3': 'Git, GitHub, CI/CD',
      'knowledge_4': 'SQL, MySQL, PostgreSQL',
      'knowledge_5': 'Казахский, Русский, Английский',
      'experience_title': 'Опыт',
      'experience_role': 'Flutter‑разработчик',
      'exp_p1': 'Разработка коммерческих мобильных приложений на Flutter.',
      'exp_p2': 'Проектирование архитектуры, чистый и поддерживаемый код.',
      'exp_p3': 'Интеграция Firebase (Auth, Firestore, Storage), REST API.',
      'exp_p4': 'Сборки и публикация в Play Market и App Store.',
      'exp_p5': 'Оптимизация, тестирование, исправление багов.',
      'skill_flutter': 'Flutter',
      'skill_dart': 'Dart',
      'skill_firebase': 'Firebase',
      'skill_sqlite': 'Sqlite',
      'skill_responsive': 'Адаптивный дизайн',
      'skill_clean_arch': 'Чистая архитектура',
      'skill_bloc': 'Bloc',
      'skill_getx': 'Getx',
      'project_1_name': 'Fintracker (коммерческое приложение)',
      'project_1_desc':
          'Можно фотографировать чеки, записывать голосовые комментарии и фиксировать доходы и расходы в пару кликов. Помогает навести порядок в финансах компании и всегда держать бюджет под контролем.',
      'project_2_name': 'Juie Mobile (коммерческое приложение)',
      'project_2_desc':
          'Juie Mobile — мобильная версия POS‑терминала Juie: продажа товаров, добавление, закрытие смены, приём оплат — всё внутри.',
      'project_3_name': 'Juie Sales (коммерческое приложение)',
      'project_3_desc':
          'Juie Sales — приложение для агентов: продавать товары, доступ к обучению, видеть баланс и историю продаж и т.д.',
    },
    'kk': {
      'headline_title': 'Жеке портфолио',
      'subtitle_flutter': 'Flutter ',
      'subtitle_developer': 'Әзірлеуші ',
      'download_cv': 'Түйіндемені жүктеу',
      'nav_home': 'Басты бет',
      'nav_about': 'Мен туралы',
      'nav_projects': 'Жобалар',
      'description':
          'Астанадан Flutter әзірлеуші. Flutter + Firebase арқылы коммерциялық қосымшалар жасаймын. Толық цикл: талдау, дизайн, әзірлеу, жариялау.',
      'contact': 'Байланыс',
      'email': 'Email',
      'github': 'Github',
      'skills': 'Дағдылар',
      'latest': 'Соңғы',
      'read_more': 'Толығырақ >>',
      'check_github': 'GitHub-та қарау',
      'knowledge_title': 'Білімдер',
      'knowledge_1': 'Flutter, Dart, Firebase',
      'knowledge_2': 'Android, iOS, Адаптивті UI',
      'knowledge_3': 'Git, GitHub, CI/CD',
      'knowledge_4': 'SQL, MySQL, PostgreSQL',
      'knowledge_5': 'Қазақ, Орыс, Ағылшын',
      'experience_title': 'Тәжірибе',
      'experience_role': 'Flutter әзірлеуші',
      'exp_p1': 'Flutter арқылы коммерциялық мобильді қосымшалар.',
      'exp_p2': 'Архитектура жобалау, таза және қолдаулы код.',
      'exp_p3': 'Firebase (Auth, Firestore, Storage), REST API интеграциясы.',
      'exp_p4': 'Жинақтау және Play Market/ App Store-ға жариялау.',
      'exp_p5': 'Оптимизация, тестілеу, қателерді түзету.',
      'skill_flutter': 'Flutter',
      'skill_dart': 'Dart',
      'skill_firebase': 'Firebase',
      'skill_sqlite': 'Sqlite',
      'skill_responsive': 'Адаптивті дизайн',
      'skill_clean_arch': 'Таза архитектура',
      'skill_bloc': 'Bloc',
      'skill_getx': 'Getx',
      'project_1_name': 'Fintracker (коммерциялық қосымша)',
      'project_1_desc':
          'Чектерді суретке түсіруге, дауыс комментарийлерін жазуға және кірістер мен шығыстарды бірнеше рет басу арқылы тіркеуге болады. Компания қаржысын реттеуге және бюджетті әрдайым бақылауда ұстауға көмектеседі.',
      'project_2_name': 'Juie Mobile (коммерциялық қосымша)',
      'project_2_desc':
          'Juie Mobile — Juie POS терминалының мобильді нұсқасы: тауар сату, қосу, ауысымды жабу, төлем қабылдау — бәрі бар.',
      'project_3_name': 'Juie Sales (коммерциялық қосымша)',
      'project_3_desc':
          'Juie Sales — агенттерге арналған қосымша: тауар сату, оқытуға қолжетім, баланс пен сатылым тарихын көру және т.б.',
    },
  };

  String t(String key) {
    final lang = locale.languageCode;
    return _localizedValues[lang]?[key] ?? _localizedValues['en']![key]!;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) => ['en', 'ru', 'kk'].contains(locale.languageCode);
  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);
  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) => false;
}
