import 'package:myutils/data/cache_helper/cache_helper.dart';
import 'package:myutils/data/cache_helper/models/gtd_account_hive.dart';
import 'package:myutils/utils/gtd_widgets/gtd_call_back.dart';
import 'package:rxdart/rxdart.dart';

class UserManager {
  UserManager._() {}
  final localeStream = BehaviorSubject<String>.seeded('vi');
  String get cachedLanguage => CacheHelper.shared.getCachedLanguage();
  String get token => CacheHelper.shared.getCachedAppToken();
  static final shared = UserManager._();
  final isLoggedInStream = BehaviorSubject<bool>.seeded(false);
  late MyCallback<String> bookingResultWebViewCallback;
  late GtdVoidCallback popToHomeCallback;

  GtdAccountHive? _currentAccount;

  GtdAccountHive? get currentAccount => _currentAccount;

  setLoggedIn(bool isLoggedIn) {
    isLoggedInStream.add(isLoggedIn);
  }

  setLocale(String locale) {
    localeStream.add(locale);
  }

  Future<void> cacheUserData(GtdAccountHive accountData) async {
    // await CacheHelper.cacheObject<GtdAccountHive>(
    //   accountData,
    //   cacheStorageType: CacheStorageType.accountBox,
    // );
    await CacheHelper.shared.saveSharedObject(accountData.toMap(), key: CacheStorageType.accountBox.name);
    await getAccountData();
  }

  Future<GtdAccountHive?> getAccountData() async {
    final account = CacheHelper.shared.loadSavedObject(GtdAccountHive.fromMap, key: CacheStorageType.accountBox.name);
    _currentAccount = account;
    if (account != null) {
      isLoggedInStream.add(true);
    }
    return _currentAccount;
  }

  Future<void> removeAccountData() async {
    CacheHelper.shared.removeCachedSharedObject(CacheStorageType.accountBox.name);
  }
}
