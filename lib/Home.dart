import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _controllerAlcool = TextEditingController();
  final TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);


    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado =
        "Número inválido! Por favor, digite um número maior que 0 e com [.]";
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
        }else{
        setState(() {
        _textoResultado = "Melhor abastecer com alcool";
        });

        }

      _limparCampos();

        }
        }

        void _limparCampos(){
          _controllerAlcool.text = "";
          _controllerGasolina.text = "";
        }

            @override
            Widget build(BuildContext context)
        {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Álcool ou gasolina"),
              backgroundColor: Colors.blue,
            ),
            body: Container(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: Image.asset("images/logo.png"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text(
                        "Saiba qual a melhor opção para abastecer seu carro",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                      const InputDecoration(
                          labelText: "Preço Alcool, ex: 1.59"),
                      style: const TextStyle(fontSize: 22),
                      controller: _controllerAlcool,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Preço Gasolina, ex: 3.59"),
                      style: const TextStyle(fontSize: 22),
                      controller: _controllerGasolina,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                            padding:
                            MaterialStateProperty.all(const EdgeInsets.all(10)),
                          ),
                          onPressed: _calcular,
                          child: const Text(
                            "Calcular",
                            style: TextStyle(fontSize: 20),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        _textoResultado,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      }
