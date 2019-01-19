import 'package:flutter/material.dart';
import 'package:simple_debt_manager/models/debt.dart';
import 'package:simple_debt_manager/screens/debt_detail.dart';

class DebtList extends StatefulWidget {

  DebtList(this.debtList);

  final List<Debt> debtList;
  @override
  _DebtListState createState() => _DebtListState();
}

class _DebtListState extends State<DebtList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    count = widget.debtList.length;
    
    
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            elevation: 2.0,
            child: ListTile(
              leading: Icon(Icons.euro_symbol,
                  color: _getStateColor(widget.debtList[position].totalQuantity,
                      widget.debtList[position].paidQuantity)),
              title: Text("${widget.debtList[position].name}"),
              subtitle: Text("${widget.debtList[position].description}"),
              trailing: Text("${widget.debtList[position].totalQuantity}"),
              onTap: () => _navigateToDetail(widget.debtList[position])
            ));
      },
    );
  }

  Color _getStateColor(double total, double paid) {
    if (paid == 0) return Colors.red;
    if (total == paid) return Colors.green;
    return Colors.orange;
  }
  void _navigateToDetail(Debt debt) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) => DebtDetail(debt)));
    if (result != null && result == true) {
      //updateListView();
    }
  }

}
