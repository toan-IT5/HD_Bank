class ApiHelper {
  Map<String, String>? getHeaders() {
    Map<String, String> headers = {};
    headers["Content-type"] = 'application/json';
    headers["Accept"] = 'application/json';
    headers["x-api-key"] = "hutech_hackathon@123456";
    headers["access-token"] =
        "eyJraWQiOiJXcDRGMndiQVpMa1d2WWgyNDhnYjNtUHBLRzZTdDRNcG85Tmc3U2diZ2E0PSIsImFsZyI6IlJTMjU2In0.eyJzdWIiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiaXNzIjoiaHR0cHM6XC9cL2NvZ25pdG8taWRwLmFwLXNvdXRoZWFzdC0xLmFtYXpvbmF3cy5jb21cL2FwLXNvdXRoZWFzdC0xX1FiMVE4VFBzVSIsImNvZ25pdG86dXNlcm5hbWUiOiI2YjcwNDdmOS04NjY2LTRmZWMtYWFkNS0yNzVkOTgyNTVmNGIiLCJvcmlnaW5fanRpIjoiNWI5MDU5ZWItZGQ1Mi00ZjgzLWJiMWUtYzI1ZmNlMjY1ZDJiIiwiYXVkIjoic2lrY25laTR0MmgzbnRrcWo1ZDQ5bHR2ciIsImV2ZW50X2lkIjoiZTcyNGU2YTEtMTUyMi00ZThmLTg1NmMtNWVlMDM0M2FjMjVjIiwidG9rZW5fdXNlIjoiaWQiLCJhdXRoX3RpbWUiOjE2NjkyNTU4NDAsIm5hbWUiOiJ0b2FuaXQiLCJleHAiOjE2Njk2MTUwOTYsImlhdCI6MTY2OTUyODY5NiwianRpIjoiOWFkMzM5OTUtZWMxMy00M2MwLTkyNWYtMDBkYzgxOWQ2YzZjIiwiZW1haWwiOiJpdC52YW50b2FuQGdtYWlsLmNvbSJ9.GrFpsbcs7utqAblhMz8jx9LLpm7AEgqbv-eX_95jhv-edxEespXiQZl_yE75vrpRdUa0MVuT1yHS08xyU1aORPT50IEKmuk4T6V2TG5rXCG0NsJli8epR8048dZlfnYccfl7EfJnujV8_gDQjjTCNqvNLvRhtIpDuYI_XFL0IzkbA4Ny2F5GYHQwHCl8oKo7aWYRruTl0xjfzabN4i8ykuUUWWFmGGD3OxNz5BbyBarkKJAL6aP6B_T4-pIIDBGrR_EnIh3k8ovoHp7kjsBhX3S_-_YrZaH2Z-DBgYoma_7QXao-B-zlPAUdsEliojKyZ7A4vr1pBAFDZAMJ9j0VQg";
    return headers;
  }
}

class Enpoints {
  static const String login = "/login";
  static const String getKey = "/get_key";
  static const String register = "/register";
  static const String changePassword = "/change_password";
}
