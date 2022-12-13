class ApiHelper {
  Map<String, String>? getHeaders() {
    Map<String, String> headers = {};
    headers["Content-type"] = 'application/json';
    headers["Accept"] = 'application/json';
    headers["x-api-key"] = "hutech_hackathon@123456";
    headers["access-token"] =
        "eyJraWQiOiJXcDRGMndiQVpMa1d2WWgyNDhnYjNtUHBLRzZTdDRNcG85Tmc3U2diZ2E0PSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoZWFzdC0xLmFtYXpvbmF3cy5jb21cL2FwLXNvdXRoZWFzdC0xX1FiMVE4VFBzVSIsImNvZ25pdG86dXNlcm5hbWUiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJvcmlnaW5fanRpIjoiNWI5MDU5ZWItZGQ1Mi00ZjgzLWJiMWUtYzI1ZmNlMjY1ZDJiIiwiYXVkIjoic2lrY25laTR0MmgzbnRrcWo1ZDQ5bHR2ciIsImV2ZW50X2lkIjoiZTcyNGU2YTEtMTUyMi00ZThmLTg1NmMtNWVlMDM0M2FjMjVjIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE2NjkyNTU4NDAsIm5hbWUiOiJ0b2FuaXQiLCJleHAiOjE2NzEwMzgyNDMsImlhdCI6MTY3MDk1MTg0MywianRpIjoiZTVjNTk0MWYtNTU3My00ZWEyLWJhZDItMzI1ODQ3M2Y5NWQ0IiwiZW1haWwiOiJpdC52YW50b2FuQGdtYWlsLmNvbSJ9.pDas40rl74uFlmW0YNLE7DthhYFPS6RwyuF_AqMtWRoY7ylE7Ccu8n2U4fVQ1l5H06G5EmXtOEGH5n_-cFvQra2FAqs8BD0x12IOUJArX5Kg8pK9c8EbpHCCslafDYfkNokOh5XxYKGRjxpFINJu46rgK9nKg_JLnECZBVaOay09oYUzSNsVEuJEZ0c6MT1RWLCBWCq0iIrfKyYM1Libtq87O71AuW7RWNDkmAaLuzEtBpwZ61V_W04C9DUSuUewvqBcJY2ad8lEp0-v9G0yS-xirCE7S4wXtzwSxhsXN6SDM1jp5IcHreyM8EiITsS3cuU8NjBdHZ0wyBaJXSy6Mg";

    return headers;
  }
}

class Enpoints {
  static const String login = "/login";
  static const String getKey = "/get_key";
  static const String register = "/register";
  static const String changePassword = "/change_password";
  static const String balance = "/balance";
}
