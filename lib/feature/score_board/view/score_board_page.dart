import 'package:flutter/material.dart';
import 'package:guess_app/core/hive/hive_constants.dart';
import 'package:guess_app/core/hive/hive_manager.dart';

class ScoreBoardPage extends StatefulWidget {
  const ScoreBoardPage({super.key});

  @override
  _ScoreBoardPageState createState() => _ScoreBoardPageState();
}

//Dev Note: Normal text ve rakamları direk UI olan sayfada tutmayıp, welcome page de olduğu gibi ayrı class da belirlemek gerekiyor ama basit bir sayfa olduğu için gerek görmedim.
const String _title = "Skor Tablosu";

class _ScoreBoardPageState extends State<ScoreBoardPage> {
  late final List<int> scoreList;

  @override
  void initState() {
    scoreList = HiveManager().hiveRead(HiveGet().hiveDatabaseName);
    scoreList.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              _title,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: scoreList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("#${index + 1}"),
                        Text(scoreList[index].toString()),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
