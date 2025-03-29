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
}