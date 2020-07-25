import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';


enum Gender {
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  int height = 180;
  int weight = 180;
  int age = 20;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reusablecard(
                        color: selectedCard == Gender.male ? kActiveCardColor : kInactiveCardColor,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE'),
                        onPress: () {
                          setState(() {
                            selectedCard = Gender.male;
                          });
                        },
                    ),
                ),
                Expanded(
                  child: Reusablecard(
                    cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    color: selectedCard == Gender.female ? kActiveCardColor : kInactiveCardColor,
                    onPress: () {
                      setState(() {
                        selectedCard = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(children: <Widget> [
                Expanded(
                    child: Reusablecard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'HEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: <Widget>[
                                Text(
                                  height.toString(),
                                  style: kNumberStyle
                                ),
                                Text(
                                  'cm',
                                  style: kLabelTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB15555),
                                overlayColor: Color(0x29EB15555),
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.toInt();
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                    ),
                ),
              ],
              ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Reusablecard(
                        color: kActiveCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressesd: () {
                                    setState(() {
                                      weight += 1;
                                    });
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressesd: () {
                                    weight -= weight > 0 ?  1 : 0;
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                    ),
                ),
                Expanded(
                    child: Reusablecard(
                        color: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressesd: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressesd: () {
                                  height -= (height > 0) ?  1 : 0;
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: kBottomContainerHeight,
            color: kBottomContainerColor
          ),
        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressesd;
  RoundIconButton({@required this.icon, @required this.onPressesd});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressesd,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        height: 50.0,
        width: 50.0
      ),
      shape: CircleBorder(),
      elevation: 0.0,
    );
  }
}
