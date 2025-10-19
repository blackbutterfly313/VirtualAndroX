import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  String _status = 'System Ready - Huawei Nova 4 Optimized';
  bool _isReady = true;

  void _launchMyBSN() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Launch myBSN'),
          content: const Text('myBSN banking app would launch here with full Android 11 virtualization support.'),
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

  void _showSettings() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('System Settings'),
          content: const Text('Virtualization Settings:\n- Android 11 Environment\n- 280MB RAM Target\n- Huawei Kirin 970 Optimized'),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: _showSettings,
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.phone_android,
              size: 100,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'VirtualAndroX',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Android 11 Virtualization',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 40),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'System Status',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(
                          _isReady ? Icons.check_circle : Icons.schedule,
                          color: _isReady ? Colors.green : Colors.orange,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            _status,
                            style: TextStyle(
                              color: _isReady ? Colors.green : Colors.orange,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: _isReady ? _launchMyBSN : null,
                        icon: const Icon(Icons.account_balance),
                        label: const Text('Launch myBSN Banking'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          textStyle: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Huawei Nova 4 | Kirin 970 | Android 10 Host',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
