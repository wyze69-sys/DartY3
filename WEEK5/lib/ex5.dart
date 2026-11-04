import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 70,
                color: const Color(0xFFE76F51),
                child: const Center(
                  child: Text(
                    'Welcome !',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Text(
                          'My hobbies',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF4A582),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Center(
                                child: Text(
                                  'Soccer',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFFBD4C10),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Center(
                                child: Text(
                                  'Flutter',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 70,
                color: const Color(0xFFE76F51),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
