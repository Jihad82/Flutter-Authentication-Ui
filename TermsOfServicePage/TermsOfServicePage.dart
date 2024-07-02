import 'package:flutter/material.dart';

import '../../CustomDesign/AppBar.dart';

class TermsOfServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Terms of Service', showBackArrow: true
          , actionWidgets: []),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Terms of Service',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: 20),
            buildCard(
              context,
              'Introduction',
              'These terms of service ("Terms") apply to your access and use of our app. Please read them carefully.',
            ),
            buildCard(
              context,
              'Use of the Service',
              'You may use the service only if you agree to form a binding contract with us and are not a person barred from receiving services under the laws of the applicable jurisdiction.',
            ),
            buildCard(
              context,
              'Your Account',
              'You are responsible for your login credentials and for any activity resulting from the use of your login credentials or other activity on your account.',
            ),
            buildCard(
              context,
              'Termination',
              'We may terminate or suspend your access to the service at any time, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
