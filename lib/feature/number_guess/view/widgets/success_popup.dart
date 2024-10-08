import 'package:flutter/material.dart';
import 'package:guess_app/constants/theme/project_colors.dart';

//Dev Not: Tek yerde kullanıldığı için bu metodu temizlemedim :)
showCongratulationsPopup(BuildContext context, int predictionSize) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: ProjectGuessNumberColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'TEBRİKLER',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48.0),
                child: Text(
                  '${predictionSize.toString()} Deneme ile sayıyı buldunuz',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: ProjectGuessNumberColors.pink,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Kapat'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
