import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<Map<String, dynamic>> dummyProducts = [
    {
      'name': 'Top Up Diamond Mobile Legends',
      'amount': 100,
      'price': 'IDR 50.000',
      'icon': Icons.diamond_outlined
    },
    {
      'name': 'Jual Beli Akun Mobile Legends',
      'tier': 'Mythic',
      'skins': 567,
      'price': 'IDR 200.000',
      'icon': Icons.person
    },
    {
      'name': 'Voucher Google Play',
      'amount': 50,
      'price': 'IDR 75.000',
      'icon': Icons.play_circle_fill
    },
    // dapat menambah data
  ];

  bool isListVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Selamat Datang di SadStore',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.cyanAccent,
            ],
          ),
        ),
        //kolum untuk memasukan list
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isListVisible = true;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
              ),
              child: Text('Show Products'),
            ),
            Visibility(
              visible: isListVisible,
              child: Card(
                margin: EdgeInsets.all(8.0),
                color: Colors.grey[800],
                child: Column(
                  children: [
                    for (var product in dummyProducts)
                      ExpansionTile(
                        tilePadding: EdgeInsets.all(8.0),
                        leading: Icon(
                          product['icon'],
                          color: Colors.white,
                        ),
                        title: Text(
                          product['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                        children: [
                          if (product['amount'] != null)
                            ListTile(
                              title: Text(
                                'Amount: ${product['amount']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          if (product['tier'] != null)
                            ListTile(
                              title: Text(
                                'Tier: ${product['tier']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          if (product['skins'] != null)
                            ListTile(
                              title: Text(
                                'Skins: ${product['skins']}',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ListTile(
                            title: Text(
                              'Price: ${product['price']}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isListVisible = false;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[800],
              ),
              child: Text('Close'),
            ),
          ],
        ),
      ),
      //tombol logout
      floatingActionButton: Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {
            // Lakukan navigasi ke halaman awal
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.logout),
        ),
      ),
    );
  }
}
