import 'dart:convert';

import 'package:cupertino_list_tile/cupertino_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataCatch;
  List<dynamic>? data;
  var searchController = TextEditingController();
  var searchValue = '';

  @override
  void initState() {
    _getCountryData();
    super.initState();
  }

  Future _getCountryData() async {
    final String response =
        await rootBundle.loadString('assets/CountryCodes.json');
    dataCatch = await jsonDecode(response) as List<dynamic>;
    setState(() {
      data = dataCatch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text(
              'Selecione o País',
              style: TextStyle(
                color: Colors.black.withOpacity(1),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoSearchTextField(
                onChanged: (value) {
                  setState(() {
                    searchValue = value;
                  });
                },
                controller: searchController,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(data != null
                  ? data!
                      .where((e) => e['name']
                          .toString()
                          .toLowerCase()
                          .contains(searchValue.toLowerCase()))
                      .map((e) => CupertinoListTile(
                            onTap: () {
                              print(e['name']);
                              Navigator.pop(context,
                                  {"name": e['name'], "code": e['dial_code']});
                            },
                            title: Text(e['name']),
                            trailing: Text(e['dial_code']),
                          ))
                      .toList()
                  : const [CircularProgressIndicator()]))
        ],
      ),
    );
  }
}
