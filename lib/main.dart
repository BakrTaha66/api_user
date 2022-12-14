import 'package:api_user/next_provider.dart';
import 'package:api_user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => NextProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('API SESSION')),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return FutureBuilder<UserModel>(
            future: provider.getData(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? dataList(provider.userModel?.data ?? [])
                  : snapshot.hasError
                      ? Text('Somthing went wrong')
                      : Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }

  Widget dataList(List<Data> data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text('Users List:')),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title:
                      Text('${data[index].firstName} ${data[index].lastName}'),
                  subtitle: Text('${data[index].email}'),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatar ?? ''),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
