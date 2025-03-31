import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hms_client/routes/routenames.dart';
import 'package:hms_client/widgets/Footer.dart';
import 'package:hms_client/widgets/navbar.dart';
import 'package:hms_client/widgets/home_carousel.dart';
import 'package:hms_client/widgets/schedule_table.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, Color> categoryColors = {
    'HEALTH CHECK UPS': Color(0xFF2ECC71),
    'EMERGENCY CASE': Color(0xFFE74C3C),
    'QUALIFIED DOCTORS': Color(0xFF3498DB),
    'ONLINE APPOINTMENT': Color(0xFFF39C12),
    'FREE MEDICAL COUNSELING': Color(0xFF9B59B6),
  };

  final Map<String, Color> infrastructureColors = {
    'EYE SPECIALIST': Color(0xFF1ABC9C),
    'OPERATION THEATER': Color(0xFFD35400),
    'ICU DEPARTMENT': Color(0xFF2980B9),
    'QUALIFIED DOCTORS': Color(0xFF8E44AD),
    'HEART PROBLEMS': Color(0xFFE74C3C),
    'STOMACH PROBLEMS': Color(0xFF16A085),
  };

  final Map<String, IconData> serviceIcons = {
    'HEALTH CHECK UPS': Icons.health_and_safety,
    'EMERGENCY CASE': Icons.emergency,
    'QUALIFIED DOCTORS': Icons.medical_services,
    'ONLINE APPOINTMENT': Icons.calendar_today,
    'FREE MEDICAL COUNSELING': Icons.support_agent,
  };

  final Map<String, IconData> infrastructureIcons = {
    'EYE SPECIALIST': Icons.remove_red_eye_outlined,
    'OPERATION THEATER': Icons.medical_services,
    'ICU DEPARTMENT': Icons.personal_injury,
    'QUALIFIED DOCTORS': FontAwesomeIcons.userDoctor,
    'HEART PROBLEMS': FontAwesomeIcons.heartCirclePlus,
    'STOMACH PROBLEMS': Icons.sick,
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

  final Map<String, String> infrastructureDescriptions = {
    'EYE SPECIALIST':
        'Comprehensive eye care with advanced diagnostic and treatment technologies.',
    'OPERATION THEATER':
        'State-of-the-art surgical facilities with modern equipment and sterile environment.',
    'ICU DEPARTMENT':
        'Intensive care units equipped with advanced monitoring and life support systems.',
    'QUALIFIED DOCTORS':
        'Board-certified specialists with expertise in their respective medical fields.',
    'HEART PROBLEMS':
        'Specialized cardiac care with advanced diagnostics and treatment protocols.',
    'STOMACH PROBLEMS':
        'Comprehensive gastroenterology services for digestive health issues.',
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 4),
                            blurRadius: 12.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: HomeCarousel(),
                      ),
                    ),
                    _buildFeaturedCard(),
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
                        children:
                            serviceIcons.entries.map((entry) {
                              return _buildServiceCard(
                                entry.key,
                                serviceDescriptions[entry.key] ??
                                    'Description for ${entry.key}',
                                entry.value,
                                categoryColors[entry.key] ?? Color(0xFF2ECC71),
                              );
                            }).toList(),
                      ),
                    ),
                    ScheduleTable(),
                    _buildSectionTitle(
                      'Why Choose Us',
                      'Trusted by thousands of patients',
                      Color(0xFF3498DB),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 4),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('50+', 'Doctors', Color(0xFF3498DB)),
                          _buildStatItem('10K+', 'Patients', Color(0xFF2ECC71)),
                          _buildStatItem('15+', 'Years Exp', Color(0xFFF39C12)),
                        ],
                      ),
                    ),
                    _buildSectionTitle(
                      'Our Infrastructure',
                      'Modern medical facilities and expert care',
                      Color(0xFF1ABC9C),
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
                        children:
                            infrastructureIcons.entries.map((entry) {
                              return _buildServiceCard(
                                entry.key,
                                infrastructureDescriptions[entry.key] ??
                                    'State-of-the-art facilities for ${entry.key}.',
                                entry.value,
                                infrastructureColors[entry.key] ??
                                    Color(0xFF3498DB),
                              );
                            }).toList(),
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

  Widget _buildFeaturedCard() {
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
                icon: Text('Learn More', style: TextStyle(color: Colors.white)),
                label: Icon(Icons.arrow_forward, color: Colors.white),
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

  Widget _buildStatItem(String value, String label, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.1),
            border: Border.all(color: color.withOpacity(0.3), width: 2),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
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
}
