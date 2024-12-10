import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParentWidget(),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String title = "Initial Title";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChildWidget(title: title),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  title = "Updated Title";
                });
              },
              child: const Text('Update Title'),
            ),
          ],
        ),
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  final String title;

  const ChildWidget({super.key, required this.title});

  @override
  State<ChildWidget> createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title) {
      debugPrint(
          'Title changed from "${oldWidget.title}" to "${widget.title}"');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Current Title: ${widget.title}',
      style: const TextStyle(fontSize: 20),
    );
  }
}
