import 'package:flutter/material.dart';
import 'package:flutter_components/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders & Checks'),
      ),
      body: Column(
        children: [
          // Para que segun la plataforma se adapte el estilo a Android e iOS
          Slider.adaptive(
              min: 50,
              max: 400,
              activeColor: AppTheme.primary,
              value: _sliderValue,
              onChanged: _sliderEnabled
                  ? (double value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null),

          // Checkbox(
          //   value: _sliderEnabled,
          //   onChanged: (value) {
          //     _sliderEnabled = value ?? true;
          //     setState(() {});
          //   },
          // ),
          // Switch(
          //   value: _sliderEnabled,
          //   onChanged: (value) => setState(() {
          //     _sliderEnabled = value;
          //   }),
          // ),
          CheckboxListTile(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            },
          ),

          SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value;
              setState(() {});
            },
          ),

          const AboutListTile(),

          // Internamente dentro de una columna no se sabe el alto que tiene,
          // por eso se envuelve el SingleChildScrollView en un Expanded para
          // que tome todo el espacio
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://cdn.pixabay.com/photo/2020/07/06/17/51/batman-5377804_960_720.png'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
