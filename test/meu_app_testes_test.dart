import 'package:meu_app_testes/class/viacep.dart';
import 'package:meu_app_testes/meu_app_testes.dart';
import 'package:meu_app_testes/meu_app_testes.dart' as app;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'meu_app_testes_test.mocks.dart';

@GenerateMocks([MokViaCep])
void main() {
  test('calculate', () {
    expect(calculate(), 42);
  });

  test('Retornar CEP', () async {
    // ViaCEP viacep = ViaCEP();
    // var body = await viacep.retornarCEP("01001000");
    var body = await app.retornarCEP("01001000");
    print(body);
    expect(body["logradouro"], equals("Praça da Sé"));
  });

  test('Retornar CEP Mock', () async {
    MockMokViaCep mockcep = MockMokViaCep();
    when(mockcep.retornarCEP("01001000"))
        .thenAnswer((realInvocation) => Future.value({
              "cep": "01001-000",
              "logradouro": "Praça da Sé",
              "complemento": "lado ímpar",
              "bairro": "Sé",
              "localidade": "São Paulo",
              "uf": "SP",
              "ibge": "3550308",
              "gia": "1004",
              "ddd": "11",
              "siafi": "7107"
            }));

    var body = await app.retornarCEP("01001000");
    print(body);
    expect(body["logradouro"], equals("Praça da Sé"));
  });
}

class MokViaCep extends Mock implements ViaCEP {}
