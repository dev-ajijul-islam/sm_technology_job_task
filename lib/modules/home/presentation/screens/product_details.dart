import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sm_technology_job_task/data/models/product_model.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel product = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Service Detail"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(product.image ?? '', height: 250, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("\$${product.price}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1868F2))),
              ],
            ),
            Text(product.stock! > 0 ? "In Stock" : "Out of Stock", style: TextStyle(color: Colors.green)),
            SizedBox(height: 20),
            Wrap(
              spacing: 10, runSpacing: 10,
              children: [
                DetailChip(label: product.category ?? "General"),
                DetailChip(label: product.brand ?? "No Brand"),
                DetailChip(label: "Weight: ${product.weight ?? 0}"),
                DetailChip(label: "Dim: ${product.dimensions ?? 'N/A'}"),
              ],
            ),
            SizedBox(height: 25),
            Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(product.description ?? "No description available", style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),

    );
  }
}


class DetailChip extends StatelessWidget {
  final String label;

  const DetailChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF7B78ED).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF7B78ED).withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF7B78ED),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}