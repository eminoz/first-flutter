import 'package:flutter/material.dart';

class IGTimeline extends StatelessWidget {
  final String imagelink;

  const IGTimeline({
    Key? key,
    required this.imagelink,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          height: 50,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Column(
                    children: [
                      Icon(
                        Icons.account_circle,
                        size: 40,
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kullanıcı Adı',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Konum'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.more_vert),
                ],
              ),
            ],
          ),
        ),

        Container(
          height: 200,
          child: Center(
            child: Image.network(imagelink),
          ),
        ),
        const SizedBox(height: 10), // Boşluk ekleyen Size
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Column(
                  children: [
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Colors.red,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Icon(Icons.comment_outlined, size: 30),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Icon(Icons.share, size: 30),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.bookmark_border, size: 30),
              ],
            ),
          ],
        ),
        Container(
          child: const Row(
            children: [
              Text("100 likes", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Container(
          child: const Row(
            children: [
              Text("Kullanıcı Adı",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(width: 10),
              Text("Bu bir açıklamadır."),
            ],
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
