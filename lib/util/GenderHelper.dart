class GenderHelper {
  static const int GENDER_FEMALE = 1;
  static const int GENDER_MALE = 2;

  static String getGenderString(int genderCode) {
    if (genderCode == GENDER_FEMALE) {
      return "Female";
    } else if (genderCode == GENDER_MALE) {
      return "Male";
    } else {
      return "Unknown";
    }
  }
}
