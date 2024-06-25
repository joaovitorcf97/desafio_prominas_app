import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onTap;
  final bool loading;

  const AppButton({super.key, required this.onTap, required this.loading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(34),
          ),
          elevation: 0,
        ),
        onPressed: loading ? null : () => onTap(),
        child: loading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white),
              )
            : const Text(
                'Login',
                style: TextStyle(
                  color: Color(0xFFA73A1D),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
      ),
    );
  }
}
