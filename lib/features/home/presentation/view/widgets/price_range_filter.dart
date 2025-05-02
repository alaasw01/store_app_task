part of '../home_view.dart';

class PriceRangeFilter extends StatelessWidget {
  const PriceRangeFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RangeSlider(
                values: context.read<HomeCubit>().rangeValues,
                min: context.read<HomeCubit>().minPrice ?? 0.0,
                max: context.read<HomeCubit>().maxPrice ?? 0.0,
                divisions: 1000,
                activeColor: AppColors.orangeColor,
                inactiveColor: Colors.grey,
                labels: RangeLabels(
                  context
                      .read<HomeCubit>()
                      .rangeValues
                      .start
                      .round()
                      .toString(),
                  context.read<HomeCubit>().rangeValues.end.round().toString(),
                ),
                onChanged: (values) {
                  context.read<HomeCubit>().onRangeChanged(values);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10, left: 10),
                child: Row(
                  children: [
                    CustomLoadingButton(
                      text: 'Apply',
                      color: AppColors.orangeColor,
                      textColor: Colors.white,
                      onTap: context.read<HomeCubit>().updateFilteredProducts,
                    ),
                    const SizedBox(width: 10),
                    CustomLoadingButton(
                      text: 'reset',
                      textColor: Colors.white,
                      onTap: context.read<HomeCubit>().getAllProducts,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
