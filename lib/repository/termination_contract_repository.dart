import 'package:dio/dio.dart';
import 'package:wavy/service/getit/service_locator.dart';
import 'package:wavy/service/termination_contract_api.dart';

class TerminationContractRepository {

  final TerminationContractApi _terminationContractApi;
  TerminationContractRepository() : _terminationContractApi = ServiceLocator.locator.get<TerminationContractApi>();

  Future<Response> terminationContract(int shiftId) async {
    try {
      final response = await _terminationContractApi.terminationContract(shiftId: shiftId);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }

}
