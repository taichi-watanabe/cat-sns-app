class Strings {
  static const String mailKey = 'mail_key';
  static const String passKey = 'pass_key';
  static const String mailLabelText = 'メールアドレス';
  static const String passLabelText = 'パスワード';
  static const String nameEmptyMessage = '氏名を入力して下さい';
  static const String mailEmptyMessage = 'メールアドレスを入力して下さい';
  static const String passEmptyMessage = 'パスワードを入力して下さい';
  static const String passNotMatchMessage = 'パスワードが一致していません';
  static const String mailValidateMessage = '正しいメールアドレスを入力してください';
  static const String mailOrPassValidateMessage = 'メールアドレスまたはパスワードが間違っています';
  static const String mailHintText = '';
  static const String passHintText = '半角英数字・記号8文字以上';
  static const String passValidateMessage = '半角英数字・記号8文字以上で入力して下さい';
  static const String mailPattern =
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
  static const String pwdPattern = r'^[!-~]{8,}$';
}
