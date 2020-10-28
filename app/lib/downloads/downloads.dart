import 'package:flutter/material.dart';

import '../custom-appbar.dart';

class Downloads extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Downloads'),
      body: Text('This is downloads'),
    );
  }
}
