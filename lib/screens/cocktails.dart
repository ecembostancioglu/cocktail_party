import 'dart:async';
import 'package:cocktail_party/constants/color_constants.dart';
import 'package:cocktail_party/constants/text_constants.dart';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/network/dio_cocktails.dart';
import 'package:cocktail_party/widgets/cocktails/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CocktailsPage extends StatefulWidget {
  const CocktailsPage({Key? key}) : super(key: key);

  @override
  State<CocktailsPage> createState() => _CocktailsPageState();
}

class _CocktailsPageState extends State<CocktailsPage> {
  final DioCocktails _cocktailClient=DioCocktails();
  late Future<Iterable<Cocktail>> _cocktails;
  String? cocktailName;
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text(TextConstants.searchBarText);
  final _controller = TextEditingController();
  final ScrollController _scrollController=ScrollController();
  String? filter;
  Timer? _debounce;
  bool? isLoading;

  @override
  void initState() {
    isLoading = true;
    _cocktails=_cocktailClient.getCocktail(_controller.text);

      _controller.addListener(() {
        setState(() {
          filter=_controller.text;
        });
      });


    super.initState();
  }


  void searchBar() {
    setState(() {
      if (customIcon != Icons.search) {
        customIcon = const Icon(Icons.cancel);
        customSearchBar = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.black,
            size: 28,
          ),
          title: TextField(
            controller: _controller,
            onChanged: (val) {
              onChangedTextField(val);
            },
            decoration: const InputDecoration(
              hintText: TextConstants.searchBarHintText,
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
              border: InputBorder.none,
            ),
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        );
      }
      else {
        customIcon = const Icon(Icons.search, color: Colors.black);
      }
    });
  }

  Future <Cocktail?> onChangedTextField(String word) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      _cocktails = _cocktailClient.getCocktail(word);
    });

  }

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 3)).then((value){

      if(mounted){
        setState(() {
          isLoading=false;
        });
      }

    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/images/cocktail.png',
                  width: 80.w,height: 80.w),
              SearchBarWidget(
                  myController: _controller,
                  myFunction: onChangedTextField)
            ],
          ),
          Expanded(
            flex: 10,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: FutureBuilder<Iterable<Cocktail>>(
                    future: _cocktails,
                    builder: (context,snapshot){
                      if(snapshot.data!=null){
                        return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2
                            ),
                            controller: _scrollController,
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              var data=snapshot.data!.toList();
                              filter == null || filter== '';
                              return isLoading! ? getShimmerLoading()
                                  : GridTile(
                                    child: Padding(
                                     padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.h),
                                     child: ClipRRect(
                                         borderRadius: BorderRadius.circular(20.0),
                                         child: Image.network(data[index].strDrinkThumb.toString(),
                                          width: 100.w, height: 100.h)),
                                  )
                              );
                            });
                      }else if(snapshot.data==ConnectionState.waiting || snapshot.data==null){
                        return getShimmerLoading();
                      }
                      else {
                        return getShimmerLoading();
                      }
                    }
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Shimmer getShimmerLoading(){
    return Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.black26,
        child:  GridTile(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 10.h),
              child: ClipRRect(
                  borderRadius:  BorderRadius.circular(20.0),
                  child:Container(color: ColorConstants.primaryColor)),
            )
        ));
  }


}