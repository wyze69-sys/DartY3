import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom buttons')),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(label: 'Submit', icon: Icons.check),
              SizedBox(height: 16),
              CustomButton(
                label: 'Time',
                icon: Icons.schedule,
                position: IconPosition.right,
                type: ButtonType.secondary,
              ),
              SizedBox(height: 16),
              CustomButton(
                label: 'Account',
                icon: Icons.account_tree,
                position: IconPosition.right,
                type: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;

  const ButtonType(this.color);
}

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition position;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.position = IconPosition.left,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: type == ButtonType.disabled ? null : () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: type.color,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.white70,
        shape: const StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (position == IconPosition.left) ...[
            Icon(icon),
            const SizedBox(width: 8),
          ],
          Text(label),
          if (position == IconPosition.right) ...[
            const SizedBox(width: 8),
            Icon(icon),
          ],
        ],
      ),
    );
  }
}
