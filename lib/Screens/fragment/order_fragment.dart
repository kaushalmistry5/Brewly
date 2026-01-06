import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pickup_order.dart';

class CoffeeOrderPage extends StatefulWidget {
  const CoffeeOrderPage({super.key});

  @override
  State<CoffeeOrderPage> createState() => _CoffeeOrderPageState();
}

class _CoffeeOrderPageState extends State<CoffeeOrderPage> {
  bool isDeliverSelected = true;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _deliveryToggle(),
            const SizedBox(height: 24),
            _addressSection(),
            const SizedBox(height: 16),
            const Divider(height: 32),
            _coffeeItem(),
            const SizedBox(height: 20),
            _discountCard(),
            const SizedBox(height: 24),
            _paymentSummary(),
            const SizedBox(height: 120),
          ],
        ),
      ),
      bottomNavigationBar: _bottomBar(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Order',
        style: GoogleFonts.sora(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _deliveryToggle() {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          _toggleBtn('Deliver', isDeliverSelected, () {
            setState(() => isDeliverSelected = true);
          }),
          _toggleBtn('Pick Up', !isDeliverSelected, () {
            setState(() => isDeliverSelected = false);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PickupOrderPage(),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: active ? const Color(0xFFB37A4C) : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text(
            text,
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 12),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(fontSize: 12, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _addressAction(Icons.edit, 'Edit Address'),
            const SizedBox(width: 12),
            _addressAction(Icons.note_alt_outlined, 'Add Note'),
          ],
        ),
      ],
    );
  }

  Widget _addressAction(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.sora(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _coffeeItem() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/images/coffee_menu1.png',
            width: 64,
            height: 64,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Caffe Mocha',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Deep Foam',
                style: GoogleFonts.sora(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
        _qtyBtn(Icons.remove, () {
          if (quantity > 1) setState(() => quantity--);
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            quantity.toString(),
            style: GoogleFonts.sora(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        _qtyBtn(Icons.add, () {
          setState(() => quantity++);
        }),
      ],
    );
  }

  Widget _qtyBtn(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: const Color(0xFFF2F2F2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 18),
      ),
    );
  }

  Widget _discountCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE0E0E0)),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '1 Discount is Applies',
              style: GoogleFonts.sora(fontSize: 14),
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _paymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        _row('Price', '\$4.53'),
        const SizedBox(height: 8),
        _row('Delivery Fee', '\$1.0', old: '\$2.0'),
      ],
    );
  }

  Widget _row(String label, String value, {String? old}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.sora(fontSize: 14)),
        Row(
          children: [
            if (old != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  old,
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
              ),
            Text(
              value,
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bottomBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_wallet_outlined),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Cash/Wallet',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '\$5.53',
                style: GoogleFonts.sora(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFB37A4C),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 52,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB37A4C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Order',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}