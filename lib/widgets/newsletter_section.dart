import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'toast.dart';
import 'button.dart';

class NewsletterSection extends StatefulWidget {
  const NewsletterSection({super.key});

  @override
  State<NewsletterSection> createState() => _NewsletterSectionState();
}

class _NewsletterSectionState extends State<NewsletterSection> {
  final TextEditingController emailController = TextEditingController();

  void _submit() {
    final email = emailController.text;
    if (email.isEmpty || !email.contains('@')) {
      showToast(context, title: 'Invalid Email', description: 'Please enter a valid email address.');
      return;
    }
    showToast(context, title: 'Welcome to the Bliss Club!', description: 'Check your inbox for your 10% discount code.');
    emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 18),
      child: Column(
        children: [
          Text('Join the Bliss Club', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.primaryForeground, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text('Subscribe for exclusive deals, new menu alerts, and special event invitations.', style:  TextStyle(color: AppColors.primaryForeground)),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 320, child: TextField(controller: emailController, decoration: const InputDecoration(hintText: 'Enter your email', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))), contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12)))),
              const SizedBox(width: 12),
              Button(label: 'Subscribe', onTap: _submit),
            ],
          ),
        ],
      ),
    );
  }
}
