import 'package:apollo23_app/bloc/list_messages_bloc.dart';
import 'package:apollo23_app/models/event_model.dart';
import 'package:apollo23_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventInfoScreen extends StatefulWidget {
  final EventModel eventModel;

  const EventInfoScreen({required this.eventModel, super.key});

  @override
  State<EventInfoScreen> createState() => _EventInfoScreenState();
}

class _EventInfoScreenState extends State<EventInfoScreen> {
  late ListMessagesBloc _bloc;

  _EventInfoScreenState();

  @override
  void initState() {
    _bloc = ListMessagesBloc(widget.eventModel);
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String img = 'hackweek.jpg';
    if (widget.eventModel.name == 'Oktobertech') {
      img = 'oktobertech.jpg';
    }

    Widget _sliverAppBar() {
      return SliverAppBar(
        title: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Icon(
            Icons.rocket,
            color: Colors.deepPurple,
          ),
          const SizedBox(width: 10),
          Text(
            widget.eventModel.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
        pinned: true,
        stretch: true,
        stretchTriggerOffset: 200,
        expandedHeight: 300,
        backgroundColor: const Color.fromARGB(255, 240, 240, 240),
        flexibleSpace: FlexibleSpaceBar(
          background: Hero(
            tag: 'event-hero-${widget.eventModel.id}',
            child: Image.asset(
              'assets/img/$img',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(.5),
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.image, size: 150, color: Colors.grey);
              },
            ),
          ),
        ),
      );
    }

    Widget _sliverEventInfo() {
      return SliverList(
        delegate: SliverChildListDelegate(
          [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.access_time),
                  title: Text("${widget.eventModel.startDate} até ${widget.eventModel.endDate}"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.link),
                  title: InkWell(
                      onTap: () => launchUrl(Uri.parse('https://${widget.eventModel.webSite}'),
                          mode: LaunchMode.externalApplication),
                      child: Text(widget.eventModel.webSite)),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _sliverStreamMessages(AsyncSnapshot<List<MessageModel>> snapshot) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: snapshot.data!.length,
          (context, index) {
            if (index == 0) {
              return Column(children: [
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    "Mensagens",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data![index].text),
                    ),
                  ),
                )
              ]);
            }
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Card(
                child: ListTile(
                  title: Text(snapshot.data![index].text),
                ),
              ),
            );
          },
        ),
      );
    }

    return StreamBuilder(
      stream: _bloc.listMessageStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _sliverAppBar(),
              _sliverEventInfo(),
              SliverList(
                  delegate: SliverChildListDelegate([
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(36.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              ])),
            ],
          );
        }

        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              _sliverAppBar(),
              _sliverEventInfo(),
            ],
          );
        }

        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [_sliverAppBar(), _sliverEventInfo(), _sliverStreamMessages(snapshot)],
        );
      },
    );
  }
}
