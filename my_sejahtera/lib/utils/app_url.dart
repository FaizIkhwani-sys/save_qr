import 'package:get_storage/get_storage.dart';

import 'package:masjid_pro/app/data/services/firebase_service.dart';

final box = GetStorage('userStorage');

const BASE_URL = 'https://api.masjidpro.com/';

String jenisUser = box.read('jenisUser');
String userId = box.read('userId');
String token = FirebaseService().token_update().toString().trim();
