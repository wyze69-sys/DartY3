import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

const ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/w5-s2/aang.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
    TileData(icon: Icons.school, title: "School", value: "CADT"),
    TileData(icon: Icons.work, title: "Team", value: "Mobile"),
    TileData(icon: Icons.language, title: "Language", value: "Khmer, English"),
    TileData(icon: Icons.cake, title: "Birthday", value: "1 January"),
    TileData(icon: Icons.favorite, title: "Hobby", value: "Flutter"),
  ],
);
