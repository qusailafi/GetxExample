import 'package:apps/domain/models/general_response.dart';
import 'package:apps/utils/api_states.dart';
import 'package:apps/utils/utils.dart';
import 'package:http/http.dart' as http;

class NetWorkCalls {

  Future<GeneralResponse> getApi(String apiName) async {
    GeneralResponse generalResponse = GeneralResponse();


    dynamic jsonResponse = null;
    try {
      var response = await http.get(Uri.parse(Utils.BASE_URL + apiName));

      if (response.statusCode == 200) {
        jsonResponse = response.body;
        generalResponse.apiState = ApiState.SUCESS;
        generalResponse.data = jsonResponse;

       } else {
        generalResponse.apiState = ApiState.FAILUER;

        generalResponse.data = "";
        generalResponse.message = "Api Error";
      }
    } catch (e) {
      generalResponse.apiState = ApiState.FAILUER;

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;

  }
}
