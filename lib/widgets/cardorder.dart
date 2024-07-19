import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardOrder extends StatefulWidget {
  final String title;
  final String content;
  final String nameph;

  final Color initialColor;
  VoidCallback? onTap;
  bool showDetails = false;

  CardOrder({
    Key? key,
    required this.title,
    required this.content,
    required this.initialColor,
    required Function() onTap,
    required this.nameph,
  }) : super(key: key);

  @override
  State<CardOrder> createState() => _CardOrderState();
}

class _CardOrderState extends State<CardOrder> {
  late Color currentColor;
  late Color iconColor;
  bool hasColorChanged = false;
  bool isCardGreen = true;

  @override
  void initState() {
    super.initState();
    currentColor = widget.initialColor;
    _fetchColorPreference(); // Fetch color preference on initialization
  }

  Future<void> _fetchColorPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isGreen = prefs.getBool('card_color_${widget.title}');
    if (isGreen != null) {
      setState(() {
        currentColor = isGreen ? Colors.green : widget.initialColor;
        isCardGreen = isGreen;
      });
    }
  }

  Future<void> _saveColorPreference(bool isGreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('card_color_${widget.title}', isGreen);
    print('Color preference saved for ${widget.title}: $isGreen');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          color: currentColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  isThreeLine: true,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name User: ${widget.title}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'User Address: ${widget.content}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    "Name of the Pharmacy: ${widget.nameph}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (!hasColorChanged) {
                    setState(() {
                      currentColor = Colors.green;
                      iconColor = const Color(0xffccfac4);
                      hasColorChanged = true;
                      isCardGreen = true; // Always set to true when changing color
                    });
                    widget.onTap?.call();
                    _saveColorPreference(isCardGreen);
                  }
                },
                icon: Icon(
                  Icons.check_circle,
                  size: 35,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
