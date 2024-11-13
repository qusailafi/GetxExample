import 'package:apps/domain/models/general_response.dart';
import 'package:apps/utils/api_states.dart';
import 'package:apps/utils/utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

class NetWorkCalls {
  Future<GeneralResponse> getApi(String apiName) async {
    GeneralResponse generalResponse =
        GeneralResponse(apiState: ApiState.NOT_INTERNET, message: "", data: "");
    dynamic jsonResponse = null;
    try {
      var connectivityResult = await (Connectivity().checkConnectivity());

      if (connectivityResult[0].toString() !=
          ConnectivityResult.none.toString()) {
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
      } else {
        generalResponse.apiState = ApiState.NOT_INTERNET;

        generalResponse.message = "No Intenert Connection";
      }
    } catch (e) {
      generalResponse.apiState = ApiState.FAILUER;

      generalResponse.message = "Exception Ocurred";
    }
    return generalResponse;
  }
}
