mixin ValidationsMixin {
  String? isNotEmpy(String? value, [String? message]) {
    if (value == null || value.isEmpty) {
      return message ?? 'Este campo não pode ser vazio';
    }
    return null;
  }

  String? hasFiveChars(String? value, [String? message]) {
    if (value != null && value.length < 5) {
      return message ?? 'Este campo deve ter pelo menos 5 caracteres';
    }
    return null;
  }

  String? hasSpecialCharacters(String? value, [String? message]) {
    if (value != null && !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return message ?? 'Este campo deve  conter caracteres especiais';
    }

    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }
}
