import 'package:flutter/material.dart';

import '../../CustomDesign/AppBar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(title: 'Privacy Policy', showBackArrow: true
        , actionWidgets: []),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Privacy Policy',
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
              'Your privacy is important to us. This privacy statement explains the personal data our app processes, how our app processes it, and for what purposes.',
            ),
            buildCard(
              context,
              'Collection of Information',
              'We collect various types of information in connection with the services we provide, including: \n\n1. Information you provide directly to us.\n2. Information we collect automatically.\n3. Information we obtain from third parties.',
            ),
            buildCard(
              context,
              'Use of Information',
              'We use the information we collect to provide, maintain, and improve our services, to develop new services, and to protect our app and our users.',
            ),
            buildCard(
              context,
              'Sharing of Information',
              'We do not share your personal information with companies, organizations, or individuals outside of our company except in the following cases: \n\n1. With your consent.\n2. For legal reasons.',
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
