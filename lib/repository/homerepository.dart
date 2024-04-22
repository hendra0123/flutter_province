import 'package:flutter_apps/data/network/NetworkApiServices.dart';
import 'package:flutter_apps/model/province.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<List<Province>> fetchProvinceList() async {
    try {
      dynamic response =
          await _apiServices.getGetAPIResponse('/starter/province');

      List<Province> result = [];

      if (response['rajaongkir']['status']['code'] == 200) {
        result = (response['rajaongkir']['results'] as List)
            .map((e) => Province.fromJson(e))
            .toList();
      }
      return result;
    } catch (e) {
      throw e;
    }
  }
}
