import 'package:basic_calculator/ui_helper/custom_digit_button.dart';
import 'package:basic_calculator/utils/app_colors.dart';
import 'package:basic_calculator/utils/app_strings.dart';
import 'package:basic_calculator/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorMainScreen extends StatelessWidget {
  const CalculatorMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldWhite,
      body: Container(
        //  width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.gradientColor1,
          AppColors.gradientColor2,
        ])),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Consumer<CalProvider>(
              builder: (context, calProvider, child) {
                return Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 30.0, bottom: 20.0, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextFormField(
                                textAlign: TextAlign.end,
                                cursorColor: Colors.white,
                                maxLines: null,
                                showCursor: true,
                                style: const TextStyle(
                                    fontSize: 35,
                                    color: AppColors.buttonColor,
                                    fontWeight: FontWeight.w700),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                                controller: calProvider.digitcont,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButtons(
                                  buttonColor: AppColors.delColor,
                                  title: AppStrings.c,
                                  onTap: () {
                                    debugPrint("Called");
                                    calProvider.clearSingleInput();
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.delColor,
                                  title: AppStrings.ac,
                                  onTap: () {
                                    calProvider.clearAllInput();
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.remainder,
                                  onTap: () {
                                    calProvider
                                        .appendInputs(AppStrings.remainder);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.divide,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.divide);
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.seven,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.seven);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.eight,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.eight);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.nine,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.nine);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.mltiply,
                                  onTap: () {
                                    calProvider
                                        .appendInputs(AppStrings.mltiply);
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.four,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.four);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.five,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.five);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.six,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.six);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.sub,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.sub);
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.one,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.one);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.two,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.two);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.three,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.three);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.add,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.add);
                                  }),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.doubleZero,
                                  onTap: () {
                                    calProvider
                                        .appendInputs(AppStrings.doubleZero);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.ten,
                                  onTap: () {
                                    calProvider.appendInputs(AppStrings.ten);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.buttonColor,
                                  title: AppStrings.decimal,
                                  onTap: () {
                                    calProvider
                                        .appendInputs(AppStrings.decimal);
                                  }),
                              RoundButtons(
                                  buttonColor: AppColors.operatorColor,
                                  title: AppStrings.equal,
                                  onTap: () {
                                    calProvider.performOperation();
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
