import 'package:get_storage/get_storage.dart';

const API_ADDRESS =
    'https://apps.masjidpro.com/api'; //TODO Change to your production api point
const API_ADDRESS_2 = 'https://api.masjidpro.com';

const API_DASHBOARD = 'https://dashboard.masjidpro.com/';

final box = GetStorage('userStorage');

final jenisUser = box.read('jenisUser');
final userId = box.read('userId');
final idMasjid = box.read('idMasjid');
final kod_masjid = box.read('kod_masjid');
final id_Daerah = box.read('id_Daerah');

const developmentMode = true;
const appDemoMode = true;

const demoIc = '';
const demoEmail = '';
const demoPhone = '';
const demoPassword = '';
