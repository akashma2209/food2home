import 'dart:core';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:food2home/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class CartDataBase
{
  static int totalsize = 16;
  static List<String> img=["assets/image/food_0.jpg","assets/image/food_1.jpg","assets/image/food_2.jpg","assets/image/food_3.jpg","assets/image/food_4.jpg","assets/image/carrot.jpg","assets/image/bringal.jpg","assets/image/bottleground.jpg","assets/image/garlic.jpeg","assets/image/bittermelon.jpg","assets/image/leamon.png","assets/image/mushroom.jpeg","assets/image/beetroot.jpeg","assets/image/capsicum.jpeg","assets/image/cucumber.jpeg","assets/image/ladyfinger.jpeg"];
  static List<String> name=["Potato","Onion","Tomato","Broccoli","CaliFlower","Carrot","Brinjal","Bottle Ground","Garlic","Bitter Melon ","Lemon","Mushroom","Beetroot","Capsicum","Cucumber","Lady Finger"];
  static List<String> description = [
    "New Potatoes: If you are looking for soft, slightly sweet but creamy-textured potatoes. These are a special variant early harvest of potatoes (not to be confused with our regular Fresho Potato) and are easily distinguishable with their thin/ tender skin which makes them easy-to-peel off even it can be used without peeling. These freshly picked potatoes are a great choice for roasting or boiling. They give essential nutrients to your body along with high dietary fibre and carbohydrates. Combined with great taste and nutrients this vegetable is the most popular and loved amongst households",
    "Onions are known to be rich in biotin. Most of the flavonoids which are known as anti-oxidants are concentrated more in the outer layers, so when you peel off the layers, you should remove as little as possible. Onion can fill your kitchen with a thick spicy aroma. It is a common base vegetable in most Indian dishes, thanks to the wonderful flavor that it adds to any dish.Onions are high in sulphur, Folic acid, Amino acid, vitamin B6 and B9. It has high quantities of water and naturally low in fat. It is high in phytochemical compounds. Onions are known to have antiseptic, antimicrobial and antibiotic properties which help you to get rid of infections.If a piece of onion is inhaled, it can slow down or stop nose bleeding.",
    "Local tomatoes are partly sour and partly sweet and contain many seeds inside which are edible. The red colour present in tomatoes is due to lycopene, an anti-oxidant. Tomatoes contain Vitamin C,K. lycopene, an antioxidant that reduces the risk of cancer and heart-diseases. They protect the eyes from light induced damage. Essential for pregnant women as these tomatoes protect infants against neural tube defects. Essential for pregnant women as these tomatoes protect infants against neural tube defects. Ripe tomatoes should be refrigerated if they need to be stored for a long time.",
    "With a shape resembling that of a cauliflower, Brocollis have clusters of small, tight flower heads. These heads turn bright green on cooking and tastes slightly bitter. Broccoli prevents cancer and reduces cholesterol. Maintains bone and heart health. Good for skin, eyes and has anti-aging properties. Consume fresh broccoli as soon as you can as it will not keep for long. o store, drizzle water droplets on the flower heads, cover loosely in damp paper towels and refrigerate. But never wash broccoli before storing in the refrigerator.",
    "Cauliflower is made up of tightly bound clusters of soft, crumbly, sweet cauliflower florets that form a dense head. Resembling a classic tree, the florets are attached to a central edible white trunk which is firm and tender. One serving of cauliflower contains 77 percent of daily recommended value of vitamin C. Cauliflowers are rich in B complex vitamins, potassium and manganese.They protect from the risk of heart diseases and brain disorders. t also contains cancer fighting nutrient called sulforaphane. Refrigerate in a loosely sealed plastic bag. It keeps well for upto 7 days. Do not store florets for more than 5 days. Cooked and used in soups, rice, curries, gobi parathas( flat breads), one of the most liked recipes.",
    "A popular sweet-tasting root vegetable, Carrots are narrow and cone shaped. They have thick, fleshy, deeply colored root, which grows underground, and feathery green leaves that emerge above the ground. While these greens are fresh tasting and slightly bitter, the carrot roots are crunchy textured with a sweet and minty aromatic taste. Fresho brings you the flavour and richness of the finest crispy and juicy carrots that are locally grown and the best of the region. Carrots provide the highest content of vitamin A of all the vegetables. Brightly orange colored carrots have pigments like carotenoids and flavonoids, that provide several antioxidants and act as a defense against cancer. Refrigerate carrots in a mesh bag. Alternatively to retain freshness and for more longevity, trim off the greens and put whole carrots in a container of water and refrigerate. With this method, they stay nice and crunchy. If the water starts to look cloudy, change it with fresh water.",
    " Brinjals are a nutritionally rich food item. They are rich in dietary fibres, Vitamin C and K, phytonutrient compounds and anti-oxidants. They help in keeping cholesterol levels in check and helps in weight loss while being excellent for controlling blood sugar levels and are also known for preventing cancer and heart diseases. Brinjals are not good for long time storing. So, consume within a few days and store in a cool spot, away from direct sunlight. If not consumed within 2 days, refrigerate by wrapping in a paper towel or perforated plastic bag and use within a week.Bottle brinjals are a nutritionally rich food item. They are rich in dietary fibres, Vitamin C and K, phytonutrient compounds and anti-oxidants. They help in keeping cholesterol levels in check and helps in weight loss while being excellent for controlling blood sugar levels and are also known for preventing cancer and heart diseases. Brinjals are not good for long time storing. So, consume within a few days and store in a cool spot, away from direct sunlight. If not consumed within 2 days, refrigerate by wrapping in a paper towel or perforated plastic bag and use within a week.",
    "Bottle gourds keep the body hydrated and assist in weight loss. They treat urinary tract infection and sleeping disorders while reducing liver inflammation, easing digestion and safeguarding hair against premature greying. To keep it as fresh and healthy as possible, store the entire gourd in a plastic bag or sealed container and refrigerate. Chopped gourds can be stored in a glass or steel container and refrigerated. They can be used to prepare curries, dals and even sweets. For your morning breakfasts, try bottle gourd dosa instead of the normal one for a healthy change..",
    "Store them in a cool, dry and well-ventilated place inside mesh bags. Storing in sealed containers causes molding and sprouting. Used as flavouring in a wide variety of dishes like chutneys, rice, curries, sauce or to prepare garlic bread, pasta, etc. Garlic combats sickness, including the common cold and cough. They reduce blood pressure, the risk of heart diseases and kills intestinal worms and harmful bacteria. Additionally garlics improve athletic performance.",
    "With a shape resembling that of a cauliflower, Brocollis have clusters of small, tight flower heads. These heads turn bright green on cooking and tastes slightly bitter. Broccoli prevents cancer and reduces cholesterol. Maintains bone and heart health. Good for skin, eyes and has anti-aging properties. Consume fresh broccoli as soon as you can as it will not keep for long. o store, drizzle water droplets on the flower heads, cover loosely in damp paper towels and refrigerate. But never wash broccoli before storing in the refrigerator.",
    "Bitter melon helps to overcome Type-2 Diabetes and heals liver problems. It clears acne, builds immunity, eases digestion, cures constipation and helps in weight loss. It prevents cancer cells from multiplying, purifies blood and has healing qualities. Store unwashed bitter melon in a zip lock or plastic bag inside the refrigerator. It is also used to prepare curries and fried snacks. Bitter melon juice is the best medicine to cure several health problems.",
    "Lemon promotes hydration and keeps the skin healthy. They help ease digestion, prevents kidney stones and freshens breath. Lemons are a very good source of Vitamin C. Lemon mixed with honey and water acts as a detoxifying agent. Refrigerate them in a sealed plastic bag. Fresh lemon juice is squeezed and added to many dishes like lemon rice, lemon tea and beverages like lemonades. The lemon peel is also edible and highly nutritious.",
    "Mushrooms boost our immune system. They have anti-cancer benefits. They contain good amounts of riboflavin which is necessary to maintain oral health. They are very low in calories and rich in fibres. Do not store them in a plastic bag as they tend to deteriorate. Refrigerate them in a paper towel or a paper bag. Button mushrooms can be sliced and added to soups, pizzas, and pasta",


    "These edible ruby red roots are smooth and bulbous and have the highest sugar content than any other vegetable. Red beets lower blood pressure, promotes brain and heart health. It fights inflammation and boosts energy levels. While storing beets, trim the leaves 2 inches from the root soon after you buy them as they sap the moisture from the beet root. The root bulbs should also be put into a bag and can be stored in the refrigerator for a maximum of 7 to 10 days. They are used to prepare curries, chutneys and raithas. It's sweet nature makes it a popular ingredient for halwas and other such sweets.",
    "Leaving a moderately pungent taste on the tongue, Green capsicums, also known as green peppers are bell shaped, medium-sized fruit pods. They have thick and shiny skin with a fleshy texture inside. Green capsicums have powerful antioxidants and anti-inflammatory properties. Rich in Vitamin A, B complex, C and phytonutrients. Relieves pain of bone disorders and has the capacity to relax the repirartory passage. Store them in a cool, dry place away from direct sunlight. Keep capsicums dry as moisture makes them rot faster. Refrigerate the peppers unwashed, in a plastic bag and consume within a week. Resort to refrigeration only when they cannot be consumed immediately.",
    "With high water content and crunchy flesh, Cucumbers have striped, light to dark green coloured skin that is edible. Cucumbers keep our body hydrated. Its hard skin has good amount of fiber and minerals. Eating cucumber improves digestion and reduces stress. It reduces the risk of breast, ovarian, uterine and prostate cancers. The anti-inflammatory compounds in cucumbers help remove waste from the body and reduce skin irritation and it contains anti-wrinkling and anti-ageing properties as well. Wrap the cucumbers tightly in a plastic wrap and store them in the refrigerator. It minimizes decay and keeps it fresh for a long time. Cucumebrs can be eaten fresh. They are a healthy snack to munch on when you are bored. Used in salads, soups, sandwiches, rolls, curries, cocktails and pickles.",
    " Ladies' finger is a green vegetable with a tip at the end and a lighter green head, which is inedible and to be thrown away. It tastes mild and slightly grassy. Ladies' finger or okra is a popular vegetable that is nutritious and has a high fibre content. It contains both soluble as well as insoluble fibres and is used in various recipes. The best ladies' fingers are the smaller pods as they are tender. These also taste better. The brighter coloured ones and those that are unblemished, and firm should be picked as they are the best quality lady's finger. The ladies' fingers are sourced directly from the farmers and brought to the shelves carefully, ensuring that the vegetable maintains its freshness and nutrients.  Ladies' finger aids in digestion as it contains prebiotic fiber and controls obesity and cholesterol. It is loaded with Vitamin A, B, C, and traces of Zinc & Calcium Refrigerate them and do not wash them until they are ready to use.",
  ];
  static List<int> price = [42,40,16,120,30,62,42,40,16,120,30,62,58,60,20,34];
  static List<int> quantity=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];


  void setQuantity(bool isIncrement,int index){
     //print("inc"+index.toString());
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
  void setQuantity1(bool isIncrement,int quntatity,int index){
    if(isIncrement)
    {
      quantity[index] =quntatity ;
    }
    else
    {

      quantity[index]= quntatity ;
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