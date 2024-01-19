import 'package:flutter/material.dart';
import 'package:uts_rifqijovian/nota_screen.dart';
import 'package:uts_rifqijovian/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


List<Product> produkList = [];
List<Product> produkyangDibeli = [];


class _HomeScreenState extends State<HomeScreen> {
  int harga = 0;


  void dummyProduct() {
    produkList.add(Product(
        nama: 'Sempolan',
        deskripsi:
            "jajanan enak dan murah",
        harga: 35000,
        gambar: 'sempolan.jpg'));
    produkList.add(Product(
        nama: "Bakso Bakar",
        deskripsi:
            "Bakso yang ditusuk dan dibakar",
        harga: 120000,
        gambar: 'bakso.jpg'));
    produkList.add(Product(
        nama: "Telur Gulung",
        deskripsi:
            "Telur yang digulung di tusuk, lalu digoreng",
        harga: 60000,
        gambar: 'telur.jpg'));
    produkList.add(Product(
        nama: "Pempek",
        deskripsi:
            "Pempek enak khas Palembang",
        harga: 59000,
        gambar: 'pempek.jpg'));
    produkList.add(Product(
        nama: "Jasuke",
        deskripsi:
            "Jajanan jagung susu keju",
        harga: 300000,
        gambar: 'jasuke.jpg'));
    produkList.add(Product(
        nama: "Dimsum",
        deskripsi:
            "Dimsum enak, cocok buat cemilan",
        harga: 1000000,
        gambar: 'dimsum.jpg'));
  }


  void totalHarga() {
    harga = 0;
    for (int i = 0; i < produkyangDibeli.length; i++) {
      harga += produkyangDibeli[i].harga;
    }
  }


  Widget kontenList(
      String nama, String desc, int harga, String img, int index) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                produkyangDibeli.add(produkList[index]);
                totalHarga();
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/img/$img',
                  fit: BoxFit.fill,
                ),
              )),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Text('Detail Product'),
                        content: Container(height: 300, child: Column(children: [Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  'assets/img/$img',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 30,),
               Text(
              nama,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),SizedBox(height: 5,),
               Text(
            'Rp ${harga.toString()}',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),SizedBox(height: 30,),
              Text(desc, maxLines: 5,)],)));
                  });
            },
            child: Text(
              nama,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ),
          Text(
            'Rp ${harga.toString()}',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    if (produkList.isEmpty) {
      dummyProduct();
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 94, 78, 27),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Kontak'),
                          content: Container(
                              height: 500,
                              child: Text('Hubungi Nomor : 081256737865')),
                        );
                      });
                },
                icon: Icon(
                  Icons.contact_emergency,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Pesan'),
                          content: Container(
                              height: 500,
                              child: Text('Pesan pada email kami')),
                        );
                      });
                },
                icon: Icon(
                  Icons.chat,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Lokasi Kami'),
                          content: Container(
                              height: 500,
                              child: Text('Lokasi Kami di Semarang Tengah')),
                        );
                      });
                },
                icon: Icon(
                  Icons.location_on,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Layanan Pengaturan Akun'),
                          content: Container(
                              height: 500, child: Text('Setting akun profil')),
                        );
                      });
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Ubah Password'),
                          content: Container(
                              height: 500, child: Text('Ubah Password anda')),
                        );
                      });
                },
                icon: Icon(
                  Icons.password,
                  color: Colors.white,
                ))
          ],
          title: Text(
            'Produk',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
          ),
        ),
        body: SafeArea(
            child: Container(
          height: 0.95 * MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 600,
                  child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, crossAxisSpacing: 5),
                      children: List.generate(
                          produkList.length,
                          (index) => kontenList(
                              produkList[index].nama,
                              produkList[index].deskripsi,
                              produkList[index].harga,
                              produkList[index].gambar!,
                              index))),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Detail Product Transaksi'),
                                    content: Container(
                                        height: 500,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: List.generate(
                                                produkyangDibeli.length,
                                                (index) => ListTile(
                                                      trailing: IconButton(
                                                          onPressed: () {
                                                            produkyangDibeli
                                                                .removeAt(
                                                                    index);
                                                            Navigator.pop(
                                                                context);
                                                            totalHarga();
                                                            setState(() {});
                                                          },
                                                          icon: Icon(
                                                              Icons.close)),
                                                      title: Text(
                                                          produkyangDibeli[
                                                                  index]
                                                              .nama),
                                                      subtitle: Text(
                                                          produkyangDibeli[
                                                                  index]
                                                              .harga
                                                              .toString()),
                                                    )),
                                          ),
                                        )),
                                  );
                                });
                          },
                          icon: Icon(
                            Icons.list,
                            size: 35,
                            color: const Color.fromARGB(255, 94, 82, 27),
                          )),

                      SizedBox(
                        width: 120,
                        child: Column(
                          children: [
                            Text('Total'),
                            SizedBox(
                              height: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Payment();
                                }));
                              },
                              child: Text(
                                'Rp ${harga.toString()}',
                                style: TextStyle(fontSize: 18),
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Payment();
                            }));
                          },
                          icon: Icon(
                            Icons.money,
                            size: 35,
                            color: const Color.fromARGB(255, 94, 84, 27),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}


