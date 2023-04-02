class User {
  int user_id;
  String user_name;
  String user_email;
  String user_password;
  /*String user_balance;
  String user_coin;
*/
  User(
    this.user_id,
    this.user_name,
    this.user_email,
    this.user_password,
    /*  this.user_balance,
    this.user_coin,
  */
  );
  Map<String, dynamic> toJson() => {
        'user_id': user_id.toString(),
        'user_name': user_name,
        'user_email': user_email,
        'user_password': user_password,
        /*    'user_balance': user_balance,
        'user_coin': user_coin,*/
      };
}
