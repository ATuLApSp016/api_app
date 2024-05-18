import 'dart:convert';

import 'package:api_app/first%20day%20api/class/models/data_model.dart';
import 'package:api_app/first%20day%20api/class/models/quote_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? mQuotes;
  @override
  void initState() {
    super.initState();
    _buildQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
      ),
      body: mQuotes != null
          ? mQuotes!.quotes!.isNotEmpty
              ? ListView.builder(
                  itemCount: mQuotes!.quotes!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      child: ListTile(
                        leading: Text('${mQuotes!.quotes![index].id}'),
                        title: Text('${mQuotes!.quotes![index].quote}'),
                        subtitle: Text('${mQuotes!.quotes![index].author}'),
                      ),
                    );
                  })
              : const Center(
                  child: Text('No Quotes found!!'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  _buildQuotes() async {
    String url = 'https://dummyjson.com/quotes';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);

      mQuotes = DataModel.fromJson(rawData);

      setState(() {});
    }
  }
}
