import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCartScreen extends StatefulWidget {
  const AddCartScreen({super.key});

  @override
  State<AddCartScreen> createState() => _AddCartScreenState();
}

class _AddCartScreenState extends State<AddCartScreen> {
  // all cart items
  final List<Map<String, dynamic>> _allCartItems = [
    {
      "productName": "Pullover",
      "productColor": "Black",
      "productSize": "L",
      "quantity": 1,
      "productPrice": 51,
      "productImage": "assets/images/black.jpg",
    },
    {
      "productName": "T-Shirt",
      "productColor": "Gray",
      "productSize": "L",
      "quantity": 1,
      "productPrice": 30,
      "productImage": "assets/images/grey.jpg",
    },
    {
      "productName": "Sport Dress",
      "productColor": "Black",
      "productSize": "M",
      "quantity": 1,
      "productPrice": 43,
      "productImage": "assets/images/black-1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom appBar
            _buildCustomAppBar(),
            // product listView
            _buildProductListView(),
            // total amount
            _buildTotalAmount(),
            // check out button
            _buildCheckOutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAppBar() {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'My Bag',
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProductListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _allCartItems.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        _allCartItems[index]['productImage'],
                        height: 125,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _allCartItems[index]['productName'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "Color:",
                                        style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${_allCartItems[index]['productColor']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Row(
                                    children: [
                                      const Text(
                                        "Size:",
                                        style: TextStyle(
                                          color: Colors.black26,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "${_allCartItems[index]['productSize']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          if (_allCartItems[index]['quantity'] >
                                              1) {
                                            _allCartItems[index]['quantity'] -=
                                                1;
                                            setState(() {});
                                          }
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child:
                                              const Icon(CupertinoIcons.minus),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        _allCartItems[index]['quantity']
                                            .toString(),
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      InkWell(
                                        onTap: () {
                                            _allCartItems[index]['quantity'] +=
                                                1;
                                            setState(() {});
                                        },
                                        child: Container(
                                          height: 30,
                                          width: 30,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 2,
                                                  spreadRadius: 1,
                                                ),
                                              ]),
                                          child:
                                              const Icon(CupertinoIcons.plus),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      "${_allCartItems[index]['productPrice'] * _allCartItems[index]['quantity']}\$",
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTotalAmount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total Amount:",
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          Text(
            "${_totalAmount.toString()}\$",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckOutButton() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red,
          minimumSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Congratulations!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
        child: const Text(
          "CHECK OUT",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  int get _totalAmount {
    return _allCartItems.fold<int>(
        0,
        (total, product) =>
            total + product['productPrice'] * product['quantity'] as int);
  }
}
