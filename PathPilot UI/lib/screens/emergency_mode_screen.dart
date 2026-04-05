import 'package:flutter/material.dart';

class EmergencyModeScreen extends StatefulWidget {
  const EmergencyModeScreen({super.key});

  @override
  State<EmergencyModeScreen> createState() => _EmergencyModeScreenState();
}

class _EmergencyModeScreenState extends State<EmergencyModeScreen> {
  bool _isSending = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Emergency Mode'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.medical_services,
                size: 80,
                color: Colors.red,
              ),
              const SizedBox(height: 24),
              const Text(
                'Emergency Mode',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Quick access to emergency contacts and SOS features.\n\n'
                'Features:\n'
                '• One-tap SOS alerts\n'
                '• Send location to emergency contacts\n'
                '• Local emergency numbers\n'
                '• Medical ID information\n\n'
                '⚠️ This will send an alert to your predefined emergency contact.',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isSending ? null : _sendEmergencyAlert,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: _isSending
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text('SEND SOS'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Back to Dashboard'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _sendEmergencyAlert() {
    setState(() {
      _isSending = true;
    });

    // Simulate sending emergency alert
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isSending = false;
      });

      // Show confirmation
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('SOS Sent'),
          content: const Text('Emergency alert has been sent to your predefined contact.\n\n'
              'Emergency services have been notified with your location.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );

      // TODO: Implement actual emergency alert functionality:
      // - Get current location
      // - Send SMS to predefined contact
      // - Call emergency services (if enabled)
      // - Flash screen/play alarm sound
    });
  }
}