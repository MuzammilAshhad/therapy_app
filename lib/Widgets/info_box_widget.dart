import 'package:flutter/material.dart';

// ------------ REUSABLE INFO BOX WIDGET ------------
Widget infoBox(String title, String value) {
  return Container(
    height: 60,
    width: 350,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 6,
          offset: const Offset(2, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF0F7C8E),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF0F7C8E),
              fontSize: 16,
            ),
          ),
        ),
      ],
    ),
  );
}

