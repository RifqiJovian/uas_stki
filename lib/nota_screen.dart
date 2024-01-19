import 'package:flutter/material.dart';
import 'package:uts_rifqijovian/home_screen.dart';
import 'package:uts_rifqijovian/main.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});


  @override
  State<Payment> createState() => _PaymentState();
}


class _PaymentState extends State<Payment> {
  String _username = '';
  int harga = 0;
  @override
  Widget build(BuildContext context) {
    void cekHarga() {
      harga = 0;
      for (int i = 0; i < produkyangDibeli.length; i++) {
        harga += produkyangDibeli[i].harga;
      }
    }


    @override
    void initState() {
      super.initState();
    }


    setState(() {
      _username = sp!.getString('username') ?? "";
      cekHarga();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 94, 52, 27),
        title: Text(
          'Detail Pembayaran',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Pembelian atas nama',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black54),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '$_username',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: List.generate(
                produkyangDibeli.length,
                (index) => ListTile(
                      title: Text(
                        produkyangDibeli[index].nama,
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Text(
                        produkyangDibeli[index].harga.toString(),
                        style: TextStyle(fontSize: 14),
                      ),
                    )),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'Total Bayar ',
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Rp $harga',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(const Color.fromARGB(255, 94, 73, 27))),
              onPressed: () {},
              child: Text(
                'Bayar Barang',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ))
        ],
      ))),
    );
  }
}
