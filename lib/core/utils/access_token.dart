import 'package:googleapis_auth/auth_io.dart';

class AccessFirebaseToken {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          {
            "type": "service_account",
            "project_id": "kinopark-kinoplexx-kz",
            "private_key_id": "754a2643723128703cfc438f7b999a99bdc574a7",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0QHh0ZusJ8HTT\n7dAyx7/d0Owmo/XfX7gpmDtpuZrexRnSZTigctG3wrx79AAAwtQ4tTrka14mYcSk\ncVdfD59cEnkhLzD1uNTeJJNoCWVPY0UWPnp8UqyUFH+08IUwZ+uxsVTPSlCCFaiF\nsB1MN8HOTKHFL9sUxCzKTLk5lyusmoiTvwI3tJ9gFxw2nfsfC1dAF/77NjJ+NSVq\nBmgukZVUODQLZ/ShGwdnTVzoU7kesNarpEP25qTC75v5G4ObUccGQlEJmPmA++lY\nPyOsaor97t4Q/GhiySF0X41paTiWVnVIYqY0fUUvM6nfK1s+oErGDTw0rDveMQB8\n5hWWfrKVAgMBAAECggEASBM9dyIOGr/VH0cJCL0ZqdsYCo1mS+bs72jpXOm0FR7Q\nJ/KElZfD5wxNrOzQsX02OeSxw1NxZrySUkTl8GOBT+ItIElL9P1u1NLgRGn5Yiiq\nH+5ksOCoFGAr/pBsWYI8WyWy6V5oWdPKOobE+EyVSOYYi44Ktr+Iv221ZONfOdk2\n1OT+/7614Iz+/BOkTAJ0kZTbzhWxBBtVnQjUQqWLjXg6mKIt4KLqJEGBbzp1ZbvL\nyYzm4qrb4ndEl932o/cL9lg4xFuNnOG+Ui+aGJ8yxrDJNSA3FXzg2BK34HSrj/9N\ni5LUmXFI8tBPpOhMqrGYCRAemfOYOXhrs4XsGuu2YwKBgQDltsJMJWbgdi6gz75r\nnrTW7N82ykcospJPE6ofvX9wAvqYObhYlwgHJeywYeyx/euDHJEKMuNX33b3wM+9\nqCmqcyL1WKLQCcPqAvSU5n4NqFEv8KGDmpKAwt5gRcjjNtvgKHgAAMKgxg18zmz8\nbRjba8HYkmqrawNP11SPZEg2xwKBgQDI4MT4fjlaFf3hbE73f/+XU2D6N+xnkIpT\nKAlmgD5za33vvtMIFy0o1XptiZfSjfiVdi/W6b94HOqAt994RJV4guJ8nyAPrmPm\n5Ffu+vndQHrwHI+B1JsMl4ECwAHOzJ0nhfMUAJb8lZDjMgbnb+uMuzSsv67hwtVA\nB+vDd+4/wwKBgB1WdAYpmLP+JAJhxd4UzN/OLMvglan69Hio+EdJemch2kNqy8J0\nt4/CJjJ4rzQkS9nY4iU9To/AeH833tBIE9ozDjnrcg/Dz4OpkPcbYOn5nzTSNK6M\nJT3QpXoCL5/lN7uvL3RApJrH8J0J+B1dCZmsb3trZ7gw2KFvzNrrYdWtAoGAHFib\ncvVc4nl3+fdurT5CsvfxF14M3hBndJSRvwUZyu/ANbSX0uxyUvDM9egUpIGkMnMb\nDRivDCQIc2F/B1mmPfs6Opu5ynyxXEOcpPyFhdMzhe6B0bBOsNgwPFMb7jKxeoJM\nauYqaDoy19yXXNFOS+2e4UGrS/BSZ1a2zj5+QEECgYEAtbcMNEHM15cfa0/dZsjm\n9VcuDpUnGrM3g0TwsKjAav0CF5LJfAxUA1+eMwsHBekFEx9UopipyUhBAnOd+oIA\niXOk1BS0bL8MuC1Ss/8Jj+ByFrgR8SI648AGVlXxiXaYi3FJQ5xFwPWx/qIIRdMP\nlf8Jv/YOdgIukNF1X/0LPcY=\n-----END PRIVATE KEY-----\n",
            "client_email":
                "firebase-adminsdk-zhjee@kinopark-kinoplexx-kz.iam.gserviceaccount.com",
            "client_id": "101577074564125838107",
            "auth_uri": "https://accounts.google.com/o/oauth2/auth",
            "token_uri": "https://oauth2.googleapis.com/token",
            "auth_provider_x509_cert_url":
                "https://www.googleapis.com/oauth2/v1/certs",
            "client_x509_cert_url":
                "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-zhjee%40kinopark-kinoplexx-kz.iam.gserviceaccount.com",
            "universe_domain": "googleapis.com"
          },
        ),
        [firebaseMessagingScope]);

    final accessToken = client.credentials.accessToken.data;

    return accessToken;
  }
}
