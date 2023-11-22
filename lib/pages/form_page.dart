import 'package:flutter/material.dart';
import 'package:gs_2/pages/result_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final ageController =  TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();


  var tipoGenero = '';
  var typeActivityLevel = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorias diárias'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildAge(),
                const SizedBox(height: 20),
                _buildGender(),
                const SizedBox(height: 20),
                _buildWeight(),
                const SizedBox(height: 20),
                _buildHeight(),
                const SizedBox(height: 20),
                _buildActivityLevel(),
                const SizedBox(height: 20),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAge() {
    return TextFormField(
      controller: ageController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua idade',
        labelText: 'Idade',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe sua Idade';
        }
        if (int.parse(value) < 0 || int.parse(value) > 80) {
          return 'A idade deve ser positiva e menor que 80';
        }
        return null;
      },
    );
  }

  _buildGender() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Informe seu gênero',
        labelText: 'Gênero',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(
          value: 'male',
          child: Text('Masculino'),
        ),
        DropdownMenuItem(
          value: 'female',
          child: Text('Feminino'),
        ),
      ],
      onChanged: (value) {
        tipoGenero = value!;
      },
    );
  }

  _buildWeight() {
    return TextFormField(
      controller: weightController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe seu peso (kg)',
        labelText: 'Peso',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe seu Peso';
        }
        if (int.parse(value) < 40 || int.parse(value) > 160) {
          return 'O peso deve ser entre 40 e 160';
        }
        return null;
      },
    );
  }

  _buildHeight() {
    return TextFormField(
      controller: heightController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua altura (cm)',
        labelText: 'Altura',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe sua altura';
        }
        if (int.parse(value) < 130 || int.parse(value) > 230) {
          return 'A altura deve ser entre 130cm e 230cm';
        }
        return null;
      },
    );
  }

  _buildActivityLevel() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Informe seu nível de atividade física',
        labelText: 'Nível de atividade',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(
          value: 'level_1',
          child: Text('Sedentário: pouco ou nenhum exercício'),
        ),
        DropdownMenuItem(
          value: 'level_2',
          child: Text('Exercício 1-3 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_3',
          child: Text('Exercício 4-5 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_4',
          child: Text('Exercício diário ou exercício intenso 3-4 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_5',
          child: Text('Exercício intenso 6-7 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_6',
          child:
              Text('Exercício muito intenso diariamente, ou trabalho físico'),
        ),
      ],
      onChanged: (value) {
        typeActivityLevel = value!;
      },
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Calcular',
            style: TextStyle(fontSize: 20),
          ),
        ),
        onPressed: () async {

          final isValid = _formKey.currentState!.validate();

          if (isValid) {
            final age = int.parse(ageController.text);
            final weight = int.parse(weightController.text);
            final height = int.parse(heightController.text);
            final activityLevel = typeActivityLevel;
            final genre = tipoGenero;

            print(age);
            print(weight);
            print(height);

            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => ResultPage(age: age, weight: weight, height: height, activityLevel: activityLevel, genre: genre)));
          }
        },
      ),
    );
  }
}
