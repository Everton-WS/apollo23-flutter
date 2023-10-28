import 'package:apollo23_app/models/user_model.dart';
import 'package:apollo23_app/repositories/treasury_repository.dart';
import 'package:apollo23_app/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class TreasuryResponseWidget extends StatelessWidget {
  final String qrCode;
  final VoidCallback closeScanner;

  const TreasuryResponseWidget({required this.qrCode, required this.closeScanner, super.key});

  @override
  Widget build(BuildContext context) {
    UserModel userModel = UserRepository.login2();

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

    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      content: SizedBox(
        height: 290,
        child: FutureBuilder(
          future: TreasuryRepository.sendTreasury(
            qrCode,
            userModel,
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data == 200) {
              return Center(
                child: SizedBox(
                  child: Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Image.asset('assets/img/treasury.gif'),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Tesouro coletado com sucesso!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textButton()
                  ])),
                ),
              );
            }

            if (snapshot.hasData && snapshot.data == 204) {
              return Center(
                child: SizedBox(
                  width: 100,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    const Icon(
                      Icons.error_outline_rounded,
                      size: 50,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Não existe registro para esse tesouro!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    textButton()
                  ]),
                ),
              );
            }

            if (snapshot.hasData && snapshot.data == 400) {
              return Center(
                child: SizedBox(
                  width: 100,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                    const SizedBox(
                      height: 20,
                    ),
                    textButton()
                  ]),
                ),
              );
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
