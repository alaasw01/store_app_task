part of '../home_view.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({
    super.key,
    this.onFilterTap,
  });
  final void Function()? onFilterTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
            controller: context.read<HomeCubit>().searchController,
            onChanged: (_) => context.read<HomeCubit>().searchProducts(),
            decoration: InputDecoration(
              isDense: true,
              hintText: 'search',
              hintStyle: AppStyles.textStyle16.copyWith(
                color: Colors.grey,
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              // suffixIcon: const Icon(
              //   Icons.cancel,
              //   color: Colors.grey,
              // ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.grey)),
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: onFilterTap,
          child: const Icon(
            Icons.filter_list_rounded,
            size: 25,
          ),
        ),
        const SizedBox(width: 5),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Badge.count(
              count: context.read<HomeCubit>().favoritesList.length,
              backgroundColor: AppColors.orangeColor,
              child: GestureDetector(
                onTap: () => context.read<HomeCubit>().goToFavoriteView(),
                child: const Icon(
                  Icons.favorite_border_rounded,
                  size: 25,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 5),
        BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, state) {
            return GestureDetector(
              onTap: context.read<ThemeCubit>().toggleTheme,
              child: Icon(
                size: 25,
                state.brightness == Brightness.light
                    ? Icons.dark_mode
                    : Icons.light_mode_outlined,
              ),
            );
          },
        ),
      ],
    );
  }
}
