import 'package:flutter/material.dart';

import 'data/profile_data.dart';
import 'ui/screens/profile.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profile: ronanProfile),
  ));
}
