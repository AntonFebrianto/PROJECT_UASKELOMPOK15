import 'package:flutter/material.dart';

class SearchBarInput extends StatelessWidget {
  const SearchBarInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 14, right: 14, bottom: 14),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          hintStyle: TextStyle(
            color: Colors.green[500],
          ),
          isDense: true,
          hintText: 'Cari lapangan',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(width: 10),
          ),
          prefixIcon: const Icon(Icons.search_rounded),
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
    );
  }
}
