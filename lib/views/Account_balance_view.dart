import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class BankSelectionPage extends StatelessWidget {
  const BankSelectionPage({Key? key}) : super(key: key);

  void _handleBankSelection(BuildContext context, String bank) {
    // Handle bank selection
    print('Selected bank: $bank');
  }

  Widget _buildBankOption({
    required String name,
    required IconData icon,
    required VoidCallback onTap,
    bool isAddAccount = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: isAddAccount ? Colors.deepPurple : Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isAddAccount ? Colors.white : Colors.black,
                size: 30,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainPageRoute,
              (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance, size: 24),
                  const SizedBox(width: 8),
                  const Text(
                    'SELECT BANK',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    _buildBankOption(
                      name: 'SBI',
                      icon: Icons
                          .account_balance_wallet, // Replace with relevant icon
                      onTap: () => _handleBankSelection(context, 'SBI'),
                    ),
                    _buildBankOption(
                      name: 'HDFC',
                      icon: Icons.attach_money, // Replace with relevant icon
                      onTap: () => _handleBankSelection(context, 'HDFC'),
                    ),
                    _buildBankOption(
                      name: 'UNION',
                      icon: Icons.credit_card, // Replace with relevant icon
                      onTap: () => _handleBankSelection(context, 'UNION'),
                    ),
                    _buildBankOption(
                      name: 'ADD ACCOUNT',
                      icon: Icons.add,
                      onTap: () => _handleBankSelection(context, 'ADD_ACCOUNT'),
                      isAddAccount: true,
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
}
