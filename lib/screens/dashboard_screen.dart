// lib/screens/dashboard_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart'; // Import fl_chart
import 'package:budget_mate_app/models/transaction.dart';
import 'package:budget_mate_app/models/category.dart';
import 'package:budget_mate_app/screens/transaction_input_screen.dart'; // Import layar input transaksi

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedMonthIndex = 5; // Juni (indeks 5)
  final List<String> _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expenseTransactions = _currentMonthTransactions.where((tx) => tx.isExpense).toList();
    final incomeTransactions = _currentMonthTransactions.where((tx) => !tx.isExpense).toList();

    double totalExpense = expenseTransactions.fold(0.0, (sum, tx) => sum + tx.amount);
    double totalIncome = incomeTransactions.fold(0.0, (sum, tx) => sum + tx.amount);

    const Color lemonColor = Color(0xFFC4E860);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios, size: 18, color: Colors.white),
              onPressed: () {
                setState(() {
                  _selectedMonthIndex = (_selectedMonthIndex - 1 + _months.length) % _months.length;
                });
              },
            ),
            Text(
              _months[_selectedMonthIndex],
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white),
              onPressed: () {
                setState(() {
                  _selectedMonthIndex = (_selectedMonthIndex + 1) % _months.length;
                });
              },
            ),
          ],
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.7),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          tabs: const [
            Tab(text: 'Pengeluaran'),
            Tab(text: 'Pemasukan'),
          ],
        ),
        backgroundColor: lemonColor,
        elevation: 0,
        actions: const [
          SizedBox(width: 48),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TransactionInputScreen()),
          );
        },
        backgroundColor: lemonColor,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: lemonColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: lemonColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Alifa xxxxx',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'ID : 1717224',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // ListTiles tetap
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTabContent(context, isExpenseTab: true, transactions: expenseTransactions, totalAmount: totalExpense),
          _buildTabContent(context, isExpenseTab: false, transactions: incomeTransactions, totalAmount: totalIncome),
        ],
      ),
    );
  }

  List<Transaction> get _currentMonthTransactions {
    return _allTransactions.where((tx) {
      return tx.date.month == (_selectedMonthIndex + 1) && tx.date.year == 2025;
    }).toList();
  }

  // _buildTabContent dan _getLineChartSpots tetap
}
