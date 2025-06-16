import 'package:flimsa01mvp/features/subscription/subscription_summary.dart';
import 'package:flutter/material.dart';

class SubscriptionPage extends StatefulWidget {
  @override
  _SubscriptionPage createState() => _SubscriptionPage();
}

class _SubscriptionPage extends State<SubscriptionPage> {
  int _selectedPlan = 0;

  final List<Map<String, Object>> plans = [
    {
      'price': '\$2.99',
      'features': [
        'Watch all you want.',
        'Allows streaming of 4K.',
        'Video & Audio Quality is Better.',
      ],
      'title': 'Basic Plan',
    },
    {
      'price': '\$4.99',
      'features': [
        'Watch all you want. Ad-free.',
        'Allows streaming of 4K.',
        'Video & Audio Quality is Better.',
      ],
      'title': 'Premium Plan',
    },
  ];

  void _onPlanTap(int index) {
    setState(() => _selectedPlan = index);

    final plan = plans[index];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionSummary(
          title: plan['title'] as String,
          price: plan['price'] as String,
          features: List<String>.from(plan['features'] as List),
        ),
      ),
    );
  }

  Widget buildPlanCard(int index) {
    final isSelected = _selectedPlan == index;
    final plan = plans[index];
    final features = List<String>.from(plan['features'] as List);

    return GestureDetector(
      onTap: () => _onPlanTap(index),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 44, 44, 44),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.grey.shade800,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${plan['price']}/month',
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(color: Colors.white30, thickness: 2),
            const SizedBox(height: 8),
            ...features.map(
              (feature) => Row(
                children: [
                  const Icon(Icons.check, color: Colors.white, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      feature,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Subscription',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enjoy watching Full-HD anime, without restrictions and without ads',
                style: TextStyle(color: Colors.white70, fontSize: 16),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),
              buildPlanCard(0),
              buildPlanCard(1),
            ],
          ),
        ),
      ),
    );
  }
}
