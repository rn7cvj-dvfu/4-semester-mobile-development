/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 54 (27 per locale)
///
/// Built on 2024-05-14 at 07:23 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsFilterEn filter = _StringsFilterEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsCategoriesEn categories = _StringsCategoriesEn._(_root);
	late final _StringsTasksEn tasks = _StringsTasksEn._(_root);
}

// Path: filter
class _StringsFilterEn {
	_StringsFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get displayTasks => 'Display tasks';
	String get all => 'All';
	String get complited => 'Complited';
	String get uncomplited => 'Uncomplited';
	String get favourite => 'Favourite';
	String get orderdTasks => 'Order tasks by';
	String get orderByCreateDate => 'By creation date';
	String get orderByPriority => 'By priority';
	String get orderByName => 'By name';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get delete => 'Delete';
	String get cancel => 'Cancel';
	String get add => 'Add';
	String get edit => 'Edit';
	String get apply => 'Apply';
	String get close => 'Close';
}

// Path: categories
class _StringsCategoriesEn {
	_StringsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Categories';
	String get newCategory => 'New category';
	String get editCategory => 'Edit category';
	String get categoryName => 'Category name';
	String get categoryNameEmpty => 'Category name cannot be empty';
	String get deleteCategory => 'Delete category';
	String get configDeleteCategory => 'Delete category and all its content';
}

// Path: tasks
class _StringsTasksEn {
	_StringsTasksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fallbackTitle => 'Tasks';
	String get newTasks => 'New task';
	String get description => 'Description';
	String get title => 'Title';
	String get addTask => 'Add task';
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsFilterRu filter = _StringsFilterRu._(_root);
	@override late final _StringsTasksRu tasks = _StringsTasksRu._(_root);
	@override late final _StringsCategoriesRu categories = _StringsCategoriesRu._(_root);
	@override late final _StringsCommonRu common = _StringsCommonRu._(_root);
}

// Path: filter
class _StringsFilterRu implements _StringsFilterEn {
	_StringsFilterRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get displayTasks => 'Показать задачи';
	@override String get all => 'Все';
	@override String get complited => 'Завершенный';
	@override String get uncomplited => 'Незавершенный';
	@override String get favourite => 'Избранный';
	@override String get orderdTasks => 'Сортировать задачи';
	@override String get orderByCreateDate => 'По дате создания';
	@override String get orderByPriority => 'По приоритету';
	@override String get orderByName => 'По имени';
}

// Path: tasks
class _StringsTasksRu implements _StringsTasksEn {
	_StringsTasksRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get fallbackTitle => 'Задачи';
	@override String get newTasks => 'Новая задача';
	@override String get description => 'Описание';
	@override String get title => 'Название';
	@override String get addTask => 'Добавить задачу';
}

// Path: categories
class _StringsCategoriesRu implements _StringsCategoriesEn {
	_StringsCategoriesRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Категории';
	@override String get newCategory => 'Новая категория';
	@override String get editCategory => 'Редактировать категорию';
	@override String get categoryName => 'Название категории';
	@override String get categoryNameEmpty => 'Название категории не может быть пустым';
	@override String get deleteCategory => 'Удалить категорию';
	@override String get configDeleteCategory => 'Удалить категорию и все ее содержимое';
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
	_StringsCommonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Удалить';
	@override String get cancel => 'Отмена';
	@override String get add => 'Добавить';
	@override String get edit => 'Редактировать';
	@override String get apply => 'Применить';
	@override String get close => 'Закрыть';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'filter.displayTasks': return 'Display tasks';
			case 'filter.all': return 'All';
			case 'filter.complited': return 'Complited';
			case 'filter.uncomplited': return 'Uncomplited';
			case 'filter.favourite': return 'Favourite';
			case 'filter.orderdTasks': return 'Order tasks by';
			case 'filter.orderByCreateDate': return 'By creation date';
			case 'filter.orderByPriority': return 'By priority';
			case 'filter.orderByName': return 'By name';
			case 'common.delete': return 'Delete';
			case 'common.cancel': return 'Cancel';
			case 'common.add': return 'Add';
			case 'common.edit': return 'Edit';
			case 'common.apply': return 'Apply';
			case 'common.close': return 'Close';
			case 'categories.title': return 'Categories';
			case 'categories.newCategory': return 'New category';
			case 'categories.editCategory': return 'Edit category';
			case 'categories.categoryName': return 'Category name';
			case 'categories.categoryNameEmpty': return 'Category name cannot be empty';
			case 'categories.deleteCategory': return 'Delete category';
			case 'categories.configDeleteCategory': return 'Delete category and all its content';
			case 'tasks.fallbackTitle': return 'Tasks';
			case 'tasks.newTasks': return 'New task';
			case 'tasks.description': return 'Description';
			case 'tasks.title': return 'Title';
			case 'tasks.addTask': return 'Add task';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'filter.displayTasks': return 'Показать задачи';
			case 'filter.all': return 'Все';
			case 'filter.complited': return 'Завершенный';
			case 'filter.uncomplited': return 'Незавершенный';
			case 'filter.favourite': return 'Избранный';
			case 'filter.orderdTasks': return 'Сортировать задачи';
			case 'filter.orderByCreateDate': return 'По дате создания';
			case 'filter.orderByPriority': return 'По приоритету';
			case 'filter.orderByName': return 'По имени';
			case 'tasks.fallbackTitle': return 'Задачи';
			case 'tasks.newTasks': return 'Новая задача';
			case 'tasks.description': return 'Описание';
			case 'tasks.title': return 'Название';
			case 'tasks.addTask': return 'Добавить задачу';
			case 'categories.title': return 'Категории';
			case 'categories.newCategory': return 'Новая категория';
			case 'categories.editCategory': return 'Редактировать категорию';
			case 'categories.categoryName': return 'Название категории';
			case 'categories.categoryNameEmpty': return 'Название категории не может быть пустым';
			case 'categories.deleteCategory': return 'Удалить категорию';
			case 'categories.configDeleteCategory': return 'Удалить категорию и все ее содержимое';
			case 'common.delete': return 'Удалить';
			case 'common.cancel': return 'Отмена';
			case 'common.add': return 'Добавить';
			case 'common.edit': return 'Редактировать';
			case 'common.apply': return 'Применить';
			case 'common.close': return 'Закрыть';
			default: return null;
		}
	}
}
