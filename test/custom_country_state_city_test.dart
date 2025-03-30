import 'package:flutter_test/flutter_test.dart';
import 'package:custom_country_state_city/utils/country_utils.dart';
import 'package:custom_country_state_city/models/country.dart';
import 'package:flutter/services.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized(); // Important pour les tests avec assets

  setUpAll(() async {
    // Mock le chargement des assets pour les tests
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMessageHandler('flutter/assets', (message) async {
          return ByteData.view(Uint8List.fromList('{}'.codeUnits).buffer);
        });
  });

  test('coutries should be loaded', () async {
    final countries = await getAllCountries();
    expect(countries.isEmpty, false);
    expect(countries.first.runtimeType, Country);
  });

  test('country flag path should be correctly generated', () async {
    final countries = await getAllCountries();

    // Vérifie que la liste des pays n'est pas vide
    expect(countries.isEmpty, false);

    // Vérifie que le chemin du flag est correctement généré pour le premier pays
    final firstCountry = countries.first;
    final expectedFlagPath =
        'package:custom_country_state_city/assets/flags/${firstCountry.isoCode.toLowerCase()}.png';

    expect(firstCountry.flag, expectedFlagPath);
  });
}
