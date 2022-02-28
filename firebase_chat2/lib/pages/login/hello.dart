import 'dart:ui';

import 'package:firebase_chat2/components/start.dart';
import 'package:firebase_chat2/components/terms.dart';
import 'package:firebase_chat2/pages/blur_image_page.dart';
import 'package:firebase_chat2/pages/login/edit_number.dart';
import 'package:flutter/material.dart';

import '../../components/logo.dart';

class HelloWidget extends StatelessWidget {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlurrImagePage(
      body: [
        const Logo(
          height: 150,
          width: 150,
          radius: 40,
          opacity: 0.2,
        ),
        Text(
          'Olá',
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 60),
        ),
        Column(
          children: [
            Text('O Chat é um app',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 20)),
            Text('de produção independente',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 20)),
            Text('que busca garantir segurança',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 20)),
            Text('em suas conversas.',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 20)),
          ],
        ),
        Terms(
          onPressed: () {},
        ),
        LetsStart(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const EditNumber())));
          },
        ),
      ],
    );
  }
}
