part of '../home_view.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextFormField(
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
        Image.asset(
          AppImages.filter,
          height: 20,
        ),
        const SizedBox(width: 5),
        Badge.count(
          count: 2,
          backgroundColor: AppColors.orangeColor,
          child: GestureDetector(
            onTap: () => context.go(Routes.favorites),
            child: const Icon(
              Icons.favorite_border_rounded,
              size: 25,
            ),
          ),
        )
      ],
    );
  }
}
