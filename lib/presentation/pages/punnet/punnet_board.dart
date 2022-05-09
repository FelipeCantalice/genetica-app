import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:genetica/presentation/controllers/quadro_punnet_controller.dart';
import 'package:provider/provider.dart';

class PunnetBoard extends StatefulWidget {
  const PunnetBoard({Key? key}) : super(key: key);

  @override
  State<PunnetBoard> createState() => _PunnetBoardState();
}

class _PunnetBoardState extends State<PunnetBoard> {
  final _genotipo1Controller = TextEditingController(text: '');
  final _genotipo2Controller = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();

  void clearForm() {
    _genotipo1Controller.clear();
    _genotipo2Controller.clear();
    _formKey.currentState?.reset();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QuadroPunnetController>(context);
    final theme = Theme.of(context);

    Widget _buildResultBoard() {
      final provider =
          Provider.of<QuadroPunnetController>(context, listen: true);
      if (provider.resultado.isEmpty) {
        return const Text('Nenhum resultado');
      }

      // build gridview 2 ROW
      final gridView = GridView.count(
        shrinkWrap: false,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 1,
        crossAxisCount: 2,
        children: List.generate(
          provider.resultado.length,
          (index) => Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: theme.primaryColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Text(
                provider.resultado[index].simbolo,
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ),
      );
      return gridView;
    }

    Form _buildForm() {
      return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Genotipo 1',
                ),
                controller: _genotipo1Controller,
                maxLength: 2,
                validator:
                    ValidationBuilder().maxLength(2).minLength(2).build(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                maxLength: 2,
                decoration: const InputDecoration(
                  labelText: 'Genotipo 2',
                ),
                controller: _genotipo2Controller,
                validator:
                    ValidationBuilder().maxLength(2).minLength(2).build(),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.setGenotipo(_genotipo1Controller.text, 0);
                      controller.setGenotipo(_genotipo2Controller.text, 1);
                      controller.calcular();
                    }
                  },
                  child: const Text('Calcular'),
                ),
              ),
            ]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Punnet Board'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Insira os alelos abaixo:',
              style: theme.textTheme.titleSmall,
            ),
            _buildForm(),
            const SizedBox(height: 10),
            Expanded(child: _buildResultBoard()),
          ],
        ),
      ),
    );
  }
}
