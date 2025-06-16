import 'package:flutter/material.dart';


class SubscriptionSummary extends StatefulWidget {
  const SubscriptionSummary({super.key, required Object title, required Object price, required List<String> features});

  @override
  State<SubscriptionSummary> createState() => _SubscriptionSummaryState();
}

class _SubscriptionSummaryState extends State<SubscriptionSummary> {

  bool data = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          iconSize: 25,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Subscription Summary',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),

        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Container(
                height: 70,
                //color: Colors.white10,
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Subtotal', style: TextStyle(color: Colors.white, fontSize: 16),),
                        Text('\$2.99', style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Tax', style: TextStyle(color: Colors.white, fontSize: 16),),
                        Text('\$00.00', style: TextStyle(color: Colors.white, fontSize: 16),)
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white30, thickness: 2),
              Container(
                width: size.width * 09,
                height: size.height * .06,
                //color: Colors.white10,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Total', style: TextStyle(color: Colors.white, fontSize: 16),),
                    Text('\$2.99', style: TextStyle(color: Colors.white, fontSize: 16),)
                  ],
                ),
              ),
              const SizedBox(height: 24),

              Container(
                width: size.width * .9,
                height: size.height * .07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.white)
                ),
                child:
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: data,
                            onChanged: (bool? value) {
                              setState(() {
                                data = value!;
                              });
                            },
                            activeColor: Colors.white,
                          ),
                          Text('\$2.99', style: TextStyle(color: Colors.white, fontSize: 16),)
                        ],
                      ),
                      Text('stripe', style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),



              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  // width: size.width * .09,
                  // height: size.height * .06,
                  height: size.height * 0.07,
                  width: size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => const CodeVerify()),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
              //const Spacer(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
