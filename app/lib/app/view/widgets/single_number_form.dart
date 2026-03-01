import 'package:app/app/controllers/single_number_controller.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/app/view/widgets/button.dart';
import 'package:app/app/view/widgets/input_number.dart';
import 'package:app/app/view/widgets/single_number_result_card.dart';
import 'package:app/core/validators/number_validator.dart';
import 'package:flutter/material.dart';

class SingleNumberForm extends StatefulWidget {
  final SingleNumberController controller;
  const SingleNumberForm({required this.controller, super.key});

  @override
  State<SingleNumberForm> createState() => _SingleNumberFormState();
}

class _SingleNumberFormState extends State<SingleNumberForm> {
  late TextEditingController singleNumberEditController;
  late GlobalKey<FormState> form;

  @override
  void initState() {
    super.initState();
    singleNumberEditController = TextEditingController();
    form = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    singleNumberEditController.dispose();
    form.currentState?.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SingleNumberState>(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        return Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Verifique o número',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                  fontFamily: 'SpaceGrotesk',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Abaixo você pode verificar se o número é perfeito ou não, digite um número inteiro positivo.',
                style: TextStyle(color: AppColors.textPrimary),
              ),
              SizedBox(height: 16),
              InputNumber(
                controller: singleNumberEditController,
                hintText: 'ex: 6, 10, 23',
                title: 'Digite um número inteiro positivo',
                validator: NumberValidator.validator,
              ),
              SizedBox(height: 24),
              Button(
                label: 'Verificar',
                onTap: () {
                  if (value is SingleNumberLoading) {
                    return;
                  }
                  if (form.currentState?.validate() ?? false) {
                    widget.controller.check(singleNumberEditController.text);
                    FocusManager.instance.primaryFocus?.unfocus();
                  }
                },
              ),
              SizedBox(height: 24),
              if (value is SingleNumberSuccess)
                SingleNumberResultCard(
                  number: value.number,
                  isPerfect: value.isPerfect,
                ),
            ],
          ),
        );
      },
    );
  }
}
