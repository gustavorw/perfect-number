import 'package:app/app/controllers/range_controller.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/app/view/widgets/button.dart';
import 'package:app/app/view/widgets/input_number.dart';
import 'package:app/app/view/widgets/range_result_card.dart';
import 'package:app/core/validators/number_validator.dart';
import 'package:flutter/material.dart';

class RangeNumberForm extends StatefulWidget {
  final RangeController controller;
  const RangeNumberForm({required this.controller, super.key});

  @override
  State<RangeNumberForm> createState() => _RangeNumberFormState();
}

class _RangeNumberFormState extends State<RangeNumberForm> {
  late TextEditingController startEditController;

  late TextEditingController endEditController;
  late GlobalKey<FormState> form;

  @override
  void initState() {
    super.initState();
    startEditController = TextEditingController();
    endEditController = TextEditingController();
    form = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();
    startEditController.dispose();
    endEditController.dispose();
    form.currentState?.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller,
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text('Encontre no intervalo', style: AppTextStyle.title),
                SizedBox(height: 16),
                Text(
                  'Temos a opção de você descobrir todos os números perfeitos em um intervalo.',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                SizedBox(height: 16),
                InputNumber(
                  controller: startEditController,
                  hintText: 'ex: 6, 10, 23',
                  title: 'Digite o primeiro número inteiro positivo',
                  validator: (value) {
                    final valid = NumberValidator.validator(value);
                    if (value != null) {
                      return valid;
                    }

                    return null;
                  },
                ),
                SizedBox(height: 16),
                InputNumber(
                  controller: endEditController,
                  hintText: 'ex: 6, 10, 23',
                  title: 'Digite o segundo número inteiro positivo',
                  validator: (value) {
                    final valid = NumberValidator.validator(value);
                    if (valid != null) {
                      return valid;
                    }
                    final current = num.parse(value ?? '0');
                    final first = num.parse(startEditController.text);
                    if (first >= current) {
                      return 'Intervalo inválido, primeiro é maior ou igual ao segundo número';
                    }

                    return null;
                  },
                ),
                SizedBox(height: 24),
                Button(
                  label: 'Buscar perfeitos',
                  onTap: () {
                    if (value is RangeLoading) {
                      return;
                    }
                    if (form.currentState?.validate() ?? false) {
                      widget.controller.find(
                        startEditController.text,
                        endEditController.text,
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
                SizedBox(height: 24),

                if (value is RangeSuccess)
                  RangeResultCard(
                    start: value.start,
                    end: value.end,
                    perfects: value.perfects,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
