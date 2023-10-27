import 'package:flutter/material.dart';

typedef SearchWidgetOnSearch = void Function(String search);

class SearchWidget extends StatelessWidget {
  final SearchWidgetOnSearch onSearch;

  const SearchWidget({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pesquisa = TextEditingController();

    void submit(value) {
      if (value.trim().isNotEmpty) {
        onSearch(value);
        pesquisa.clear();
      }
    }

    return TextField(
      controller: pesquisa,
      decoration: InputDecoration(
          hintText: 'Faça uma pergunta...',
          suffixIcon: IconButton(onPressed: () => submit(pesquisa.text), icon: const Icon(Icons.save))),
      onSubmitted: (value) {
        submit(value);
      },
    );
  }
}
