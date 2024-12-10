import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ciclo de Vida de StatefulWidget'),
        ),
        body: const LifeCycleExample(),
      ),
    );
  }
}

class LifeCycleExample extends StatefulWidget {
  const LifeCycleExample({super.key});

  @override
  State<LifeCycleExample> createState() => _LifeCycleExampleState();
}

class _LifeCycleExampleState extends State<LifeCycleExample> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint('initState: El widget se ha inicializado.');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint(
        'didChangeDependencies: Se han establecido dependencias del widget.');
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: Se está construyendo el widget.');
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Contador: $counter',
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              counter++;
              debugPrint('setState: El estado ha cambiado a $counter.');
            });
          },
          child: const Text('Incrementar'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    debugPrint('dispose: El widget se está eliminando.');
    super.dispose();
  }
}

