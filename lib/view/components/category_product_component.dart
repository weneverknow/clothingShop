import 'package:ecommerce_mvvm/provider/category_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model/category_product.dart';
import '../../shared/constant.dart';
import '../../shared/theme.dart';

class CategoryProductComponent extends ConsumerWidget {
  const CategoryProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cp = ref.watch(categoryProductProvider);
    return Container(
        height: 60,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    ref
                        .read(categoryProductProvider.state)
                        .update((state) => categories[index]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        left: index == 0 ? defaultpadding : 0,
                        right: defaultpadding),
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultpadding / 2),
                    decoration: BoxDecoration(
                        color: categories[index] == cp
                            ? primarycolor.withOpacity(0.8)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: primarycolor)),
                    child: Row(
                      children: [
                        Image.asset(
                          categories[index].imageUrl!,
                          fit: BoxFit.contain,
                          width: 24,
                        ),
                        const SizedBox(
                          width: defaultpadding / 4,
                        ),
                        Text(
                          categories[index].category!,
                          style: TextStyle(
                              color: categories[index] == cp
                                  ? Colors.white
                                  : primarycolor),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
