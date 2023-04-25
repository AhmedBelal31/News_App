import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../../component/component.dart';

class Sports_Screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit ,NewsState>(
      listener:(context , state){} ,
      builder:(context , state){
        List list = NewsCubit.get(context).sports;
        if(list.length==0)
        {
          return Center(child: CircularProgressIndicator()) ;
        }
        else {
          return Expanded(
            child: ListView.separated(
                itemBuilder:(context ,index )=>BuildApiItem(list[index] ,context),
                separatorBuilder: (context ,index)=>MyDivider(),
                itemCount:list.length),
          );
        }

      },

    ) ;
  }
}
