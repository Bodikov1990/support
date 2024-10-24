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
            "private_key_id": "650465ac9afd653de4221e9596740aff0334e303",
            "private_key":
                "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDjcE65R1DUOdho\nwxxQ9TebWuW0vX8dcCnsIosEtr9YmV21vmiNl2vy6i/kkGdCtCiXC9fm+YNXvQrJ\noq1y7xdIUGRPl/q7rNkkqNP/x2dBRj/pDnt0fvSuN3lEi1YkxNfKjmJZ4Vw+E9dP\nE2OmRO8zlC3931mIuoWgs2pSgN+tyczDZ8Ck4N/34eeR518fGU3witVnK9lRR/+z\nG6X9HAIgwGABuaosqFR8KiUTaKj81W3mzTB0m90H/U04uMGEXjShZM9Ewy6Xw87F\n9SfguTA0JiFKHDnD5Z2Ytda6D3/xBPoV9oqeJ3XHFmt3FmApc/h+vKYf/pNSe3hB\nZl6rXo0rAgMBAAECggEABXUJ5ocwCM+UgjsAQG8J1Qfy0Anl9WpeDyTrCgNqhvEz\nHuvBLXiPJgZ5fLX8TEzvVmR52zhsbtwB2MG3ALV87QbEyWYfpYYptaf5Yj9CGn5Z\nhTmMO8jaDR4Wok7nk71HYjxVXsu5/2FRfru73d70kFvDWL6VsuKq1ybG69DczRop\nX/QGRKb3joSxI4LlV/7KSDtEiPbV6NFcm7OhvPxEPJM73S1Fjp+w+336QScNY1fn\nPqhWcw2EuR1PmwZzxrP64sd1bDyBZLhF0uWiX3sLtqtcuQ1oMu28lhS3JTUGgsWH\nb4tzKA2WIqzOJaN5nfB7YbdOYFXhYQmp/NfBOVHwQQKBgQDlZ7EOAHgR5YsG+Bo9\nOZnZFet6CZhCakM2MiuJmxNoaZMVdA5T+lC3bqlRPbinwAJRCL5/dvNKsdtJKI9Q\ncrpG/fGMum+09Oq9baOy0S80TLDK9XNOMZQQyYt+cyL71l6yeUyya+VcvNN/mq1Z\nL9CqFWmozSJjyncijOgKb1+TawKBgQD9zkIuA7B7x5MWSoNTuvxb3Ge3zA5cG3oY\nXneRlBfeCPzeY3uEcsUT8mdkDXoxhjL8isXSYd2uJz3Rin7Hu83VlWS87sjAAnb5\njIB2Q1JwMDd90rnPbyomhTS6IZ2GAmLY+okCCPMHVXvZJfmhuomdArsVeePNYJzf\nWYgBMfUdQQKBgF3Fnf0wOeRu5P6LSgZ+1iGDsUaoR2HWl/S+W0ebaTqD9UiOsRCo\nwHfKt1FrHmELvqarIVtvHxIIU6+68aIb04MTaLpytxjMCGw4NfLxSQ9izd2YqXJs\nF68pA2lD3Sf+P6VKqgxAyHe5A+ckLfnH7s6nhBIpEAaki0BHQs6JKhNTAoGASxaD\nk9N5mhVAWd7vnYz7bj313XWcZfmnFKCWJVa3/PORxEWQXG4MCkuz9PDbzt0SJo7z\n2bskd4qaimy792GDkwXgyNioQc443rmHo/Vk5VYOhMYcPNd5k+3i3JJnZSc9kU4F\nzLlTFT9gJa1LfmKOpgoRyVfHYpKLtrRpPVlHWEECgYEA38L43TfQx4FNygI3i/W4\npiH8UO4UhO7dE4wNv++kmvxyD24+ZhffhuiYkqztAsruWA/FfIJDKTvZpOewQv0C\nl/5Ld24WjO2tTrgSwsUsPI5eH3Hw9UyiDaF6Mo90UsYsS6a0TE89dinJypeM/Cgi\nRIK3AQ9iud+t/sbOXCfIEeo=\n-----END PRIVATE KEY-----\n",
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
