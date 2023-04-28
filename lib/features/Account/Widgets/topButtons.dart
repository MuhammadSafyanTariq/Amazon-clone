import 'package:amazon_clone/features/Account/Widgets/account_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButtons(
              text: 'Your Orders',
              onTap: () {},
            ),
            AccountButtons(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButtons(
              text: 'Logout',
              onTap: () {},
            ),
            AccountButtons(
              text: 'Your wish list',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
