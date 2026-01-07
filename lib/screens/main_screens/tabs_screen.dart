import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:saees_cards/helpers/consts.dart';
import 'package:saees_cards/helpers/functions_helper.dart';
import 'package:saees_cards/providers/auth_provider.dart';
import 'package:saees_cards/screens/handling_screens/qr_scanner.dart';
import 'package:saees_cards/screens/main_screens/tabs_content/invoices_content.dart';
import 'package:saees_cards/screens/main_screens/tabs_content/wallet_content.dart';
import 'package:saees_cards/widgets/dialogs/custom_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, authConsumer, _) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            centerTitle: true,
            title: Image.asset(
              "assets/logoOnly.png",
              width: getSize(context).width * 0.2,
            ),
          ),
          body: AnimatedSwitcher(
            duration: 300.ms,
            child: currentIndex == 0 ? WalletContent() : InvoicesContent(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primaryColor,
            unselectedItemColor: Colors.grey,
            selectedLabelStyle: labelSmall.copyWith(color: primaryColor),
            unselectedLabelStyle: labelSmall.copyWith(color: primaryColor),

            currentIndex: currentIndex,

            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                label: "Wallet",
                icon: Icon(Icons.wallet),
              ),
              BottomNavigationBarItem(
                label: "Invoices",
                icon: Icon(Icons.receipt),
              ),
            ],
          ),

         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
         floatingActionButton: FloatingActionButton(
      backgroundColor: primaryColor,
      shape: const CircleBorder(),
onPressed: () async {
  final String? scannedValue = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const QrScannerScreen()),
  );

  
  if (scannedValue != null && context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Captured Code: $scannedValue"),
        backgroundColor: greenColor,
        behavior: SnackBarBehavior.floating,
      ),
    );
    print("Local Utilization: $scannedValue");
  }
},
      child: const Icon(Icons.qr_code_scanner, color: whiteColor, size: 30),
    ),
        );
      },
    );
  }
}
