import 'package:flutter/material.dart';

class MyOTPField extends StatefulWidget {
  final int numberOfFields;
  final ValueChanged<String> onCompleted;
  final Color color;

  MyOTPField({
    required this.numberOfFields,
    required this.onCompleted,
    required this.color,
  });

  @override
  _MyOTPFieldState createState() => _MyOTPFieldState();
}

class _MyOTPFieldState extends State<MyOTPField> {
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focuses = [];
  String text = "";

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    for (int i = 0; i < widget.numberOfFields; i++) {
      TextEditingController controller = TextEditingController();
      FocusNode _node = FocusNode();
      _controllers.add(controller);
      _focuses.add(_node);
    }
  }

  @override
  void dispose() {
    for (TextEditingController controller in _controllers) {
      controller.dispose();
    }
    for (var f in _focuses) {
      f.dispose();
    }
    super.dispose();
  }

  void _onTextChanged(int index, String value) {
    String textFieldText = "";
    for (var tf in _controllers) {
      textFieldText += tf.text;
    }
    if (value.length == 1) {
      if (index < _controllers.length - 1) {
        FocusScope.of(context).requestFocus(_focuses[index + 1]);
      } else {
        // Last field
        String otp = '';
        for (TextEditingController controller in _controllers) {
          otp += controller.text;
        }
        widget.onCompleted(otp);
        FocusScope.of(context).unfocus();
      }
      text = textFieldText;
    } else {
      //to go previous textfield
      if (text.length > textFieldText.length && index != 0 && text.isNotEmpty) {
        FocusScope.of(context).requestFocus(_focuses[index - 1]);
        text = textFieldText;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.numberOfFields,
        (index) => _buildOTPField(index),
      ),
    );
  }

  Widget _buildOTPField(int index) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(left: index == widget.numberOfFields ? 0 : 6),
      child: TextField(
        focusNode: _focuses[index],
        autofocus: index == 0,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: _controllers[index],
        maxLength: 1,
        cursorColor: widget.color,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 1.5),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.color, width: 1.5),
          ),
          counterText: '',
        ),
        onChanged: (value) => _onTextChanged(index, value),
      ),
    );
  }
}
