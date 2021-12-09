import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double min;
  final double max;
  final Function(double) setValue;
  final double initialValue;
  final String label;
  final String prependValueLabel;
  final String appendValueLabel;
  final int fixedDigits;

  const CustomSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.setValue,
    required this.initialValue,
    required this.label,
    this.prependValueLabel = '',
    this.appendValueLabel = '',
    this.fixedDigits = 2,
  }) : super(key: key);

//   @override
//   _CustomSliderState createState() => _CustomSliderState();
// }
//
// class _CustomSliderState extends State<CustomSlider> {
//   final _textController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     //_textController.addListener(widget.setValue);
//     _textController.text = widget.value.toStringAsFixed(widget.fixedDigits);
//   }
  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  late double sliderValue;
  final _textController = TextEditingController();

  @override
  initState() {
    super.initState();
    _textController.text = sliderValue.toStringAsFixed(widget.fixedDigits);
  }

  @override
  dispose() {
    _textController.dispose();
    super.dispose();
  }

  updateSlider(double newValue) {
    if (newValue > widget.max) {
      newValue = widget.max;
    } else if (newValue < widget.min) {
      newValue = widget.min;
    }
    setState(() {
      sliderValue = newValue;
    });
    widget.setValue(newValue);
    _textController.text = newValue.toStringAsFixed(widget.fixedDigits);
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              suffix: Text(widget.appendValueLabel),
              border: InputBorder.none,
            ),
            controller: _textController,
            //onChanged: (text) => updateSlider(double.parse(_textController.text)),
          ),
        ),
        // Container(
        //   child: Slider(
        //     value: widget.initialValue,
        //     min: widget.min,
        //     max: widget.max,
        //     divisions: 60,
        //     label: widget.prependValueLabel +
        //         sliderValue.toStringAsFixed(widget.fixedDigits) +
        //         widget.appendValueLabel,
        //     onChanged: (newValue) {
        //       if (true) {
        //         updateSlider(newValue.roundToDouble());
        //       }
        //     },
        //   ),
        // )
      ],
    );
  }
}


