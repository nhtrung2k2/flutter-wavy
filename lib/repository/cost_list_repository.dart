
import 'package:dio/dio.dart';
import 'package:wavy/model/cost.dart';
import 'package:wavy/service/cost_list_api.dart';
import 'package:wavy/service/getit/service_locator.dart';

class CostListRepository {
  final CostListApi _costListApi;
  CostListRepository() : _costListApi = ServiceLocator.locator.get<CostListApi>();
  Future<Cost> fetchCost(int amountId) async {
    try {
      final costListData = await _costListApi.fetchCostList(amountId: amountId);

      return costListData;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Response> updateCostList(int amountId, Cost cost) async {
    try {
      final costListData = await _costListApi.updateCostList(amountId: amountId, cost: cost);

      return costListData;
    } catch (e) {
      throw e.toString();
    }
  }
}
