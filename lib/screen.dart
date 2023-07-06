import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PrimeUts extends StatefulWidget {
  const PrimeUts({Key? key}) : super(key: key);

  @override
  State<PrimeUts> createState() => _PrimeUts();
}

class _PrimeUts extends State<PrimeUts> {
  int angka = 1;

  void tekanAku() {
    setState(() {
      angka = (angka + 2) % 46;
      if (angka.isEven) {
        tekanAku(); // Jika angka baru yang ditambahkan adalah genap, panggil tekanAku() lagi untuk mendapatkan angka ganjil berikutnya.
      }
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    if (number <= 3) {
      return true;
    }
    for (int i = 2; i <= sqrt(number); i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz 1 dan UTS PAPB',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: tekanAku,
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text('Yanuar efendhi(20104410063)'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$angka',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                  fontWeight:
                      isPrime(angka) ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Text(
                'Angka adalah bilangan primer? ${isPrime(angka)}',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}