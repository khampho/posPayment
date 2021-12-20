import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiurl/api.dart';

/////////////profile data
final boxx = GetStorage();
Dio dio = Dio();
getToken() async {
  String token = await boxx.read('token');
  return token;
}
Future<dynamic> getProfile() async {
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(apiBaseUrl + "/api/me");
    //print(response.data['data']);
    final data = response.data['data'];
    // var profile = _Profile(
    //     data['code'],
    //     data['first_name'],
    //     data['last_name'],
    //     data['mobile'],
    //     data['address'],
    //     data['role_id']['name_la'],
    //     data['market_id']['code'],
    //     data['market_id']['name'],
    //     data['market_id']['logo'],
    //     data['market_id']['telephone']);
    //print(data);
    return data;
  } catch (e) {
    //print(e);
    //return _Profile("", "", "", "", "", "", "", "", "", "");
    return e;
  }
}

profile() async {
  var data = await getProfile();
  await boxx.write('user', data);

}

// class _Profile {
//   String id = "";
//   String fname = "";
//   String lname = "";
//   String mobile = "";
//   String address = "";
//   String role_name = "";
//   String m_code = "";
//   String m_name = "";
//   String m_logo = "";
//   String m_phone = "";
//   _Profile(this.id, this.fname, this.lname, this.mobile, this.address,
//       this.role_name, this.m_code, this.m_name, this.m_logo, this.m_phone);
// }
