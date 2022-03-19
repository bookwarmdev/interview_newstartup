import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interview_newstartup/core/colors.dart';
import 'package:interview_newstartup/core/styles.dart';
import 'package:interview_newstartup/data/scources/local_source/storage.dart';
import 'package:interview_newstartup/presentation/provider/provider.dart';
import 'package:interview_newstartup/presentation/routers/router.gr.dart';
import 'package:provider/provider.dart';

int? counterValue;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final _counterValue = await Storage().readCounterValue(
      '${CounterProvider().getCounterKey}',
    );

    setState(() {
      counterValue = int.parse(_counterValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    CounterProvider _counterProvider = Provider.of<CounterProvider>(context);
    User? _user = FirebaseAuth.instance.currentUser;

    init();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20.0,
                        backgroundImage: AssetImage(
                          'assets/images/Container.png',
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        _user!.email.toString(),
                        style: AppStyle.bodyText1,
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _counterProvider.signOutUser().toString();
                      context.router.push(const SingInScreen());
                    },
                    icon: const Icon(
                      Icons.power_settings_new,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.0,
                    blurRadius: 5,
                    offset: const Offset(3.0, 3.0),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 0.0,
                    blurRadius: 5 / 2.0,
                    offset: const Offset(3.0, 3.0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2.0,
                    blurRadius: 5,
                    offset: Offset(-3.0, -3.0),
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    spreadRadius: 2.0,
                    blurRadius: 5 / 2,
                    offset: Offset(-3.0, -3.0),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  counterValue != null ? '$counterValue' : '0',
                  style: AppStyle.headline1.copyWith(
                    color: AppColor.lightColorScheme.onBackground,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 5,
                            offset: const Offset(3.0, 3.0),
                          ),
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 5 / 2.0,
                            offset: const Offset(3.0, 3.0),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 5,
                            offset: Offset(-3.0, -3.0),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 5 / 2,
                            offset: Offset(-3.0, -3.0),
                          ),
                        ],
                      ),
                      child: InkResponse(
                        radius: 60.0,
                        onTap: () => _counterProvider.incrementCounterValue(),
                        child: Center(
                          child: Text(
                            '+',
                            style: AppStyle.headline1.copyWith(
                              color: AppColor.lightColorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 5,
                            offset: const Offset(3.0, 3.0),
                          ),
                          BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 5 / 2.0,
                            offset: const Offset(3.0, 3.0),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 5,
                            offset: Offset(-3.0, -3.0),
                          ),
                          const BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 5 / 2,
                            offset: Offset(-3.0, -3.0),
                          ),
                        ],
                      ),
                      child: InkResponse(
                        radius: 60.0,
                        onTap: () => _counterProvider.decrementCounterValue(),
                        child: Text(
                          '–',
                          textAlign: TextAlign.center,
                          style: AppStyle.headline1.copyWith(
                            color: AppColor.lightColorScheme.onBackground,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
