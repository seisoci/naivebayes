import 'package:flutter/material.dart';
import 'package:naivebayes/models/Predict.dart';
import 'package:naivebayes/models/Predict.dart' as PredictModel;

import '../api/heroes_api.dart';

class PredictScreen extends StatefulWidget {
  const PredictScreen({super.key});

  @override
  State<PredictScreen> createState() => _PredictScreenState();
}

class _PredictScreenState extends State<PredictScreen> {
  String? selectedHero, selectHeroEnemy, selectTipeBuild, selectEmblem;
  late final Predict predict;
  late final List<PredictModel.Hero> heroes;
  late final List<String> tipeBuild;
  late final List<String> emblem;
  bool isPredictionComplete = false;
  String? resultWidgetResult;

  @override
  void initState() {
    HeroApi.fetchPredict().then((data) {
      setState(() {
        predict = data!;
        heroes = predict.hero ?? [];
        tipeBuild = predict.tipeBuild!;
        emblem = predict.emblem!;
        selectedHero = selectHeroEnemy = selectTipeBuild = selectEmblem = null;
        print('ID values: ${heroes.map((item) => item.id).toList()}');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: HeroApi.fetchPredict(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(backgroundColor: Colors.transparent),
          );
        }


        if (snapshot.data != null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Hero Prediction')),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  StyledDropdownButtonFormField(
                    hint: 'Select Your Hero',
                    value: selectedHero,
                    items: heroes.map((item) => item.nama.toString()).toList(),
                    onChanged: (changedValue) {
                      setState(() {
                        selectedHero = changedValue as String?;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  StyledDropdownButtonFormField(
                    hint: 'Select Enemy Hero',
                    value: selectHeroEnemy,
                    items: heroes.map((item) => item.nama.toString()).toList(),
                    onChanged: (changedValue) {
                      setState(() {
                        selectHeroEnemy = changedValue as String?;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  StyledDropdownButtonFormField(
                    hint: 'Select Build Type',
                    value: selectTipeBuild,
                    items: tipeBuild,
                    onChanged: (changedValue) {
                      setState(() {
                        selectTipeBuild = changedValue as String?;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  StyledDropdownButtonFormField(
                    hint: 'Select Emblem',
                    value: selectEmblem,
                    items: emblem,
                    onChanged: (changedValue) {
                      setState(() {
                        selectEmblem = changedValue as String?;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  StyledTextButton(
                    onPressed: () {
                      Map<String, dynamic> data = {
                        'hero_id': selectedHero,
                        'hero_musuh_id': selectHeroEnemy,
                        'tipe_build': selectTipeBuild,
                        'emblem': selectEmblem,
                      };
                      HeroApi.sendPostPredict(data).then((result) {
                        setState(() {
                          isPredictionComplete = true;
                          resultWidgetResult = result.toString();
                        });
                      });
                    },
                    text: 'Predict',
                  ),
                  if (isPredictionComplete) StyledResultWidget(resultWidgetResult!),
                ],
              ),
            ),
          );
        }

        return Center(
          child: Text(
            snapshot.error.toString(),
          ),
        );
      },
    );
  }
}

class StyledDropdownButtonFormField extends StatelessWidget {
  final String? hint;
  final String? value;
  final List<String> items;
  final void Function(String?)? onChanged;

  StyledDropdownButtonFormField({
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      value: value,
      items: items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: onChanged,
    );
  }
}

class StyledTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  StyledTextButton({
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xffF18265),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class StyledResultWidget extends StatelessWidget {
  final String isWin;

  StyledResultWidget(this.isWin);

  @override
  Widget build(BuildContext context) {
    Color bgColor = isWin == 'Menang' ? Colors.lightGreen : Colors.red;
    String resultText = isWin == 'Menang' ? 'Win' : 'Lose';

    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Text(
              resultText,
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            decoration: BoxDecoration(color: bgColor),
          ),
        ),
      ),
    );
  }
}
