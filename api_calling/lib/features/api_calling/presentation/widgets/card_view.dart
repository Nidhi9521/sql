import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:flutter/material.dart';
class CardView extends StatelessWidget {
  const CardView({Key? key, required this.qutoesModel}) : super(key: key);
final QutoesModel qutoesModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(45)
          ),
        ),
        title: Text(qutoesModel.quote.toString()),
        subtitle: Text(qutoesModel.author.toString()),
      ),
    );
  }
}
