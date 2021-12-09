import 'dart:math';
import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';
import 'help.dart';

class AutomotiveScreen extends StatefulWidget {
  const AutomotiveScreen({Key? key}) : super(key: key);

  @override
  _AutomotiveScreenState createState() => _AutomotiveScreenState();
}

class _AutomotiveScreenState extends State<AutomotiveScreen> {
  double _interestRate = 3.5;
  double _loanTerm = 60;
  double _principal = 25000;
  double _downPayment = 5000;

  String moneyFormat(double amount) {
    String price = amount.round().toString();
    if (price.length > 2) {
      var value = price;
      value = value.replaceAll(RegExp(r'\D'), '');
      value = value.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
      return "\$" + value;
    }
    return "\$" + price;
  }

  double getPayment() {
    double financed = _principal - _downPayment;
    if (_interestRate == 0) return financed / _loanTerm;
    double rate = _interestRate * .001;
    return (rate * financed) / (1 - pow(1 + rate, -_loanTerm));
  }

  double getInterest() {
    double payment = getPayment();
    return payment * _loanTerm - _principal + _downPayment;
  }

  double getCost() {
    return getPayment() * _loanTerm + _downPayment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Automotive Financing"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("Cost of Vehicle"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.cost());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _principal = value;
                }),
                min: _downPayment,
                max: 150000,
                decimalPlaces: 0,
                defaultValue: _principal,
                division: 30,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(65, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text("Interest Rate (%)"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.interestRate());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _interestRate = value;
                }),
                min: 0.0,
                max: 30.0,
                decimalPlaces: 2,
                defaultValue: _interestRate,
                division: 60,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(65, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text("Length of Loan (in months)"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.loanDuration());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _loanTerm = value;
                }),
                min: 1,
                max: 96,
                decimalPlaces: 0,
                defaultValue: _loanTerm,
                division: 95,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(65, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Down Payment + Vehicle Trade in Value"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.downPayment());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _downPayment = min(_principal, value);
                }),
                min: 0,
                max: max(_principal, 1000),
                decimalPlaces: 0,
                defaultValue: _downPayment,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(65, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Monthly Payment: " + moneyFormat(getPayment()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Total Interest Paid: " + moneyFormat(getInterest()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Total Vehicle Cost: " + moneyFormat(getCost()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showModal(Help helpItem) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return generateModal(context, helpItem.title, helpItem.text);
      },
    );
  }

  Container generateModal(BuildContext context, String title, String text) {
    return Container(
      height: 250,
      color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(title, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              Text(text, style: const TextStyle(fontSize: 16)),
              ElevatedButton(
                child: const Text('Close'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
