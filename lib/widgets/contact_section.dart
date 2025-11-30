import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';
import 'button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  String name = '', phone = '', date = '', guests = '1-2 guests', requests = '';

  void _submit() {
    if (!_formKey.currentState!.validate()) {
      showToast(context,
          title: 'Missing Information',
          description: 'Please fill in name, phone and date.');
      return;
    }

    showToast(context,
        title: 'Reservation Request Sent!',
        description: 'Thanks $name! We\'ll confirm your table.');

    setState(() {
      name = phone = date = requests = '';
      guests = '1-2 guests';
    });

    _formKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondary,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        children: [
         const Text('Get in Touch', style: TextStyle(color: AppColors.primary)),
          const SizedBox(height: 8),
          Text(
            'Visit Us Today',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 600 ? 280 : double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Name'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                        onChanged: (v) => name = v,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 600 ? 280 : double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Phone'),
                        validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
                        onChanged: (v) => phone = v,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 600 ? 280 : double.infinity,
                      child: TextFormField(
                        decoration: const InputDecoration(labelText: 'Date'),
                        readOnly: true,
                        controller: TextEditingController(text: date),
                        onTap: () async {
                          final picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          if (picked != null) {
                            setState(() => date = picked.toIso8601String().split('T').first);
                          }
                        },
                        validator: (_) => (date.isEmpty) ? 'Required' : null,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width > 600 ? 280 : double.infinity,
                      child: DropdownButtonFormField<String>(
                        initialValue: guests,
                        decoration: const InputDecoration(labelText: 'Guests'),
                        items: const [
                          DropdownMenuItem(value: '1-2 guests', child: Text('1-2 guests')),
                          DropdownMenuItem(value: '3-4 guests', child: Text('3-4 guests')),
                          DropdownMenuItem(value: '5-6 guests', child: Text('5-6 guests')),
                          DropdownMenuItem(value: '7+ guests', child: Text('7+ guests')),
                        ],
                        onChanged: (v) => setState(() => guests = v ?? guests),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextFormField(
                        minLines: 3,
                        maxLines: 4,
                        decoration: const InputDecoration(labelText: 'Special Requests'),
                        onChanged: (v) => requests = v,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Button(label: 'Reserve Table', onTap: _submit, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
