import 'package:flutter/material.dart';

class NavigationModeScreen extends StatefulWidget {
  const NavigationModeScreen({super.key});

  @override
  State<NavigationModeScreen> createState() => _NavigationModeScreenState();
}

class _NavigationModeScreenState extends State<NavigationModeScreen> {
  final TextEditingController _destinationController = TextEditingController();
  bool _isNavigating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Navigation Mode'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.navigation,
              size: 80,
              color: Colors.purple,
            ),
            const SizedBox(height: 24),
            const Text(
              'Navigation Mode',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Turn-by-turn directions and route planning.\n\n'
              'This will eventually include:\n'
              '• Offline GPS navigation\n'
              '• Voice guidance\n'
              '• Traffic updates\n'
              '• Alternative routes\n\n'
              'For now, enter a destination to test the interface:',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _destinationController,
              decoration: InputDecoration(
                labelText: 'Destination',
                hintText: 'e.g., Railway Station, Museum, etc.',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isNavigating ? null : _startNavigation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: _isNavigating
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Start Navigation'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

  void _startNavigation() {
    if (_destinationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a destination')),
      );
      return;
    }

    setState(() {
      _isNavigating = true;
    });

    // TODO: Implement offline navigation logic here
    // This will call your routing service when ready

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isNavigating = false;
      });

      // Show placeholder for now
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Navigation Started'),
          content: Text('Navigating to: ${_destinationController.text}\n\n'
              'This is where offline routing will be implemented.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }
}