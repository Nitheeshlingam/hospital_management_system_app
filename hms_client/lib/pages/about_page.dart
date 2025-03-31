import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/routes/routenames.dart';
import 'package:hms_client/widgets/footer.dart';
import 'package:hms_client/widgets/navbar.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final Map<String, Color> categoryColors = {
    'HEALTH CHECK UPS': Color(0xFF2ECC71),
    'EMERGENCY CASE': Color(0xFFE74C3C),
    'QUALIFIED DOCTORS': Color(0xFF3498DB),
    'ONLINE APPOINTMENT': Color(0xFFF39C12),
    'FREE MEDICAL COUNSELING': Color(0xFF9B59B6),
  };

  final Map<String, IconData> serviceIcons = {
    'HEALTH CHECK UPS': Icons.health_and_safety,
    'EMERGENCY CASE': Icons.emergency,
    'QUALIFIED DOCTORS': Icons.medical_services,
    'ONLINE APPOINTMENT': Icons.calendar_today,
    'FREE MEDICAL COUNSELING': Icons.support_agent,
  };

  final Map<String, String> serviceDescriptions = {
    'HEALTH CHECK UPS':
        'Comprehensive health screenings and preventive care services for your wellbeing.',
    'EMERGENCY CASE':
        'Immediate medical attention available 24/7 for all urgent health situations.',
    'QUALIFIED DOCTORS':
        'Expert physicians with extensive experience across various medical specialties.',
    'ONLINE APPOINTMENT':
        'Easily schedule consultations from anywhere using our digital platform.',
    'FREE MEDICAL COUNSELING':
        'Get professional advice on health concerns at no additional cost.',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: drawer(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF2ECC71).withOpacity(0.2), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    _buildFeaturedCard(context),
                    _buildSectionTitle(
                      'Our Services',
                      'We provide world-class healthcare services',
                      Color(0xFF2ECC71),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        shrinkWrap: true,
                        childAspectRatio: 0.8,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ...serviceIcons.entries.map((entry) {
                            return _buildServiceCard(
                              entry.key,
                              serviceDescriptions[entry.key] ??
                                  'Description for ${entry.key}',
                              entry.value,
                              categoryColors[entry.key] ?? Color(0xFF2ECC71),
                            );
                          }).toList(),
                          if (serviceIcons.length.isOdd) SizedBox(),
                        ],
                      ),
                    ),
                    Footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildFeaturedCard(BuildContext context) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF2ECC71), Color(0xFF27AE60)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF2ECC71).withOpacity(0.3),
          offset: Offset(0, 4),
          blurRadius: 10.0,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.medical_services,
                  color: Color(0xFF2ECC71),
                  size: 28,
                ),
              ),
              SizedBox(width: 16),
              Text(
                'Healthcare Excellence',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            'Your health is our priority. We provide comprehensive medical services with state-of-the-art technology and expert professionals dedicated to your wellbeing.',
            style: TextStyle(color: Colors.white, fontSize: 14.0),
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () {
                context.push(RouteNames.about);
              },
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              label: Text('Learn More', style: TextStyle(color: Colors.white)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white24,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildServiceCard(
  String title,
  String description,
  IconData icon,
  Color color,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.0),
      boxShadow: [
        BoxShadow(
          color: color.withOpacity(0.2),
          offset: Offset(0, 3),
          blurRadius: 8.0,
        ),
      ],
      border: Border.all(color: color.withOpacity(0.1), width: 1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 30),
        ),
        SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
              color: color.withOpacity(0.9),
            ),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.0, color: Colors.black54),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 8),
      ],
    ),
  );
}

Widget _buildSectionTitle(String title, String subtitle, Color color) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 24,
              width: 4,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(subtitle, style: TextStyle(fontSize: 16, color: Colors.black54)),
      ],
    ),
  );
}
