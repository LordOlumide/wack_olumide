import 'package:flutter/material.dart';
import 'package:wack/src/screens/home_screen/dummy_data/dummy_channels.dart';

class ChannelDisplay extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const ChannelDisplay({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 1),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Text(
              dummyChannels[index].name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.deepPurple : Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            if (dummyChannels[index].noOfUnreadMessages != 0)
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.deepPurple : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    dummyChannels[index].noOfUnreadMessages.toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.deepPurple,
                    ),
                  ),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
      ),
    );
  }
}
