import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';

class TransferAmountScreen extends StatefulWidget {
  @override
  _TransferAmountScreenState createState() => _TransferAmountScreenState();
}

class _TransferAmountScreenState extends State<TransferAmountScreen> {
  String amount = '0';
  bool hasDecimal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 202, 228, 255),
              Colors.white,
            ],
            stops: [0.3, 0.4],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            MainPageRoute,
                            (route) => false,
                          );
                        }),
                    SizedBox(width: 8),
                    Text(
                      'Transfer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              // Amount Display

              SizedBox(height: 25),
              Text(
                '\$$amount',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003366),
                ),
              ),
              SizedBox(height: 40),
              // Recipient Info
              Text(
                'To',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                      'https://placekitten.com/100/100', // Placeholder image
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Grace Addison',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacer(),
              // Number Pad
              Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 9) return _buildKeypadButton('.');
                    if (index == 10) return _buildKeypadButton('0');
                    if (index == 11) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF003366),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(14),
                          ),
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String text) {
    return TextButton(
      onPressed: () => _handleNumberPress(text),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Color(0xFF003366),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _handleNumberPress(String value) {
    setState(() {
      if (value == '.' && !hasDecimal) {
        if (amount == '0') {
          amount = '0.';
        } else {
          amount += '.';
        }
        hasDecimal = true;
      } else if (value != '.') {
        if (amount == '0') {
          amount = value;
        } else {
          // Limit to 2 decimal places
          if (hasDecimal) {
            var parts = amount.split('.');
            if (parts[1].length < 2) {
              amount += value;
            }
          } else {
            amount += value;
          }
        }
      }
    });
  }

  void _handleSubmit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Transfer'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Amount: \$$amount'),
            Text('To: Grace Addison'),
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
                TransferInitiatedRoute,
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
