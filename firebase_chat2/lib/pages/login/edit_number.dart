import 'dart:ui';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:firebase_chat2/components/logo.dart';
import 'package:firebase_chat2/pages/login/select_country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({Key? key}) : super(key: key);

  @override
  _EditNumberState createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  var _phoneNumber;
  Map<String, dynamic> data = {"name": "Brazil", "code": "+55"};
  Map<String, dynamic> dataResult = {"name": "Brazil", "code": "+55"};

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: Colors.transparent,
          middle: Text('Editar Número'),
          previousPageTitle: 'Voltar',
        ),
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('images/ocean.jpg'),
                fit: BoxFit.fill,
                opacity: 0.9,
              )),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Logo(
                      width: 80,
                      height: 80,
                      radius: 20,
                      opacity: 0.2,
                    ),
                    const SizedBox(width: 20),
                    Text('Verificação • Dupla',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)
                                .withOpacity(0.9),
                            fontSize: 30))
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Insira seu número de telefone',
                  style: TextStyle(
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),
                      fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                CupertinoListTile(
                  onTap: () async {
                    dataResult = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const SelectCountry()))) ??
                        data;
                    setState(() {
                      if (dataResult != {"name": "Brazil", "code": "+55"}) {
                        data = dataResult;
                      }
                    });
                  },
                  title: Text(
                    data['name'],
                    style: TextStyle(color: Colors.white.withOpacity(0.7)),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        data['code'],
                        style: TextStyle(
                            fontSize: 25, color: Colors.white.withOpacity(0.7)),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CupertinoTextField(
                        placeholder: 'Insira seu número',
                        controller: _phoneNumber,
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                            fontSize: 25,
                            color: CupertinoColors.secondaryLabel),
                      ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Em alguns instantes você receberá um código',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.7), fontSize: 13),
                ),
                Text(' por mensagem',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7), fontSize: 13)),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CupertinoButton.filled(
                      child: const Text('Enviar Código'), onPressed: () {}),
                )
              ],
            ),
          ),
        ));
  }
}
