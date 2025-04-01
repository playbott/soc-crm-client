abstract class StringHelper {
  const StringHelper._();

  static final RegExp _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  static bool isNullOrEmpty(String? value) => value == null || value.isEmpty;

  static bool isEmailValid(String? value) =>
      !isNullOrEmpty(value) && _emailRegExp.hasMatch(value!);
}
