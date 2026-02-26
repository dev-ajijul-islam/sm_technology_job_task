import 'package:flutter/material.dart';

class ServiceTabBar extends StatelessWidget {
  const ServiceTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildTab("Ongoing", true),
        const SizedBox(width: 12),
        _buildTab("Upcoming", false),
      ],
    );
  }

  Widget _buildTab(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1868F2) : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}