class FormValidators {
  static String? validateEmail(String? value) {
    if (value == null || value == "") {
      return "E-mail inválido";
    }
  }

  static String? validatePassword(String? value) {
    if (value == null || value == "") {
      return "Senha inválida";
    } else if (value.length < 6) {
      return "A senha precisa conter pelo menos 6 caracteres";
    }
  }
}
