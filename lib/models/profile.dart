import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pospayment/apiurl/api.dart';

/////////////profile data
final box = GetStorage();
Dio dio = Dio();
getToken() async {
  String token = await box.read('token');
  return token;
}

Future<_Profile> getProfile() async {
  try {
    String token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    Response response = await dio.get(apiBaseUrl + "/api/me");
    //print(response.data['data']);
    final data = response.data['data'];
    var profile = _Profile(
        data['code'],
        data['first_name'],
        data['last_name'],
        data['mobile'],
        data['address'],
        data['role_id']['name_la'],
        data['market_id']['code'],
        data['market_id']['name'],
        data['market_id']['logo']);
    print(profile.m_logo);
    return profile;
  } catch (e) {
    print(e);
    return _Profile("", "", "", "", "", "", "", "", "");
  }
}

profile() async {
  var data = await getProfile();
  await box.write('P_id', data.id);
  await box.write('P_fname', data.lname);
  await box.write('P_lname', data.lname);
  await box.write('P_role', data.role_name);
  await box.write('p_mobile', data.mobile);
  await box.write('P_address', data.address);
  await box.write('M_logo', data.m_logo);
  await box.write('M_name', data.m_name);
  await box.write('M_code', data.m_code);
}

class _Profile {
  String id = "";
  String fname = "";
  String lname = "";
  String mobile = "";
  String address = "";
  String role_name = "";
  String m_code = "";
  String m_name = "";
  String m_logo = "";
  _Profile(this.id, this.fname, this.lname, this.mobile, this.address,
      this.role_name, this.m_code, this.m_name, this.m_logo);
}
