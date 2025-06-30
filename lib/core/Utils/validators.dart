bool isValidEmail(String s) =>
    RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(s);

bool isValidPassword(String s) => s.length >= 3;
