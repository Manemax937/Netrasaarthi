import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class MoneyTransferScreen extends StatefulWidget {
  @override
  _MoneyTransferScreenState createState() => _MoneyTransferScreenState();
}

class _MoneyTransferScreenState extends State<MoneyTransferScreen> {
  String mobileNumber = '+91 9987755647';
  String selectedMethod = 'PHONE NO.'; // Default selected method

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
              Text(
                'MONEY TRANSFER',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMethodButton('UPI ID'),
                  _buildMethodButton('PHONE NO.'),
                  _buildMethodButton('ACC NO.'),
                ],
              ),
              SizedBox(height: 40),
              Text(
                'Enter Mobile Number',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        'https://placekitten.com/100/100', // Placeholder image
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      mobileNumber,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 9) return _buildKeypadButton('.');
                    if (index == 10) return _buildKeypadButton('0');
                    if (index == 11) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF003366),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                          onPressed: () => _handleSubmit(),
                        ),
                      );
                    }
                    return _buildKeypadButton('${index + 1}');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMethodButton(String text) {
    bool isSelected = selectedMethod == text;
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = text),
      child: Container(
        width: 100,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF003366),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Color(0xFF003366) : Colors.white,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF003366),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () => _handleNumberPress(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFF003366),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _handleNumberPress(String value) {
    // Handle number input
    setState(() {
      if (mobileNumber.length < 15) {
        mobileNumber += value;
      }
    });
  }

  void _handleSubmit() {
    // Validate and submit the transfer
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Transfer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transfer Method: $selectedMethod'),
            Text('Number: $mobileNumber'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                SendMoneyRoute,
                (route) => false,
              );
            },
            child: Text('Confirm'),
          ),
        ],
      ),
    );
  }
}
