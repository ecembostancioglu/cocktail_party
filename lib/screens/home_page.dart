import 'dart:async';
import 'package:cocktail_party/models/cocktail.dart';
import 'package:cocktail_party/models/home_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../constants/text_constants.dart';
import '../network/dio_client.dart';
import '../widgets/label_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final DioClient _cocktailClient=DioClient();
  late Future<Iterable<Cocktail>> _cocktails;
  Icon customIcon = const Icon(Icons.search,color: Colors.black);
  Widget customSearchBar = Text(TextConstants.searchBarText,
      style: TextStyle(fontSize: 16.sp,color: Colors.black54));
  final _controller = TextEditingController();
  String? filter;
  Timer? _debounce;



  void searchBar(){

    setState(() {
      if(customIcon != Icons.search){
        customIcon = const Icon(Icons.cancel,color: Colors.black);
        customSearchBar = ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.black,
            size: 28,
          ),
          title: TextField(
            controller: _controller,
            onChanged: (val){
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
      }else{
        customIcon = Icon(Icons.search);
      }
    });
  }

  Future <Cocktail?> onChangedTextField(String word)async{


    setState(() {
      if(_debounce?.isActive ?? false) _debounce?.cancel();
      _debounce=Timer(const Duration(milliseconds: 3000), (){
        _cocktails= _cocktailClient.getCocktail(word);
      });
    });
    // _cocktails= _cocktailClient.getCocktail(word);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white30,
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: searchBar,
              icon: customIcon)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55.h,
              child: Padding(
                padding: EdgeInsets.all(10.w),
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: const [
                    LabelButton(text: 'Cocktails'),
                    LabelButton(text: 'Alcoholic'),
                    LabelButton(text: 'Non-Alcoholic'),
                    LabelButton(text:  'The Best Cocktails'),
                    LabelButton(text: 'Ordinary Drinks'),

                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                   children: [
                     Image.asset('assets/images/cocktail.png',
                         width: 80.w,height: 80.w),
                     Text('Popular Cocktails',
                         style: Theme.of(context).textTheme.headline1),
                   ],
                  ),

                  GridView.custom(
                    shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 2,
                        mainAxisSpacing: 3,
                        crossAxisSpacing: 3,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: [
                          QuiltedGridTile(1,1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                        ],
                      ),
                    childrenDelegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.asset(
                                categories[index].image,
                                fit: BoxFit.cover),
                          ),
                        ),
                        childCount: categories.length)
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
         );

  }
}
