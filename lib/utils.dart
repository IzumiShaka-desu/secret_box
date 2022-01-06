String generateKey(String password) {
  var passLength = password.length;
  if (passLength < 8 && passLength > 16) throw ('password length not match');
  if (passLength.isOdd) {
    password += "#";
    passLength += 1;
  }

  // final listChar=
  String key = '';
  final frontF = password.substring((passLength ~/ 2) + 1).split('').toList();
  final backF = password.substring(0, passLength ~/ 2).split('').toList();
  var iteration = 0;
  while (key.length < 32) {
    var i = 0;
    var front =
        password.substring((passLength ~/ 2) + 1).split('').reversed.toList();

    var back =
        password.substring(0, passLength ~/ 2).split('').reversed.toList();
    if (iteration.isEven) {
      back = front.reversed.toList();
      front = back.reversed.toList();
    }
    for (i; i < front.length; i++) {
      if (key.length == 32) break;
      key += front[i] + back[i];
    }
    iteration++;
  }

  return key;
}
