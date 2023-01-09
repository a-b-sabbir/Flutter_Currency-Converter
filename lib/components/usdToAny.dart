import 'package:currency_converter/functions/fetchrates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UsdToAny extends StatefulWidget {
  final rates;
  final Map currencies;

  const UsdToAny({
    super.key,
    this.rates,
    required this.currencies,
  });

  @override
  State<UsdToAny> createState() => _UsdToAnyState();
}

class _UsdToAnyState extends State<UsdToAny> {
  TextEditingController usdController = TextEditingController();
  String dropdownValue = 'AUD';
  String answer = 'Converted Currency will be shown here';

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('USD to Any Currency'),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              key: ValueKey('usd'),
              controller: usdController,
              decoration: InputDecoration(hintText: 'Enter USD'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                Expanded(
                    child: DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconSize: 25,
                  elevation: 16,
                  isExpanded: true,
                  underline: Container(
                    height: 2,
                    color: Colors.grey.shade400,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: widget.currencies.keys
                      .toSet()
                      .toList()
                      .map<DropdownMenuItem<String>>((myvaluesForDropdown) {
                    return DropdownMenuItem<String>(
                      value: myvaluesForDropdown,
                      child: Text(myvaluesForDropdown),
                    );
                  }).toList(),
                )),
                SizedBox(
                  width: 10.0,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        answer = usdController.text +
                            ' USD = ' +
                            convertusd(widget.rates, usdController.text,
                                dropdownValue) +
                            ' ' +
                            dropdownValue;
                      });
                    },
                    child: Text('Convert'),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text(answer),
            )
          ],
        ),
      ),
    );
  }
}
