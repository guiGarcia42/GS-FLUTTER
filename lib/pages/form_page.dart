import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

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
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua idade',
        labelText: 'Idade',
        border: OutlineInputBorder(),
      ),
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
        setState(() {});
      },
    );
  }

  _buildWeight() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe seu peso (kg)',
        labelText: 'Peso',
        border: OutlineInputBorder(),
      ),
    );
  }

  _buildHeight() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua altura (cm)',
        labelText: 'Altura',
        border: OutlineInputBorder(),
      ),
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
        onPressed: () async {},
      ),
    );
  }
}
