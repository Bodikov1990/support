import 'package:googleapis_auth/auth_io.dart';

class AccessFirebaseToken {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "kz-kinopark-kinpolexx",
          "private_key_id": "3cb7a859204073291ed9e209f218901aba0aee0f",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDEfv9xRV5RF4Xl\nHd0G04bBKs9I8M0VHIhAgTsnoKeo3HTb3CqJXqgJT2yFlYVl8CHhocLCqMXH4txQ\nR2p5eZH5vhIkh9i5pVJSafpW4SkcDWfEWtu2ailFEFpUG3R2JKYZRxylz9113p8a\nHsHq6C+2ruC8X+C1SLS3rCZohwf8uiPdyLzmr4cRh3PoYTuRfAo/7Yj7PDAeogMt\nGSQpeuJNE425a2WCihG8MfvtYru2Kwt8L0IJmdyTFAcECfJJZzmRH1NTFMAOBNBz\nK4Cy/8tk5vRr1iXLIrxoBJBmNGAaOknQSyf8wX6JXceiCVs2T9pkcuQSjz0+Ncys\n0mY/0bG1AgMBAAECggEABiV61A45bwvvUkVm3onLU0uFhGCT6a8ky+++6/Roii2r\nMh1m7zkYxIHJgTw2GgQy6x3mO7SPyzrbbV9ugzI8ULWTV7UwIE59jrpl7EXKxWfd\n8RRufvw/Ijvqt2rMb82hrHS+/qjL4p3+GBESO8jbhTlfKkVNgB4wGPa3lNl0dIFH\n8r5UEFLVRynSy6QzFa8LGGN7Ur4aCR3bVRKifaz9lVZ+TP/E42XvITi8385NNPqL\ndkJdviC/hotelerOL5xQelgp96BxGwvllUNXVUROc3tNB9QQZyUZKwRXcl92xqko\nhjMu1TJaHRqrIFMyCO5a46z5mgHLN9Q2km/53PoZAQKBgQDIOYYDCCVKNBdoqpHO\n58SzQT+D80PNkmP/DvK+iScSFW3v9kK2WmTtW6j+MhK/Kqv8rg9NIc6V118oRUxz\n6WTzlL0p0U9vBb9v/PqE+PIfMnMvqCsI+QbUKYel+shiJP1fRbdgj2scp5PbPPEe\nuzbpdYvaxFHcCuTWIl2znjKIlQKBgQD7O5QLtTfeNTba2whHNs/36KERfa1cZsrS\njMvKPT0tlcuf0uKETYF8ZYv56t54g4j+OIraHq3ZLbu43wjoODw0q6HPnvDusTsO\n5XeW/8fGspuqZh94VItCZEMqBKiKDjjFqFW15ZJo8Wz8QVbhTdfG+Gj/8Sf/V9oH\ncWlr1NOcoQKBgQCBdvB4NWQnPteEDgaJysMdRStUno9Q9T9DRN8g5H4m60RSzOEG\nGBz6fTIgazBD+8uJbuLl9N4ndUNKPsTYjimAdsR5raW3G/hU6TbzlCS6l1xzjEGH\nY75OoSvc3vOCwngyilmwTgvsU07/i8A9JsCy5BayNg7YQRMGguIjqj7yoQKBgQCN\nuvKuGDHIXeTwWpi09CsnBEm5gFkIw8SwO1XMZffZe6RAKcw4LzFZaEArYWDYQ/xI\nzsUmgCA7YR2CEfEIcJEmdZz3cAcj4UAcC0AII4wkgCZpXutqCuf1MHLjhXU/TP6i\nI3EXCMgsA+cj+Ah3Wl7clM9HdFjIKFuLz2NVvd8TgQKBgQCl5nImFgZXIp5JEs6H\nClZoCD0b89Zw60CQKl+KAIWGorXkFAhjgNIXUxm3eMdDvXo1X+JBIBXYqO9TD6iq\nsT013wTvym9Yh6keSn60CYeGuflGXxDshbxWIKHya0rXnIDh3pn62Z4ZFTeRLElF\nB8sPuBa3RO0Dg5tABWv6KEgqlA==\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-2lacj@kz-kinopark-kinpolexx.iam.gserviceaccount.com",
          "client_id": "115076656074636304946",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-2lacj%40kz-kinopark-kinpolexx.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [firebaseMessagingScope]);

    final accessToken = client.credentials.accessToken.data;

    return accessToken;
  }
}
