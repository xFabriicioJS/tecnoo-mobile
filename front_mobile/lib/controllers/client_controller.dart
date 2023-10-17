import 'package:front_mobile/services/models/client.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  final Rx<ClientModel?> client = Rx<ClientModel?>(null);

  void setClient(ClientModel client) {
    this.client.value = client;
  }
}
