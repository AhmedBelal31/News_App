import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import '../network/remote/dio_helper.dart';
import '../news_app/business/business.dart';
import '../news_app/science/science.dart';
import '../news_app/settings/settings.dart';
import '../news_app/sports/sports.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) {
    return BlocProvider.of(context);
  }

  var currentIndex = 0;

  List<Widget> Screens = [
    Business_Screen(),
    Sports_Screen(),
    Science_Screen(),
    Setting(),
  ];

  TextEditingController searchController = TextEditingController();

  bool isLight = true;

  ChangeThemeIcon() {
    isLight = !isLight;
    emit(AppThemeState());
  }

  void BottomNav(int index) {
    currentIndex = index;
    emit(BottomNavState());

    if (currentIndex == 0) {
      getBusinessData();
      emit(BusinessState());
    }else if (currentIndex == 1) {
      getSportsData();
      emit(SportsState());
    }
    else if (currentIndex == 2) {
      getScienceData();
      emit(ScienceState());
    } else {
      emit(SettingState());
    }
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> Search = [];

  void getBusinessData() {
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': 'apple',
        // 'from': '2023-02-15',
        // 'to': '2023-02-15',
        // 'sortBy': 'popularity',
        'apiKey': '388c3d1e49734b57b6b02c67d6f51b19'
      },
    ).then((value) {
      business = value.data["articles"];
      emit(BusinessState());
    }).catchError((error) {
      print("Erorr Occured ! ${error.toString()}");
    });
  }

  void getScienceData() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '388c3d1e49734b57b6b02c67d6f51b19'
      },
    ).then((value) {
      science = value.data["articles"];
      emit(ScienceState());
    }).catchError((error) {
      print("Erorr Occured ! ${error.toString()}");
    });
  }

  void getSportsData() {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '388c3d1e49734b57b6b02c67d6f51b19'
      },
    ).then((value) {
      sports = value.data["articles"];
      emit(SportsState());
    }).catchError((error) {
      print("Erorr Occured ! ${error.toString()}");
    });
  }

  void getSearch(String value) {
    DioHelper.getData(url: 'v2/everything', query: {
      'q': '${value}',
      'apiKey': '388c3d1e49734b57b6b02c67d6f51b19'
    }).then((value) {
      Search = value.data["articles"];
      emit(SearchState());
      //
    }).catchError((error) {
      print("Error Occured ${error.toString()}");
    });
  }

  void TFFChange(value) {
    // searchController = value;
    emit(SearchState());
  }
}
