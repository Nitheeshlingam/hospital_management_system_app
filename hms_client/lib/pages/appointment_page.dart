import 'package:flutter/material.dart';
import 'package:hms_client/widgets/Footer.dart';
import 'package:hms_client/widgets/custom_button.dart';
import 'package:hms_client/widgets/custom_textfield.dart';
import 'package:hms_client/widgets/navbar.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _loginIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _appointmentDateController =
      TextEditingController();
  final TextEditingController _appointmentTimeController =
      TextEditingController();
  final TextEditingController _appointmentReasonController =
      TextEditingController();

  String? _selectedGender;
  String? _selectedDepartment;
  String? _selectedDoctor;

  final List<String> _genderOptions = ['Male', 'Female', 'Other'];
  final List<String> _departmentOptions = [
    'Cardiology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'General',
  ];
  final List<String> _doctorOptions = [
    'Dr. Smith',
    'Dr. Johnson',
    'Dr. Williams',
    'Dr. Jones',
    'Dr. Brown',
  ];

  void _makeAppointment() {
    print('Appointment submitted');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      drawer: drawer(context),
      body: Container(
        decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.all(16.0),
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
                            "Book an Appointment",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 28, 224, 142),
                            ),
                          ),
                          const SizedBox(height: 30),
                          CustomTextField(
                            controller: _nameController,
                            label: "Patient's Name",
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _addressController,
                            label: "Address",
                            icon: Icons.location_on,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _cityController,
                            label: "City",
                            icon: Icons.location_city,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _contactController,
                            label: "Contact Number",
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            controller: _loginIdController,
                            label: "Login ID",
                            icon: Icons.login,
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              prefixIcon: Icon(Icons.lock),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildDropdown(
                            "Select Gender",
                            _selectedGender,
                            _genderOptions,
                            (newValue) {
                              setState(() {
                                _selectedGender = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildDateField(
                            "Date of Birth",
                            Icons.calendar_today,
                            _dobController,
                          ),
                          const SizedBox(height: 16),
                          _buildDateField(
                            "Appointment Date",
                            Icons.event,
                            _appointmentDateController,
                          ),
                          const SizedBox(height: 16),
                          _buildTimeField(
                            "Appointment Time",
                            Icons.access_time,
                            _appointmentTimeController,
                          ),
                          const SizedBox(height: 16),
                          _buildDropdown(
                            "Select Department",
                            _selectedDepartment,
                            _departmentOptions,
                            (newValue) {
                              setState(() {
                                _selectedDepartment = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildDropdown(
                            "Select Doctor",
                            _selectedDoctor,
                            _doctorOptions,
                            (newValue) {
                              setState(() {
                                _selectedDoctor = newValue;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          TextField(
                            controller: _appointmentReasonController,
                            decoration: const InputDecoration(
                              labelText: "Appointment Reason",
                              border: OutlineInputBorder(),
                            ),
                            maxLines: 5,
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 280,
                            child: CustomButton(
                              text: "MAKE AN APPOINTMENT",
                              onPressed: _makeAppointment,
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

  Widget _buildDateField(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (picked != null) {
          setState(() {
            controller.text = "${picked.day}/${picked.month}/${picked.year}";
          });
        }
      },
    );
  }

  Widget _buildTimeField(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: const OutlineInputBorder(),
      ),
      readOnly: true,
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          setState(() {
            controller.text = picked.format(context);
          });
        }
      },
    );
  }

  // Helper function to build dropdown fields
  Widget _buildDropdown(
    String label,
    String? value,
    List<String> items,
    ValueChanged<String?> onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(label),
          ),
          value: value,
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: onChanged,
          items:
              items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
        ),
      ),
    );
  }
}
