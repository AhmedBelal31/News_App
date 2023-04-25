import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/component.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class Search_Screeen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        List list = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: NewsCubit.get(context).searchController,
                  decoration: const InputDecoration(
                      labelText: "Search",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search)),
                  onChanged: (value) {
                    NewsCubit.get(context).getSearch(value);
                    // if(NewsCubit.get(context).Search.length >0)
                    // searchController.text = value ;
                    NewsCubit.get(context).TFFChange(value);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          BuildApiItem(list[index], context),
                      separatorBuilder: (context, index) => MyDivider(),
                      itemCount: list.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
