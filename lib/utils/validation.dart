class Validation {
  static String? validateName(String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z ]+$');
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Name';
    } else {
      return null;
    }
  }

  static String? validateAge(String? value) {
    RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Age';
    } else {
      return null;
    }
  }

  static String? validateHeight(String? value) {
    RegExp regex = RegExp(r'[+-]?([0-9]*[.])?[0-9]+');
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Height';
    } else {
      return null;
    }
  }

  static String? validateWeight(String? value) {
    RegExp regex = RegExp(r'[+-]?([0-9]*[.])?[0-9]+');
    if (!regex.hasMatch(value ?? '')) {
      return 'Enter Valid Weight';
    } else {
      return null;
    }
  }
}
