import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/treasury_repository.dart';
import 'package:apollo23_app/widgets/user_logged_inherited.dart';
import 'package:flutter/material.dart';

class TreasuryResponseWidget extends StatelessWidget {
  final String qrCode;
  final VoidCallback closeScanner;

  const TreasuryResponseWidget({required this.qrCode, required this.closeScanner, super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserLoggedWidget.of(context).userLogged!;

    Widget textButton() {
      return TextButton(
          style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(75, 75))),
          onPressed: () {
            Navigator.of(context).pop();
            closeScanner();
          },
          child: const Text(
            "OK",
            style: TextStyle(fontSize: 25),
          ));
    }

    Widget respSuccess() {
      return Center(
        child: SizedBox(
          child: Center(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Tesouro coletado com sucesso!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset('assets/img/treasury.gif', height: 100),
            textButton()
          ])),
        ),
      );
    }

    Widget respNoContent() {
      return Center(
        child: SizedBox(
          width: 100,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.error_outline_rounded,
              size: 50,
            ),
            const Text(
              'Não existe registro para esse tesouro!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            textButton()
          ]),
        ),
      );
    }

    Widget respAlreadyScanned() {
      return Center(
        child: SizedBox(
          width: 100,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            const Icon(
              Icons.add_reaction_outlined,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Você já leu este tesouro!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            textButton()
          ]),
        ),
      );
    }

    Widget respWithError(error) {
      return Center(
        child: SizedBox(
          width: 100,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(
              height: 20,
            ),
            textButton()
          ]),
        ),
      );
    }

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: 225,
        child: FutureBuilder(
          future: TreasuryRepository.sendTreasury(
            qrCode,
            userModel,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == 200) {
              return respSuccess();
            }

            if (snapshot.hasData && snapshot.data == 204) {
              return respNoContent();
            }

            if (snapshot.hasData && snapshot.data == 400) {
              return respAlreadyScanned();
            }

            if (snapshot.hasError) {
              return respWithError(snapshot.error.toString());
            }

            return const Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
