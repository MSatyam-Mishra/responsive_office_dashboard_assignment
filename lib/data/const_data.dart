import 'package:flutter/material.dart';

import 'model.dart';

ScrollController scrollController = ScrollController();

List sideMenuItems = [
  SideMenu(image: "home-2-bold.svg", name: "Home"),
  SideMenu(image: "people.svg", name: "Employees"),
  SideMenu(image: "todo-list.svg", name: "Attendance"),
  SideMenu(image: "calendar-linear.svg", name: "Summary"),
  SideMenu(image: "info-outline.svg", name: "Information"),
];

List topMenus = [
  Icons.calendar_month_rounded,
  Icons.notifications_none_rounded,
  Icons.power_settings_new
];
List creatorList = [
  CreatorList(
      image: "mad.jpg", id: "@maddison_c21", artworks: 9821, rating: 98),
  CreatorList(
      image: "karl.jpg", id: "@karl.willo01", artworks: 9821, rating: 76),
  CreatorList(
      image: "mad.jpg", id: "@maddison_c21", artworks: 9821, rating: 98),
  CreatorList(
      image: "karl.jpg", id: "@karl.willo01", artworks: 9821, rating: 98)
];

List projectImages = [
  "assets/1.jpg",
  "assets/2.jpg",
  "assets/3.jpg",
  "assets/4.jpg",
  "assets/5.jpg",
  "assets/6.jpg",
  "assets/7.jpg",
];

List creatorImages = [
  "https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVvcGxlfGVufDB8fDB8fHww",
  "https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cGVvcGxlfGVufDB8fDB8fHww",
  "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D",
  "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D"
];
