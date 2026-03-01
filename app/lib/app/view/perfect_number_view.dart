import 'package:app/app/controllers/range_controller.dart';
import 'package:app/app/controllers/single_number_controller.dart';
import 'package:app/app/usecases/find_perfects_in_range.dart';
import 'package:app/app/usecases/is_perfect_number.dart';
import 'package:app/core/theme/app_theme.dart';
import 'package:app/app/view/widgets/range_number_form.dart';

import 'package:app/app/view/widgets/single_number_form.dart';
import 'package:flutter/material.dart';

class PerfectNumberView extends StatefulWidget {
  const PerfectNumberView({super.key});

  @override
  State<PerfectNumberView> createState() => _PerfectNumberViewState();
}

class _PerfectNumberViewState extends State<PerfectNumberView>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  late final SingleNumberController singleNumberController;
    late final RangeController rangeController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    singleNumberController = SingleNumberController(IsPerfectNumber());
    rangeController = RangeController(findPerfectsInRange: FindPerfectsInRange());

  }

  @override
  void dispose() {
    _tabController.dispose();
    singleNumberController.dispose();
    rangeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: Icon(Icons.calculate_outlined, color: AppColors.textPrimary),
        backgroundColor: AppColors.background,
        title: Text(
         'Calcular número perfeito',
         style: AppTextStyle.appTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TabBar(
              indicatorColor: AppColors.primary, 
              indicatorWeight: 3.0,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: AppColors.primary,
              unselectedLabelColor: AppColors.textSecondary,
              labelStyle: AppTextStyle.labelStyle,
              unselectedLabelStyle: AppTextStyle.unselectedLabelStyle,
              tabs: [Text('Apenas um'), Text('Intervalo')],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                SingleNumberForm(
                  controller: singleNumberController,
                ),
                RangeNumberForm(
                  controller: rangeController,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
