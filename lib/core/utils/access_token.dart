import 'package:googleapis_auth/auth_io.dart';

class AccessFirebaseToken {
  static String firebaseMessagingScope =
      "https://www.googleapis.com/auth/firebase.messaging";

  Future<String> getAccessToken() async {
    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson(
          {
            "type": "service_account",
            "project_id": "kz-kinopark-kinpolexx",
            "private_key_id": "7a18ea2d70658a2bfb3ca0bb0b530c242df08b67",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDnVyBWj/ltOfxt\n9cyytbWYV/2K21q7lnt9V8rtrB0BqXrTCg32dy89kdW6n41RxreJa2WFjJcBHGiQ\nbQtu1asY7hWCMJKM1ySdfhW2n9h33J+FBKKcEPkqHz4Pdq54epn10gX0ctDuGC8B\nsl5k6wpcv7I+V6KMSv0Z/Gk2sdwVBhYYEKsFHsCoMaK0igThZR2UrzBiDeJ8AFuC\npYmtiNoGDKFof7PF8H6lVQkJ/IVq82mUzqxYPkKL0RpOy6lr3pf7As5YaFvPzdMI\n1e11ZPGwWn7DdAjRTO71B4AEzegE4naslHyqySjtvHLf5J6S8PkxAUcxZQwnTZ//\nwFL4h1TvAgMBAAECggEAHkG3cYrgEQiZ+tnAnYkFiLjNaOlamxlJ6nFekapGmu6L\nKWnxvJAHBjL6NK/kgFMQszDwNMDYCSWpiWYxrhvVBmwxNPdcW35SBCU2+s06NycM\nWA3spKPVqswuRkB7/jbuxwdijv+rUtCn6T1meiWBk/LggaXdlSLDqq/oJOarRbZn\n6WTA3v3ztrh6TtYvXjZX9CcsIoeUzfIfTmvRvX1bxedKmh31EONm4BRLuUaLQuQo\ncMMbU1Kx9Ma6NDUBCDXMfblfRBsYNKKgflb711p9BL9ZAfu2vSesZG88eSHC2drN\nNBjID1cgr+tvbgTEgjpaWjCDQw6Ck89FIQhthG9bfQKBgQD1U9+9/WCKICQGVdgP\naNm3O1vJ1tS+4SAlPqifZ3QzdnhdoZKwUJxBOtwnBah4g1BCeBjUXsI2M2I3TsN6\ngfACM+ii/JQ4XJsAYS3y16CBmdhR7h2Q3s3imJuPWHxsDb4nyRyusqIKrfaz8hcY\nn3IPrZpXsE/ghz3JHRhuzFyvQwKBgQDxZ3sXW8ra9LOT4OIRS2UmoQgCVgJ9DdlK\nVaKfxxXxJPgUAioCnJq3ftYDIvprkYFGPD9zV30OKwuvne30EhADtyC13WiFPZ+I\nZJ8l5cfFktEHn/W5fjbI+qo+hhy19mfRx/n1LikeTrO2A+IV4Kd35nFzMrhTnyuh\nxhoRsWta5QKBgQCVkqamelYiwMfWCP6rHn0nBwzGebHKEw37R0GdtoCVY9StGXaL\nAwrRhmZ1cDCwETec3wYcbQ2x6BAosl/iUFiZrzZWMPLZjjR+vcE6/xaADeFiym/C\nROV4Ex08/3EUnChkr2xKYuUC59+zBJXqUERFpM2mSvvYY/xaot+jpfuYawKBgQDk\nYwWWlNZ3jnjzGBhpSk5ZXJJKO3tBOr/vztL7nQvKSDKYI3ABZo4NumbZMtd+u3t1\nqnxRMF108Q6uSJkeh5Q1H6VHykAfhqyPCrtyzFDTQFKYhyKgKqPEQzqbyqARGx0f\n4LU/3Ds0nDrzofrcvd1S12dQGJVBL97Ev7pcMOGjbQKBgFMSAqprvvRxEhc99lIU\nUJFWauSgT+7R17+CRJGTUJIFBSWuHtiDRw5NNjThQhxq0t0Y9s68nfmb9h9KFRSN\nxtyE2jWy6OkAeQKSPuU8POFgQHU2uHKTUyR8wlZINBkMZHsAPgTk7LL6NC33lS/e\nbxyj9IEEpQen6HCD6T3wITHa\n-----END PRIVATE KEY-----\n",
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
          },
        ),
        [firebaseMessagingScope]);

    final accessToken = client.credentials.accessToken.data;

    return accessToken;
  }
}
