import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
class PopularDataBase
{
    static int totalsize = 10;
  static List<String> img=["assets/image/food_0.jpg","assets/image/food_1.jpg","assets/image/food_2.jpg","assets/image/food_3.jpg","assets/image/food_4.jpg","assets/image/carrot.jpg"];
  static List<String> name=["Potato","Onion","Tomato","Broccoli","Cauliflower","Carrot"];
  static List<String> description = [
    "New Potatoes: If you are looking for soft, slightly sweet but creamy-textured potatoes. These are a special variant early harvest of potatoes (not to be confused with our regular Fresho Potato) and are easily distinguishable with their thin/ tender skin which makes them easy-to-peel off even it can be used without peeling. These freshly picked potatoes are a great choice for roasting or boiling. They give essential nutrients to your body along with high dietary fibre and carbohydrates. Combined with great taste and nutrients this vegetable is the most popular and loved amongst households",
    "Onions are known to be rich in biotin. Most of the flavonoids which are known as anti-oxidants are concentrated more in the outer layers, so when you peel off the layers, you should remove as little as possible. Onion can fill your kitchen with a thick spicy aroma. It is a common base vegetable in most Indian dishes, thanks to the wonderful flavor that it adds to any dish.Onions are high in sulphur, Folic acid, Amino acid, vitamin B6 and B9. It has high quantities of water and naturally low in fat. It is high in phytochemical compounds. Onions are known to have antiseptic, antimicrobial and antibiotic properties which help you to get rid of infections.If a piece of onion is inhaled, it can slow down or stop nose bleeding.",
    "Local tomatoes are partly sour and partly sweet and contain many seeds inside which are edible. The red colour present in tomatoes is due to lycopene, an anti-oxidant. Tomatoes contain Vitamin C,K. lycopene, an antioxidant that reduces the risk of cancer and heart-diseases. They protect the eyes from light induced damage. Essential for pregnant women as these tomatoes protect infants against neural tube defects. Essential for pregnant women as these tomatoes protect infants against neural tube defects. Ripe tomatoes should be refrigerated if they need to be stored for a long time.",
    "With a shape resembling that of a cauliflower, Brocollis have clusters of small, tight flower heads. These heads turn bright green on cooking and tastes slightly bitter. Broccoli prevents cancer and reduces cholesterol. Maintains bone and heart health. Good for skin, eyes and has anti-aging properties. Consume fresh broccoli as soon as you can as it will not keep for long. o store, drizzle water droplets on the flower heads, cover loosely in damp paper towels and refrigerate. But never wash broccoli before storing in the refrigerator.",
    "Cauliflower is made up of tightly bound clusters of soft, crumbly, sweet cauliflower florets that form a dense head. Resembling a classic tree, the florets are attached to a central edible white trunk which is firm and tender. One serving of cauliflower contains 77 percent of daily recommended value of vitamin C. Cauliflowers are rich in B complex vitamins, potassium and manganese.They protect from the risk of heart diseases and brain disorders. t also contains cancer fighting nutrient called sulforaphane. Refrigerate in a loosely sealed plastic bag. It keeps well for upto 7 days. Do not store florets for more than 5 days. Cooked and used in soups, rice, curries, gobi parathas( flat breads), one of the most liked recipes.",
    "A popular sweet-tasting root vegetable, Carrots are narrow and cone shaped. They have thick, fleshy, deeply colored root, which grows underground, and feathery green leaves that emerge above the ground. While these greens are fresh tasting and slightly bitter, the carrot roots are crunchy textured with a sweet and minty aromatic taste. Fresho brings you the flavour and richness of the finest crispy and juicy carrots that are locally grown and the best of the region. Carrots provide the highest content of vitamin A of all the vegetables. Brightly orange colored carrots have pigments like carotenoids and flavonoids, that provide several antioxidants and act as a defense against cancer. Refrigerate carrots in a mesh bag. Alternatively to retain freshness and for more longevity, trim off the greens and put whole carrots in a container of water and refrigerate. With this method, they stay nice and crunchy. If the water starts to look cloudy, change it with fresh water.",
  ];
  static List<String> review = ["Normal","Good","Better","Bad","Best","Normal"];
  static List<String> distance = ["1.9KM","3KM","2KM","4KM","6KM","4KM"];
  static List<String> time = ["15 min","35 min","28 min","50 min","90 min","50 min"];
  static List<int> price = [42,40,16,120,30,62];
  static List<int> quantity=[0,0,0,0,0,0];


    void setQuantity(bool isIncrement,int index)
    {
     if(isIncrement) {
       quantity[index]++;
       quantity[index]= checkQuantity(quantity[index],index);
     }
     else
       {
         quantity[index]--;
         quantity[index]= checkQuantity(quantity[index],index);
       }
   }


    static int checkQuantity( int position,int index)
    {
      if(quantity[index]<0) {
        Get.snackbar("Item count "," You can't reduce more !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
        return 0;
      }
      else if(quantity[index]>6) {
        Get.snackbar("Item count !", " You can't increase more !",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
        return 6;
      }
      else {
        return quantity[index];
      }
    }

}

