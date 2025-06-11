import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_planner/utilities/finance_utils.dart';

class MainAccountWidget extends ConsumerWidget {
  const MainAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const currency = 'Rp';
    final mainBalanceAmount = formatFinanceAmount(888888888);
    final todayTransaction = formatFinanceAmount(123456789);
    const percentage = 45.6;
    const percentageColor =
        percentage > 0 ? Color(0xFF1B8E2D) : Color(0xFFE53935);

    final mainAccountBalanceLabel =
        AppLocalizations.of(context)!.homepageBalanceWidgetTitle;
    final todayTransactionLabel =
        '${AppLocalizations.of(context)!.homepageBalanceWidgetSubtitle}:';

    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.0,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mainAccountBalanceLabel,
                      style: Theme.of(context).textTheme.bodyLarge),
                  Text('$currency $mainBalanceAmount',
                      style: Theme.of(context).textTheme.headlineLarge),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(todayTransactionLabel),
                        Row(
                          spacing: 6,
                          children: [
                            Text(
                              '$currency $todayTransaction',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              '$percentage%',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: percentageColor,
                                      fontStyle: FontStyle.italic),
                            )
                          ],
                        )
                      ]),
                  Row(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: FloatingActionButton(
                          onPressed: () {},
                          shape: const CircleBorder(),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          child: const Icon(
                            Icons.add,
                            color: percentageColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: FloatingActionButton(
                          onPressed: () {},
                          mini: true,
                          child: const Icon(
                            Icons.remove,
                            color: Color(0xFFE53935),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
