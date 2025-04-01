import 'package:client/data/entities/title/title.dart';
import 'package:localization/localization.dart';

Title titleAll({String prefix = '', String suffix = ''}) {
  String _prefix = '';
  if (prefix != null) {
    _prefix = _prefix;
  }
  return Title(
    en: '$prefix ${'choose'.i18n()} $suffix',
    ru: '$prefix ${'choose'.i18n()} $suffix',
    tm: '$prefix ${'choose'.i18n()} $suffix',
  );
}

abstract class TitleBase {
  int get id;

  Title get title;

  bool get firstElement;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is TitleBase && other.id == id);

  @override
  int get hashCode => id.hashCode;
}
