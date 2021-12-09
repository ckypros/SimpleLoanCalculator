import 'dart:math';
import 'package:flutter/material.dart';
import 'package:input_slider/input_slider.dart';
import 'help.dart';

class MortgageScreen extends StatefulWidget {
  const MortgageScreen({Key? key}) : super(key: key);

  @override
  _MortgageScreenState createState() => _MortgageScreenState();
}

class _MortgageScreenState extends State<MortgageScreen> {
  double _interestRate = 3.5;
  double _loanTerm = 30;
  double _principal = 500000;
  double _downPayment = 100000;
  double _closingCostsPct = 2;
  double _propertyTaxRate = 2;

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
    double financed =
        _principal - _downPayment + _closingCostsPct * 0.01 * _principal;
    print(financed);
    if (_interestRate == 0) return financed / _loanTerm;
    double rate = _interestRate * .01 / 12;
    double months = _loanTerm * 12;
    return (rate * financed) / (1 - pow(1 + rate, -_loanTerm * 12));
  }

  double getInterest() {
    double payment = getPayment();
    return payment * _loanTerm * 12 -
        _principal +
        _downPayment -
        _closingCostsPct;
  }

  double getCost() {
    return getPayment() * _loanTerm * 12 + _downPayment;
  }

  double getAnnualPropertyTax() {
    return _propertyTaxRate * .01 * _principal;
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
        title: const Text("Mortgage Financing"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            ListTile(
              title: const Text("House Price"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.mortgageCost());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _principal = value;
                }),
                min: _downPayment,
                max: 1500000,
                decimalPlaces: 0,
                defaultValue: _principal,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(75, 25),
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
                  showModal(Help.mortgageRate());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _interestRate = value;
                }),
                min: 2.0,
                max: 10.0,
                decimalPlaces: 2,
                defaultValue: _interestRate,
                division: 64,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(75, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text("Length of Loan (in years)"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.mortgagePeriod());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _loanTerm = value;
                }),
                min: 1,
                max: 30,
                decimalPlaces: 0,
                defaultValue: _loanTerm,
                division: 30,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(75, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Down Payment"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.mortgageDownPayment());
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
                textFieldSize: const Size(75, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Closing Costs (% of House Price)"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.mortgageClosingCosts());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _closingCostsPct = value;
                }),
                min: 0,
                max: 10,
                decimalPlaces: 2,
                defaultValue: _closingCostsPct,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(75, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text("Property Tax Rate (% of House Price)"),
              trailing: IconButton(
                icon: const Icon(
                  Icons.help,
                  color: Colors.deepOrange,
                ),
                onPressed: () {
                  showModal(Help.mortgagePropertyTax());
                },
              ),
              subtitle: InputSlider(
                onChange: (value) => setState(() {
                  _propertyTaxRate = value;
                }),
                min: 0,
                max: 4,
                decimalPlaces: 2,
                defaultValue: _propertyTaxRate,
                activeSliderColor: Colors.teal,
                inactiveSliderColor: Colors.teal[100],
                textFieldSize: const Size(75, 25),
                borderColor: Colors.deepOrange,
                textFieldStyle: const TextStyle(
                    color: Colors.deepOrange, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              color: Colors.teal,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Mortgage Payment: " + moneyFormat(getPayment()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Total Interest Paid: " + moneyFormat(getInterest()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Total Mortgage Cost: " + moneyFormat(getCost()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Annual Property Taxes: " +
                          moneyFormat(getAnnualPropertyTax()),
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Actual Monthly Payment: " +
                          moneyFormat(getPayment() + getAnnualPropertyTax() / 12),
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
