import 'package:flutter/material.dart';
import 'package:post_reader_demo/data/store.dart';
import 'package:post_reader_demo/views/posts_page.dart';

void main() async {
  // This is required so ObjectBox can get the application directory
  // to store the database in.
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Posts App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PostListPage(),
    );
  }
}
