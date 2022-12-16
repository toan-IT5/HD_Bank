class ApiHelper {
  Map<String, String>? getHeaders() {
    Map<String, String> headers = {};
    headers["Content-type"] = 'application/json';
    headers["Accept"] = 'application/json';
    headers["x-api-key"] = "hutech_hackathon@123456";
    headers["access-token"] =
        "eyJraWQiOiJXcDRGMndiQVpMa1d2WWgyNDhnYjNtUHBLRzZTdDRNcG85Tmc3U2diZ2E0PSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoZWFzdC0xLmFtYXpvbmF3cy5jb21cL2FwLXNvdXRoZWFzdC0xX1FiMVE4VFBzVSIsImNvZ25pdG86dXNlcm5hbWUiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJvcmlnaW5fanRpIjoiNWI5MDU5ZWItZGQ1Mi00ZjgzLWJiMWUtYzI1ZmNlMjY1ZDJiIiwiYXVkIjoic2lrY25laTR0MmgzbnRrcWo1ZDQ5bHR2ciIsImV2ZW50X2lkIjoiZTcyNGU2YTEtMTUyMi00ZThmLTg1NmMtNWVlMDM0M2FjMjVjIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE2NjkyNTU4NDAsIm5hbWUiOiJ0b2FuaXQiLCJleHAiOjE2NzEyNDIyNDUsImlhdCI6MTY3MTE1NTg0NSwianRpIjoiMmRmYmMxMDUtMjU4Mi00NzM0LTk5ZjctNWVhZDg5NDMyMjMyIiwiZW1haWwiOiJpdC52YW50b2FuQGdtYWlsLmNvbSJ9.ck9cmeKWHjeDu7ci2gJUw8IiZO2EJXUlRJ5vyqrsm7QIVq4DaRACbY-f_EqC3T34A4J6PyBKAO677tzy4zm8EX_KhhCc1yautIY55usNFqqHR7SGWHlF8_1AcZ2qjA2QpAxGc_7565Pkjz4zWbfhsEGyOboy-2VGSP9H1hv7bEKbL0OWdcVwCwguQJ7-JNbqvppuFowxMz-r6VfJ9F3pr41LkQlGKQQk8KI_gSgMApxkMEw-9LcjK_834iJq9rAc5tvuZwUyeG9tV_3DERUXdlSkBOodVmtbRJy9m6zht3Ae6CtWdnsEDrd9XQEz4Ua9XgzV59_O97HjhsPlbfU1sw";

    return headers;
  }
}

class Enpoints {
  static const String login = "/login";
  static const String getKey = "/get_key";
  static const String register = "/register";
  static const String changePassword = "/change_password";
  static const String balance = "/balance";
  static const String transfer = "/transfer";
}
