import 'package:flutter/material.dart';

void main() {
  runApp(const VirtualAndroXApp());
}

class VirtualAndroXApp extends StatelessWidget {
  const VirtualAndroXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VirtualAndroX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const VirtualAndroXHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class VirtualAndroXHome extends StatefulWidget {
  const VirtualAndroXHome({super.key});

  @override
  State<VirtualAndroXHome> createState() => _VirtualAndroXHomeState();
}

class _VirtualAndroXHomeState extends State<VirtualAndroXHome> {
  String _status = 'Initializing VirtualAndroX...';

  @override
  void initState() {
    super.initState();
    _initializeVirtualization();
  }

  Future<void> _initializeVirtualization() async {
    setState(() {
      _status = 'Booting Android 11 Environment...';
    });
    
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _status = 'Loading myBSN Compatibility Layer...';
    });
    
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() {
      _status = 'Ready to Launch myBSN Banking';
    });
  }

  void _launchMyBSN() {
    // Placeholder for myBSN launch functionality
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Launch myBSN'),
          content: const Text('myBSN banking app would launch here with Android 11 virtualization.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VirtualAndroX'),
        backgroundColor: Colors.blue[700],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'VirtualAndroX',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Android 11 Virtualization',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 30),
            Card(
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'System Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(_status),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _launchMyBSN,
                      icon: const Icon(Icons.account_balance),
                      label: const Text('Launch myBSN Banking'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
