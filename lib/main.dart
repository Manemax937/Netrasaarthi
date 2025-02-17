import 'package:flutter/material.dart';
import 'package:netrasaarthi/constants/routes.dart';
import 'package:netrasaarthi/views/Account_balance_view.dart';
import 'package:netrasaarthi/views/Bills_view.dart';
import 'package:netrasaarthi/views/Features_view.dart';
import 'package:netrasaarthi/views/OTP_view.dart';
import 'package:netrasaarthi/views/chatbot_view.dart';
import 'package:netrasaarthi/views/grid_view.dart';
import 'package:netrasaarthi/views/money_transfer_view.dart';
import 'package:netrasaarthi/views/qrcode_view.dart';
import 'package:netrasaarthi/views/sending_money_views.dart';
import 'package:netrasaarthi/views/success_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
      routes: {
        OtpRoute: (context) => OtpView(),
        MainPageRoute: (context) => FeaturesScreen(),
        TransferRoute: (context) => MoneyTransferScreen(),
        SendMoneyRoute: (context) => TransferAmountScreen(),
        TransferInitiatedRoute: (context) => TransferSuccessScreen(),
        QrcodeRoute: (context) => QRScanPage(),
        BillsRoute: (context) => BillsPaymentPage(),
        AccountRoute: (context) => BankSelectionPage(),
        ChatBotRoute: (context) => ChatScreen(),
        GridViewRoute: (context) => SettingsPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Netra saarthi'),
        leading: Icon(Icons.visibility_rounded),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'LOGIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Phone number',
                  prefixIcon: Icon(Icons.app_registration_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    OtpRoute,
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Login Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Login with Others',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialLoginButton(
                    icon: Icons.g_translate,
                    color: Colors.red,
                  ),
                  SizedBox(width: 20),
                  _buildSocialLoginButton(
                    icon: Icons.facebook,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton({
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: () {},
      ),
    );
  }
}
