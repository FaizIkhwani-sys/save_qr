abstract class ApiURL {
  // ACCOUNT
  // User
  static const postAuth = "/peribadi/token";
  static const postForgetPassword = "/peribadi/forgot-password";
  static const postResetPassword = "/peribadi/reset-password";
  // Admin
  static const postAuthAdmin = "/admin/token";
  static const postForgetPasswordAdmin = "/admin/forgot-password";
  static const postResetPasswordAdmin = "/admin/reset-password";

  static const patchChangePassword = "/password";

  static const getLogout = "/logout";
  static const postFirebaseTokenUpdate = "/firebase";
  static const user = "/user";
  static const peribadi = "/peribadi";
  static const approve = "/approve";
  static const reject = "/reject";

  static const password = "/password";

  static const penyakitType = "/penyakit-type";
  static const penyakit = "/penyakit";

  static const tanggungan = "/tanggungan";

  static const hubungan = "/hubungan";

  // States
  static const state = "/negeri";

  // Areas
  static const area = "/daerah";

  // MASJID
  static const masjid = "/masjid";
  static const masjidQR = "/masjid-qr";

  // ZONE
  static const zone = "/zone";

  //BANK
  static const bank = "/bank";

  // KEMATIAN
  static const kematian = "/kematian";

  // BANTUAN
  static const bantuan = "/bantuan";

  // PRAKTIKAL
  static const praktikal = "/praktikal";

  // TEMUJANJI
  static const temujanji = "/temujanji";

  // NOTIFICATION
  static const notification = "/notification";

  // Sumbangan
  static const sumbangan = "/sumbangan";

  //login api baru
  static const getLogin = "/login";
}
