import 'package:flutter/material.dart';

import 'constants/size_config.dart';
import 'design/todo_screen.dart';

class TODOHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: TODOScreen(),
    );
  }
}
