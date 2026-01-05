import 'package:e_commerce_web/features/authentication/controller/user_controller.dart';
import 'package:e_commerce_web/utils/helpers/network_manager.dart';
import 'package:get/instance_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
