class AppAssets {
  static final AppAssets _instance = AppAssets._internal();
  AppAssets._internal();

  factory AppAssets() {
    return _instance;
  }

  static String home = "assets/navigationIcons/home (4).png";
  static String ticket = "assets/navigationIcons/ticket-alt.png";
  static String notification = "assets/navigationIcons/bell (2).png";
  static String profile = "assets/navigationIcons/user (4).png";
  static String busBg = "assets/home/busBg.jpg";
  static String exchange = "assets/home/exchange (1).png";
  static String calender = "assets/home/calendar-day.png";
}
