import 'package:client/core/env.dart';

class MyAppUrl {
  static final storage = '${Env.apiUrl}/storage';
  static final images = '$storage/image';
  static final countryImage = '$images/country';
  static final countryImageMini = '$countryImage-mini';
  static final companyImage = '$images/company';
  static final companyImageMini = '$companyImage-mini';
}

const isDarkModeEnabledKey = 'isDarkModeEnabled';
const userIdKey = 'userId';
const accessTokenKey = 'accessToken';
const refreshTokenKey = 'refreshToken';
const phoneNumberKey = 'userPhoneNumber';
const locationsAllStorageKey = 'locationsAllParent';
const locationsParentStorageKey = 'locationsParent';
const locationsParentCurrentStorageKey = 'locationsParentCurrent';
const favoritePostsKey = 'favoritePosts';

class UploadFileTypes {
  static const countryImage = 'countryImage';
  static const companyImage = 'companyImage';
}

