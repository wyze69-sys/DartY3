import 'package:flutter/material.dart';

class ProfileData {
  final String name;
  final String position;
  final String avatarUrl;
  final List<TileData> tiles;

  const ProfileData({
    required this.name,
    required this.position,
    required this.tiles,
    required this.avatarUrl,
  });
}

class TileData {
  final IconData icon;
  final String title;
  final String value;

  const TileData({
    required this.icon,
    required this.title,
    required this.value,
  });
}
