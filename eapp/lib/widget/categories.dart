import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> categories = ['ALL', 'MEN', 'WOMEN'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: categories.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        final isSelected = index == selectedIndex;

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black, width:1.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}





// import 'package:flutter/material.dart';

// class Categories extends StatefulWidget {
//   const Categories({super.key});

//   @override
//   State<Categories> createState() => _CategoriesState();
// }

// class _CategoriesState extends State<Categories> {
//   @override
//   Widget build(BuildContext context) {
//     List <String> categories = ['All', 'Men', 'Women'];

//     return GestureDetector(
//       onTap: () {},
//       child:  Row(
//         children: [
//           Padding(
//               padding: const EdgeInsets.only(right: 10.0, top: 5.0),
//               child:
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       border: Border.all(color: Colors.black, width: 1.0),
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     child: Text(categories[index], style: const TextStyle(fontWeight: FontWeight.bold,),)),      
              
//             ),
//         ],
//       ),
        
        
//     );
//   }
// }