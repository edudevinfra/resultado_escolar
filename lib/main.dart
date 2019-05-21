import 'package:flutter/material.dart';

main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ResultadoEscolar()));

class ResultadoEscolar extends StatefulWidget {
  @override
  _ResultadoEscolarState createState() => _ResultadoEscolarState();
}
class _ResultadoEscolarState extends State<ResultadoEscolar> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController notaAController = TextEditingController();
  TextEditingController notaBController = TextEditingController();
  TextEditingController notaCController = TextEditingController();
  TextEditingController resultadoController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _resetField() {
    nomeController.text = "";
    notaAController.text = "";
    notaBController.text = "";
    notaCController.text = "";
    resultadoController.text = "";
  }

  void _calcularMedia() {
    double notaA = double.parse(notaAController.text);
    double notaB = double.parse(notaBController.text);
    double notaC = double.parse(notaCController.text);

    double media = (notaA + notaB + notaC) / 3;
    if (media >= 90.0 && media <= 100.0) {
      resultadoController.text = "A - Aprovado";

    }
    if (media >= 75.0 && media < 90.0) {
      resultadoController.text = "B - Aprovado";
      TextStyle(color: Colors.green, fontSize: 20);
    }
    if (media >= 60.0 && media < 75.0) {
      resultadoController.text = "C - Aprovado";
      TextStyle(color: Colors.yellowAccent, fontSize: 20);
    }
    if (media >= 40.0 && media < 60.0) {
      resultadoController.text = "D - Reprovado";
      TextStyle(color: Colors.red, fontSize: 20);
    }
    if (media < 40.0 && media > 0.0) {
      resultadoController.text = "E - Reprovado";
      TextStyle(color: Colors.redAccent, fontSize: 20);
    }
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('BOLETIM'),
      centerTitle: true,
      backgroundColor: Colors.blue[200],
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _resetField,
        )
      ],
    );

    Image imgLogo = Image.asset(
      'assets/images/logo.png',
      height: 120,
      width: 120,
    );

    TextStyle styleField = TextStyle();

    TextFormField nome = TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nome",
        labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: nomeController,
      validator: (value) {
        if (value.isEmpty) {
          return "Digite seu nome";
        }
      },
    );

    Container containerFied = Container(
      width: 100.0,
    );

    Text textNotaA = Text(
      'NOTA A',
      style: new TextStyle(
          fontSize: 20.0,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto"),
      textAlign: TextAlign.center,
    );

    Text textNotaB = Text(
      'NOTA B',
      style: new TextStyle(
          fontSize: 20.0,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto"),
      textAlign: TextAlign.center,
    );

    Text textNotaC = Text(
      'NOTA C',
      style: new TextStyle(
          color: Colors.blue,
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto"),
      textAlign: TextAlign.center,
    );

    TextFormField notaA = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        //labelText: "NOTA A",
        labelStyle: TextStyle(
          color: Colors.blue,
          fontSize: 20,
        ),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaAController,
      validator: (value) {
        if (value.isEmpty) {
          return "Digite sua nota";
        }
      },
    );

    TextFormField notaB = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // labelText: "NOTA B",
        labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaBController,
      validator: (value) {
        if (value.isEmpty) {
          return "Digite sua nota";
        }
      },
    );

    TextFormField notaC = TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        // labelText: "NOTA C",
        labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: notaCController,
      validator: (value) {
        if (value.isEmpty) {
          return "Digite sua nota";
        }
      },
    );

    Row rowText = Row(
      children: <Widget>[
        Expanded(
          child: textNotaA,
        ),
        Expanded(
          child: textNotaB,
        ),
        Expanded(
          child: textNotaC,
        ),
      ],
    );

    Row row = Row(
      children: <Widget>[
        Expanded(
          child: notaA,
        ),
        Expanded(
          child: notaB,
        ),
        Expanded(
          child: notaC,
        ),
      ],
    );

    Container containerRowText = Container(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: rowText,
      ),
    );

    Container containerRow = Container(
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: row,
      ),
    );

    RaisedButton btnCalcular = RaisedButton(
      onPressed: () {
        if (_formkey.currentState.validate()) {
          _calcularMedia();
        }
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Text('CALCULAR',
          style: new TextStyle(
            fontSize: 20.0,
            color: const Color(0xFFffffff),
          )),
      color: Colors.blue[400],
    );

    Container containerBtn = Container(
      height: 60,
      child: btnCalcular,
    );

    Padding padding = Padding(
      padding: EdgeInsets.only(top: 60.0, bottom: 60.0),
      child: containerBtn,
    );

    TextFormField resultado = TextFormField(
      enabled: false,
      // Bloqueia campo para edição
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Conceito",
        labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
        border: OutlineInputBorder(),
      ),
      textAlign: TextAlign.center,
      style: styleField,
      controller: resultadoController,
    );

    Text developer = Text(
      'Desenvolvido por Eduardo Barros da Silva',
      style: new TextStyle(
          fontSize: 16.0,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto"),
      textAlign: TextAlign.center,
    );

    Column column = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        imgLogo,
        Divider(),
        nome,
        Divider(),
        containerRowText,
        containerRow,
        Divider(),
        resultado,
        padding,
        developer
      ],
    );

    Form form = Form(
      child: column,
      key: _formkey,
    );

    SingleChildScrollView singleChildScrollView = SingleChildScrollView(
      child: form,
      padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: singleChildScrollView,
    );

    return scaffold;
  }
}
