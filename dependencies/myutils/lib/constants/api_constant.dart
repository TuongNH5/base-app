class RequestMethod {
  static const get = 'GET';
  static const post = 'POST';
  static const delete = 'DELETE';
  static const update = 'UPDATE';
  static const download = 'DOWNLOAD';
}

class ApiStatusCode {
  static const int success = 1;
  static const int refreshToken = 7;
  static const int tokenExpired = 3;
  static const int systemError = 4;
  static const int invalidInput = 5;
  static const int businessError = 6;
  static const int notPermission = 6;
  static const int notFoundData = 8;
  static const int notCheckInAgain = 10;
  //Define local, return when fetch api throw exception
  static const int networkError = -11;
  static const int notFoundDataFilterTicket = 12;
}

class ApiConstant {
  static const token = 'token';
  static const refreshToken = 'refreshToken';
  static const authorization = 'Authorization';
  static const contentType = 'content-Type';
  static const statusCode = 'statusCode';
  static const message = 'message';
  static const data = 'data';
  static const extoken = 'extoken';
  static const isAuthed = 'isAuthed';
  static const grantType = 'grantType';
  static const userToken = 'userToken';
  static const accessToken = 'accessToken';
}

class GrantType {
  static const fptAdfs = 'fpt_adfs';
  static const accountCredentialsGrant = 'account_credentials_grant';
  static const refreshToken = 'refresh_token';
}

class ApiService {
  static const auth = '/mypt-auth-api';
  static const profile = '/mypt-profile-api';
  static const checkin = '/mypt-checkin-api';
  static const notification = '/mypt-notification-api';
  static const news_events = '/mypt-newsevent-api';
  static const setting = '/mypt-setting-api';
  static const chat = '/mypt-chat-api';
  static const job = '/mypt-job-api';
  static const punish = '/mypt-company-api';
  static const media = '/mypt-media-api';
  static const iqc = '/mypt-iqc-api';
}
