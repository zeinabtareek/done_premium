
import 'package:dio/dio.dart';

import '../../../constants/api_endpoints.dart';
import '../../../helper/dio_helper.dart';
import '../models/branches_addresses_model.dart';

class BranchesAddressesService {
  static Future<BranchesAddresses?> getBranchesAddresses() async {
    Response? response;
    try {
      response =
          await DioHelper.getData(url: endpoint[Endpoint.getBranchesAddresses]);
      print(BranchesAddresses.fromJson(response.data));
      return BranchesAddresses.fromJson(response.data);
    } on DioError catch (e) {
      print(e.message);
    }
  }




}
