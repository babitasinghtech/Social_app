import 'package:flutter/material.dart';

class NewContacttile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;

  const NewContacttile({
    super.key,
    required this.btnName,
    required this.icon,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              child: Icon(icon, size: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 15),
            Text(btnName, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
