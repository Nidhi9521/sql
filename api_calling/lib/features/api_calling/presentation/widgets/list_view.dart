import 'package:api_calling/features/api_calling/data/models/QutoesModel.dart';
import 'package:flutter/material.dart';


class ListQuoteView extends StatelessWidget {
  List<QutoesModel> data;

  ListQuoteView({required this.data}) : super();

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (_,index){
            return Card(
              color: Colors.white10,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(45)
                  ),
                ),
                title: Text(data[index].quote.toString()),
                subtitle: Text(data[index].author.toString()),
              ),
            );
          }),
    );
  }
}

