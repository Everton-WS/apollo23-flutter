import 'package:apollo23_app/models/event_model.dart';
import 'package:flutter/material.dart';

class EventFaqScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventFaqScreen({required this.eventModel, super.key});

  @override
  State<EventFaqScreen> createState() => _EventFaqScreenState();
}

class _EventFaqScreenState extends State<EventFaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Icon(
              Icons.rocket,
              color: Colors.deepPurple,
            ),
            SizedBox(width: 10),
            Text('FAQ')
          ]),
        ),
        body: ListView(
          children: const [
            Card(
              child: ExpansionTile(
                title: Text('Onde posso me hospedar?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Existem várias opções de hospedagem disponíveis nas proximidades do local do evento. Recomendamos verificar hotéis e pousadas na região para encontrar a acomodação que melhor atenda às suas necessidades. Além disso, alguns participantes optam por alugar apartamentos ou quartos em serviços de hospedagem compartilhada.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text('Quais restaurantes o evento recomenda?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'A área ao redor do evento oferece uma variedade de restaurantes que atendem a diversos gostos. Você pode experimentar a culinária local em restaurantes tradicionais ou explorar opções internacionais. Além disso, o evento terá uma área de alimentação com diversas opções de comida e lanches para os participantes.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('O evento possui estacionamento?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Sim, o evento conta com estacionamento no local. Haverá áreas de estacionamento disponíveis para os participantes, tornando mais conveniente para todos os que desejam comparecer.')),
                ],
              ),
            ),
            Card(
              child: ExpansionTile(
                title: Text('Como faço para ganhar ponto?'),
                children: <Widget>[
                  ListTile(
                      title: Text(
                          'Durante o evento, você terá a oportunidade de ganhar pontos de maneira interativa. Em várias palestras e atividades, os participantes terão acesso a QR codes exclusivos. Ao ler esses códigos com seus smartphones, você acumulará pontos em sua conta. Esses pontos refletem sua participação ativa e engajamento nas palestras e sessões do evento. Quanto mais QR codes você ler, mais pontos ganhará, aumentando suas chances de obter recompensas e reconhecimento. Certifique-se de estar atento e pronto para digitalizar os QR codes ao longo do evento!')),
                ],
              ),
            )
          ],
        ));
  }
}
