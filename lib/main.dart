import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:online_dictionary/api_key.dart';
import 'package:online_dictionary/dictionary_response.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// controller for TextField
  TextEditingController _controller;

  List<DictionaryResponse> explanations;

  String searchingWord;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> renderExplanation(
      String word, List<DictionaryResponse> explanations) {
    List<Widget> res = [];

    res.add(
      Text(
        word,
        style: Theme.of(context).textTheme.headline3,
      ),
    );

    for (var i = 0; i < explanations.length; i++) {
      res.addAll(explanations[i]
          .shortdef
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                '${explanations.length == 1 ? '' : i}${explanations.length == 1 ? '' : '.'}$e',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
          )
          .toList());
    }

    return res;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 30, 16, 0),
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Words to find',
                    ),
                    onSubmitted: (String value) async {
                      searchingWord = value;

                      print('type value $value');

                      Uri uri = Uri.https(
                          "www.dictionaryapi.com",
                          "/api/v3/references/thesaurus/json/${value}",
                          {"key": api_key});

                      Response res = await http.get(uri);

                      setState(() {
                        explanations = dictionaryResponseFromJson(res.body);
                      });

                      print(explanations);

                      _controller.clear();
                    },
                  ),
                ),
                explanations != null
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              renderExplanation(searchingWord, explanations),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
