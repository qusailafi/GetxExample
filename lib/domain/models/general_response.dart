
import 'package:apps/utils/api_states.dart';

class GeneralResponse{
  String data="";
  String message="";
  ApiState apiState=ApiState.LOADING;
  GeneralResponse({required this.apiState ,this.message="",this.data=""
});

}