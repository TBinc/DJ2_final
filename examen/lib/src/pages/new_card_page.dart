import 'package:awesome_card/awesome_card.dart';
import 'package:examen/src/global/user_colors.dart';
import 'package:flutter/material.dart';

class NewCardPage extends StatefulWidget {
  @override
  _NewCardPageState createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  String cardHolderName = "";
  String cardExpiry = "";
  String cardNumber = "";
  String cvv = "";
  String bankName = "";
  bool showBackSide = false;

  TextEditingController cardHolderNameController = TextEditingController();
  TextEditingController cardExpiryController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  FocusNode focusNodeCardHolderName = FocusNode();
  FocusNode focusNodeCardExpiry = FocusNode();
  FocusNode focusNodeCardNumber = FocusNode();
  FocusNode focusNodeCVV = FocusNode();
  FocusNode focusNodeBankName = FocusNode();

  @override
  void initState() {
    focusNodeCVV.addListener(() {
      if (focusNodeCVV.hasFocus) {
        showBackSide = true;
      } else {
        showBackSide = false;
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                CreditCard(
                    cardHolderName: cardHolderName,
                    cardExpiry: cardExpiry,
                    cardNumber: cardNumber,
                    cvv: cvv,
                    showShadow: true,
                    showBackSide: showBackSide,
                    bankName: bankName,
                    frontBackground: Container(color: CustomColors.mainColor),
                    backBackground: CardBackgrounds.white),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeCardHolderName,
                    onChanged: (text) {
                      setState(() {
                        cardHolderName = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.name,
                    maxLength: 16,
                    decoration: InputDecoration(
                        counterText: "", labelText: 'Card Holder Name')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeCardExpiry,
                    onChanged: (text) {
                      setState(() {
                        cardExpiry = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.text,
                    maxLength: 16,
                    decoration: InputDecoration(
                        counterText: "", labelText: 'Card Expiry')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeCardNumber,
                    onChanged: (text) {
                      setState(() {
                        cardNumber = text;
                        showBackSide = false;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    decoration: InputDecoration(
                        counterText: "", labelText: 'Card Number')),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeCVV,
                    onChanged: (text) {
                      setState(() {
                        cvv = text;
                        showBackSide = true;
                      });
                    },
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      counterText: "",
                      labelText: 'Cvv',
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    focusNode: focusNodeBankName,
                    onChanged: (text) {
                      setState(() {
                        bankName = text;
                        showBackSide = false;
                      });
                    },
                    style: TextStyle(fontSize: 20, color: Colors.black),
                    keyboardType: TextInputType.text,
                    maxLength: 16,
                    decoration: InputDecoration(
                        counterText: "", labelText: 'Bank Name')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
