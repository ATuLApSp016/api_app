import 'dart:convert';
import 'package:api_app/first%20day%20api/practice/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? mTodos;
  bool isCompleted = false;

  @override
  void initState() {
    super.initState();
    _buildTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todos'),
          centerTitle: true,
        ),
        body: mTodos != null
            ? mTodos!.todos!.isNotEmpty
                ? ListView.builder(
                    itemCount: mTodos!.todos!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        color: isCompleted == mTodos!.todos![index].completed
                            ? Colors.white
                            : Colors.blue.shade200,
                        child: ListTile(
                          leading: Text('${mTodos!.todos![index].id}'),
                          title: Text('${mTodos!.todos![index].todo}'),
                          subtitle: Text('${mTodos!.todos![index].completed}'),
                          trailing: Text('${mTodos!.todos![index].userId}'),
                        ),
                      );
                    })
                : Center(
                    child: Lottie.asset('assets/lottie/lottie.json',
                        fit: BoxFit.fill),
                  )
            : Center(
                child: SizedBox(
                    width: double.infinity,
                    height: 450,
                    child: Lottie.asset('assets/lottie/lottie.json',
                        fit: BoxFit.contain)),
              ));
  }

  _buildTodos() async {
    String url = 'https://dummyjson.com/todos';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mData = response.body;
      print(mData);

      var rawData = jsonDecode(mData);

      mTodos = DataModel.fromJson(rawData);

      setState(() {});
    }
  }
}
