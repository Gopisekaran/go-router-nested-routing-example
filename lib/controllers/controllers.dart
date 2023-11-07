import 'package:get/get.dart';

class LoginController extends GetxController {
  var loading = false.obs;
  var textValue = 'hello'.obs;
  var update1 = 1.obs;

  var dataValue = 1;
}

class SR1Controller extends MixinForControl {
  SR1Controller(super.textValue);

  @override
  void onInit() {
    print(update1.value);
    print("called sr1");
    super.onInit();
  }

  @override
  void onClose() {
    print(update1.value);
    print("called on sr1 close");
    super.onClose();
  }
}

class SR2Controller extends MixinForControl {
  SR2Controller(super.textValue);

  @override
  void onInit() {
    print(update1.value);
    print("called sr2 controller");
    super.onInit();
  }

  @override
  void onClose() {
    print(update1.value);
    print("called on close sr2 controller");
    super.onClose();
  }
}

abstract class MixinForControl extends GetxController {
  MixinForControl(this.textValue);

  var updateon = false.obs;
  var update1 = 1.obs;
  String textValue = 'hello';
}
