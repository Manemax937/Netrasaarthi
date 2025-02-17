import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class BillsPaymentPage extends StatelessWidget {
  const BillsPaymentPage({Key? key}) : super(key: key);

  void _handlePaymentOption(BuildContext context, String option) {
    // Handle navigation based on selected option
    print('Selected option: $option');
  }

  Widget _buildPaymentOption({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF003366), width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFF003366),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF003366),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'BILLS PAYMENT',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    _buildPaymentOption(
                      title: 'MOBILE\nRECHARGE',
                      icon: Icons.phone_android,
                      onTap: () =>
                          _handlePaymentOption(context, 'Mobile Recharge'),
                    ),
                    _buildPaymentOption(
                      title: 'ELECTRICITY',
                      icon: Icons.electric_bolt,
                      onTap: () => _handlePaymentOption(context, 'Electricity'),
                    ),
                    _buildPaymentOption(
                      title: 'GAS\nCYLINDER',
                      icon: Icons.propane_tank,
                      onTap: () =>
                          _handlePaymentOption(context, 'Gas Cylinder'),
                    ),
                    _buildPaymentOption(
                      title: 'CREDIT\nCARD',
                      icon: Icons.credit_card,
                      onTap: () => _handlePaymentOption(context, 'Credit Card'),
                    ),
                    SizedBox(height: 20),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              MainPageRoute,
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF003366),
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
