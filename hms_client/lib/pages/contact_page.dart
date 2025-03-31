import 'package:flutter/material.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/widgets/custom_textfield.dart';
import 'package:hms_client/widgets/footer.dart';
import 'package:hms_client/widgets/navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _messageSent() {
    print('message sent successfully');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: drawer(context),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color.fromARGB(255, 232, 255, 243),
              Color.fromARGB(255, 200, 255, 229),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            "GET IN TOUCH",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 28, 224, 142),
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: _nameController,
                            label: "Name",
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _emailController,
                            label: "Email",
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _phoneController,
                            label: "Phone",
                            keyboardType: TextInputType.number,
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _departmentController,
                            label: "Department",
                            icon: FontAwesomeIcons.building,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _messageController,
                            decoration: const InputDecoration(
                              labelText: "Message",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 280,
                            child: CustomButton(
                              text: "SEND MESSAGE",
                              onPressed: _messageSent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
