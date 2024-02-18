import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grpc_flutter_client/presentation/auth/auth_controller.dart';
import 'package:grpc_flutter_client/presentation/widgets/text_button.dart';

class AuthPage extends GetView<AuthController> {
  final _textController = TextEditingController();

  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _nameField(),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        decoration: const InputDecoration.collapsed(hintText: 'Name'),
        onChanged: controller.setButtonActive,
        controller: _textController,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _loginButton() {
    return Obx(
      () => GrpcTextButton(
        isButtonActive: controller.isButtonActive.value,
        onClick: () => controller.authenticate(_textController.value.text),
        buttonText: 'Login',
      ),
    );
  }
}
