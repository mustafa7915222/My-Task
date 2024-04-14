import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test1/blocs/task_list/task_list_cubit.dart';


class PageNavigation extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  PageNavigation({
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: currentPage > 1 ? () {

            BlocProvider.of<TaskListCubit>(context).getMoreTaskList(currentPage - 1);

            onPageChanged(currentPage - 1);
          } : null,
        ),
        Text(
          '$currentPage / $totalPages',
          style: TextStyle(fontSize: 18.0),
        ),
        IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: currentPage < totalPages ? () {

            BlocProvider.of<TaskListCubit>(context).getMoreTaskList(currentPage + 1);

            onPageChanged(currentPage + 1);
          } : null,
        ),
      ],
    );
  }
}
