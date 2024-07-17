
import 'package:flutter/material.dart';
import 'package:myutils/helpers/extension/colors_extension.dart';
import 'package:myutils/utils/gtd_widgets/gtd_button.dart';
import 'package:shimmer/shimmer.dart';

class GtdFlightItemChildLoading<T> extends StatelessWidget {
  const GtdFlightItemChildLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade50,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    color: Colors.white,
                    width: 130,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 12,
                    color: Colors.white,
                    width: 100,
                  ),
                ],
              ),
            ),
            GtdButton(
              text: '',
              gradient: GtdColors.appGradient(context),
              onPressed: (val) => {},
            )
          ],
        ),
      ),
    );
  }
}
