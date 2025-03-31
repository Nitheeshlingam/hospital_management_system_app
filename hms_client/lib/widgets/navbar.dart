import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/routes/routenames.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 80,
    elevation: 4,
    shadowColor: Colors.grey.withOpacity(0.3),
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
    ),
    centerTitle: false,
    title: Image.asset(
      'assets/images/hms_logo.png',
      height: 70,
      width: 180,
      fit: BoxFit.contain,
    ),
    actions: [
      Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            color: Color(0xFF2ECC71),
            size: 26,
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 16, left: 8),
        decoration: BoxDecoration(
          color: Color(0xFF2ECC71).withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: IconButton(
          onPressed: () {
            context.go(RouteNames.login);
          },
          icon: const Icon(
            Icons.logout_outlined,
            color: Color(0xFF2ECC71),
            size: 26,
          ),
        ),
      ),
    ],
  );
}

TextStyle textFieldStyle(Color color, FontWeight weight, double size) {
  return TextStyle(color: color, fontWeight: weight, fontSize: size);
}

Widget drawerItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String route,
  required String currentRoute,
}) {
  bool isSelected = currentRoute == route;

  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    decoration: BoxDecoration(
      color: isSelected ? Color(0xFF2ECC71) : Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      boxShadow:
          isSelected
              ? [
                BoxShadow(
                  color: Color(0xFF2ECC71).withOpacity(0.3),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ]
              : [],
    ),
    child: ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Icon(
        icon,
        color: isSelected ? Colors.white : Color(0xFF2ECC71),
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          fontSize: 16,
        ),
      ),
      onTap: () {
        context.go(route);
      },
    ),
  );
}

Drawer drawer(BuildContext context) {
  String currentRoute = GoRouterState.of(context).uri.toString();

  return Drawer(
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 180,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.local_hospital,
                        color: Color(0xFF2ECC71),
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      'HMS',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  'Hospital Management System',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Healthcare at your fingertips',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Navigation',
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(top: 0),
              children: [
                drawerItem(
                  context,
                  icon: Icons.home_rounded,
                  title: 'Home',
                  route: RouteNames.home,
                  currentRoute: currentRoute,
                ),
                drawerItem(
                  context,
                  icon: Icons.info_rounded,
                  title: 'About',
                  route: RouteNames.about,
                  currentRoute: currentRoute,
                ),
                drawerItem(
                  context,
                  icon: FontAwesomeIcons.calendarCheck,
                  title: 'Appointments',
                  route: RouteNames.appointment,
                  currentRoute: currentRoute,
                ),
                drawerItem(
                  context,
                  icon: Icons.contact_page_rounded,
                  title: 'Contact',
                  route: RouteNames.contact,
                  currentRoute: currentRoute,
                ),
                drawerItem(
                  context,
                  icon: Icons.login_rounded,
                  title: 'Login',
                  route: RouteNames.login,
                  currentRoute: currentRoute,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF2ECC71).withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Icon(Icons.headset_mic_rounded, color: Color(0xFF2ECC71)),
                SizedBox(width: 12),
                GestureDetector(
                  onTap: () => {context.push(RouteNames.contact)},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need Help?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        'Contact Support',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
