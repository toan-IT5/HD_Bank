import 'dart:convert';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'package:pointycastle/export.dart';

import 'package:hd_bank/Models/user.dart';

class BodyHelper {
  static String encrypt(String plaintext, String publicKey) {
    var pem =
        '-----BEGIN RSA PUBLIC KEY-----\n$publicKey\n-----END RSA PUBLIC KEY-----';
    var public = CryptoUtils.rsaPublicKeyFromPem(pem);

    /// Initalizing Cipher
    var cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(public));
    Uint8List output =
        cipher.process(Uint8List.fromList(utf8.encode(plaintext)));
    var base64EncodedText = base64.encode(output);
    return base64EncodedText;
  }

  static String newGuid() {
    var uuid = const Uuid();
    return uuid.v1();
  }

  static Map<String, String> getRequest() {
    Map<String, String> params = {};
    params["requestId"] = newGuid();
    params["requestTime"] = DateTime.now().toString();
    return params;
  }

  static Future<Map<String, dynamic>> getLoginParam(
      User user, String key) async {
    Map<String, dynamic> params = {};
    params["request"] = getRequest().toString();
    params["data"] = await getDataParam(user, key, false);
    return params;
  }

  static Future<Map<String, dynamic>> getDataParam(
      User user, String key, bool isRegister) async {
    Map<String, String> params = {};
    params["credential"] = encrypt(user.toJson(), key);
    params["key"] = key;
    if (isRegister) {
      params["fullName"] = user.fullname ?? "";
      params["email"] = user.email ?? "";
      params["phone"] = "'${user.phone}'";
      params["identityNumber"] = user.identityNumber;
    }
    return params;
  }

  static Future<Map<String, dynamic>> getRegisterParam(
      User user, String key) async {
    Map<String, dynamic> params = {};
    params["data"] = await getDataParam(user, key, true);
    params["request"] = getRequest().toString();
    print(params);
    return params;
  }
}
