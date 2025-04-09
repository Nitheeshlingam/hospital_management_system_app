import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: const Color(0xFF2ECC71).withOpacity(0.5),
            thickness: 1.5,
          ),
          const SizedBox(height: 20),
          const Text(
            'CONTACT US',
            style: TextStyle(
              color: Color(0xFF2ECC71),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on, size: 18, color: Color(0xFF2ECC71)),
              const SizedBox(width: 8),
              Expanded(
                child: const Text(
                  'catus coworking, sholinganalur',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.phone, size: 18, color: Color(0xFF2ECC71)),
              const SizedBox(width: 8),
              const Text('1010 2020 36360', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 5),
          const SizedBox(height: 5),
          Row(
            children: [
              const Icon(Icons.email, size: 18, color: Color(0xFF2ECC71)),
              const SizedBox(width: 8),
              const Text('beauroi@gmail.com', style: TextStyle(fontSize: 14)),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.alternate_email,
                size: 18,
                color: Color(0xFF2ECC71),
              ),
              const SizedBox(width: 8),
              const Text('info@beairoi.com', style: TextStyle(fontSize: 14)),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 1,
            color: const Color(0xFF2ECC71).withOpacity(0.3),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '© $currentYear Hospital Management System - ',
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
              Text(
                'Beau Roi Technology',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2ECC71),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
