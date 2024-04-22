import 'package:flutter/material.dart';
import 'package:flutter_apps/data/response/api_response.dart';
import 'package:flutter_apps/model/province.dart';
import 'package:flutter_apps/repository/homerepository.dart';

class HomeViewModel with ChangeNotifier {
  final _homeRepo = HomeRepository();
  ApiResponse<List<Province>> provinceList = ApiResponse.loading();

  setProvinceList(ApiResponse<List<Province>> response) {
    provinceList = response;
    notifyListeners();
  }

  Future<void> fetchProvinceList() async {
    setProvinceList(ApiResponse.loading());
    _homeRepo.fetchProvinceList().then((value) {
      setProvinceList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setProvinceList(ApiResponse.error(error.toString()));
    });
  }
}
