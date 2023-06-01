import 'package:flutter/material.dart';

class interestcalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SIForm(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green[900],
        accentColor: Colors.white,
        hintColor: Colors.white,
        errorColor: Colors.yellowAccent,
      ),
    );
  }
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var currencies = ['Rupees', 'Dollars', 'Pounds'];
  var currency = '';
  var displayResult = '';
  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currency = currencies[0];
  }

  TextEditingController pamt = TextEditingController();
  TextEditingController int = TextEditingController();
  TextEditingController term = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Icon(
                  Icons.monetization_on,
                  color: Colors.lightGreen,
                  size: 250.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                child: TextFormField(
                  controller: pamt,
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter principal amount.';
                  },
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Principal Amount',
                      hintText: 'Ex: Enter principal amount:Rs 12000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                child: TextFormField(
                  controller: int,
                  validator: (String value) {
                    if (value.isEmpty) return 'Please enter rate of interest.';
                  },
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Rate Of Interest',
                      hintText: 'Ex: In Percent: 5.27',
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        controller: term,
                        validator: (String value) {
                          if (value.isEmpty) return 'Please enter time period.';
                        },
                        style: textStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Term',
                            labelStyle: textStyle,
                            hintText: 'Ex: Time in years',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    Container(
                      width: 3.0 * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        items: currencies.map((String dditem) {
                          return DropdownMenuItem<String>(
                            child: Text(dditem),
                            value: dditem,
                          );
                        }).toList(),
                        onChanged: (String newvalue) {
                          _onDropDownItemSelected(newvalue);
                        },
                        value: currency,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 1.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      elevation: 5.0,
                      color: Colors.green,
                      child: Text(
                        'Calculate',
                        style: textStyle,
                      ),
                      onPressed: () {
                        setState(() {
                          if (formkey.currentState.validate()) {
                            this.displayResult = _calculatetotal();
                          }
                        });
                      },
                    )),
                    Container(
                      width: 3.0 * 5,
                    ),
                    Expanded(
                        child: RaisedButton(
                      child: Text(
                        'Reset',
                        style: textStyle,
                      ),
                      color: Colors.black,
                      elevation: 5.0,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                    )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0 * 2),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newvalue) {
    setState(() {
      this.currency = newvalue;
    });
  }

  String _calculatetotal() {
    double principal = double.parse(pamt.text);
    double interest = double.parse(int.text);
    double years = double.parse(term.text);
    double total = principal + (principal * interest * years) / 100;

    String res =
        "After $years years, your investment will be worth $total $currency";
    return res;
  }

  void _reset() {
    pamt.text = '';
    int.text = '';
    term.text = '';
    displayResult = '';
    currency = currencies[0];
  }
}
