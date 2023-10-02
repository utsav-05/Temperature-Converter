import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _celsiusController;

  double celsiusValue = 0.0;
  double fahrenheitValue = 0.0;

  double temperatureConverter() {
    if (_celsiusController.text.isEmpty) {
      celsiusValue = double.parse(_celsiusController.text = '0.0');
      return fahrenheitValue = (celsiusValue * 9 / 5) + 32;
    } else {
      celsiusValue = double.parse(_celsiusController.text);
      return fahrenheitValue = (celsiusValue * 9 / 5) + 32;
    }
  }

  @override
  void initState() {
    super.initState();
    _celsiusController = TextEditingController();
  }

  @override
  void dispose() {
    _celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar get appBar {
    return AppBar(
      title: const Text('Temperature Converter'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget get body {
    return Container(
      color: Colors.deepPurple,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            celsiusTemperatureTextField,
            const SizedBox(height: 20),
            actionButtons,
          ],
        ),
      ),
    );
  }

  Widget get bottomNavigationBar {
    return Container(
      color: Colors.deepPurple,
      height: 30,
      child: const Text(
        'Copyright by Gabriel Miranda',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white70),
      ),
    );
  }

  TextField get celsiusTemperatureTextField {
    return TextField(
      controller: _celsiusController,
      style: const TextStyle(color: Colors.white),
      decoration: const InputDecoration(
        labelText: 'Type Celsius Temperature Here',
        labelStyle: TextStyle(color: Colors.white),
      ),
      keyboardType: TextInputType.number,
    );
  }

  Widget get actionButtons {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [convertButton, clearButton],
    );
  }

  ElevatedButton get convertButton {
    return ElevatedButton(
      onPressed: () => setState(() {
        temperatureConverter();
        showDialog(context: context, builder: (context) => alertResult);
      }),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.purpleAccent),
      child: const Text('Convert'),
    );
  }

  AlertDialog get alertResult {
    return AlertDialog(
      title: const Text('Result Convert', textAlign: TextAlign.center),
      content: Text("$fahrenheitValue ºF", textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'Ok'),
          child: const Text('Ok'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
    );
  }

  ElevatedButton get clearButton {
    return ElevatedButton(
      onPressed: () => setState(() {
        celsiusValue = 0;
        _celsiusController.text = '';
        _celsiusController.clear();
      }),
      style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      child: const Text('Clear'),
    );
  }
}
