import 'package:flutter/material.dart';

class SideMenu {
  IconData icon;
  String name;
  SideMenu({required this.icon, required this.name});
}

class CreatorList {
  String image;
  String id;
  int artworks;
  int rating;
  CreatorList({
    required this.image,
    required this.id,
    required this.artworks,
    required this.rating,
  });
}
