import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class FeaturesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                GridViewRoute,
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'FEATURES',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.currency_exchange,
                      title: 'Money\nTransfer',
                      onTap: () => _handleMoneyTransfer(context),
                    ),
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.qr_code_scanner,
                      title: 'QR Scan',
                      onTap: () => _handleQRScan(context),
                    ),
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.account_balance,
                      title: 'Account\nBalance',
                      onTap: () => _handleAccountBalance(context),
                    ),
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.history,
                      title: 'Transaction\nHistory',
                      onTap: () => _handleTransactionHistory(context),
                    ),
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.receipt_long,
                      title: 'Bills',
                      onTap: () => _handleBills(context),
                    ),
                    _buildFeatureCard(
                      context: context,
                      icon: Icons.chat,
                      title: 'Netraa AI',
                      onTap: () => _handleAIChat(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Feature Card Builder
  Widget _buildFeatureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF003366), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Color.fromARGB(255, 60, 127, 194),
            ),
            SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF003366),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Navigation Handlers
  void _handleMoneyTransfer(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      TransferRoute,
      (route) => false,
    );
  }

  void _handleQRScan(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      QrcodeRoute,
      (route) => false,
    );
  }

  void _handleAccountBalance(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      AccountRoute,
      (route) => false,
    );
  }

  void _handleTransactionHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _DummyScreen(title: 'Transaction History'),
      ),
    );
  }

  void _handleBills(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      BillsRoute,
      (route) => false,
    );
  }

  void _handleAIChat(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      ChatBotRoute,
      (route) => false,
    );
  }
}

class _DummyScreen extends StatelessWidget {
  final String title;

  const _DummyScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Color.fromARGB(255, 51, 118, 185),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$title Screen',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 57, 147, 236),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
