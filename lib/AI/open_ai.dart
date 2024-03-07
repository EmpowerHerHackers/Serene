import 'package:dart_openai/dart_openai.dart';

class MyOpenAI {
  Future<List<String>> generateImageWithOpenAi(
      String objectPrompt, String prompt) async {
    OpenAI.apiKey = "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";
    List<String> result = [];
    final image = await OpenAI.instance.image.create(
      prompt: objectPrompt,
      n: 5,
    );
    final imageUrl = image.data.map((img) => img.url.toString()).toList();
    result.addAll(imageUrl);
    return result;
  }

  List<String> generateImageList(String prompt) {
    OpenAI.apiKey = "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";
    List<String> result = [];
    if (result.isEmpty) {
      if (prompt == "Pizza") {
        result = [
          "https://media-cdn.tripadvisor.com/media/photo-s/12/26/82/db/pizza.jpg",
          "https://www.eatingwell.com/thmb/k3RhYf4XhAeqAejYjdInOlSOp6I=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/gettyimages-1124303516-36413b5bf61f45f1b7d18d90000b56b7.jpg",
          "https://www.iheartnaptime.net/wp-content/uploads/2023/04/Pepperoni-Pizza-Recipe-I-Heart-Naptime.jpg",
          "https://www.foodandwine.com/thmb/3kzG4PWOAgZIIfZwMBLKqoTkaGQ=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/margherita-pizza-with-argula-and-prosciutto-FT-RECIPE0721-04368ec288a84d2e997573aca0001d98.jpg",
        ];
      } else if (prompt == "Book") {
        result = [
          "https://m.media-amazon.com/images/I/81UZKmZuHnL._AC_UF1000,1000_QL80_.jpg",
          "https://hips.hearstapps.com/hmg-prod/images/gh-best-romance-books-64ecb8c82221e.png",
          "https://cdn.britannica.com/21/182021-050-666DB6B1/book-cover-To-Kill-a-Mockingbird-many-1961.jpg",
          "https://sclsnj.org/wp-content/uploads/Last-Watch.jpg",
        ];
      } else if (prompt == "Jewelry") {
        result = [
          "https://www.investopedia.com/thmb/iICoETnrs3knwomzKogX6FDj1zI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/shutterstock_188501252-5bfc3f0d46e0fb00260fe45a.jpg",
          "https://nypost.com/wp-content/uploads/sites/2/2023/01/mejuri-jewelry.jpg",
          "https://noraydesigns.com/cdn/shop/articles/types_of_gold_jewelry.jpg",
          "https://www.treehugger.com/thmb/-LZGJ_SsoRVF19qIwztS-Ecg9CA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/13-141c94fedab74c5b84dbbf7210e9f6a1.jpg",
          "https://images.grownbrilliance.com/productimages/RIGTXR05878/medium/RIGTXR05878-RG-PE-PN-141-M0.jpg",
        ];
      } else {
        result = [
          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
          "https://img.freepik.com/premium-vector/default-image-icon-vector-missing-picture-page-website-design-mobile-app-no-photo-available_87543-11093.jpg",
        ];
      }
    }
    return result;
  }

  List<String> generateTitleWithOpenAi(String prompt) {
    List<String> result = [];

    if (prompt == "Pizza") {
      result = [
        "Margherita Pizza",
        "Pepperoni Delight Pizza",
        "Supreme Veggie Pizza",
        "Hawaiian Luau Pizza",
        "Meat Lover's Feast Pizza",
        "BBQ Chicken Delight Pizza",
        "Four Cheese Extravaganza Pizza",
        "Mediterranean Delight Pizza",
        "Spicy Sausage Sensation Pizza",
        "Garden Fresh Veggie Pizza",
        "Buffalo Chicken Ranch Pizza",
        "Classic Italiano Pizza",
        "Pesto Perfection Pizza",
        "White Garlic Chicken Pizza",
        "Veggie Lovers' Dream Pizza",
      ];
    } else if (prompt == "Burger") {
      result = [
        "Classic Cheeseburger",
        "Bacon BBQ Burger",
        "Mushroom Swiss Burger",
        "Spicy Jalapeno Burger",
        "Double Bacon Deluxe Burger",
        "Veggie Supreme Burger",
        "California Turkey Burger",
        "Southwestern Chipotle Burger",
        "Blue Cheese Bacon Burger",
        "Teriyaki Pineapple Burger",
        "Guacamole Fiesta Burger",
        "BBQ Ranch Chicken Burger",
        "Buffalo Blue Chicken Burger",
        "Black Bean Veggie Burger",
        "Chili Cheeseburger"
      ];
    } else if (prompt == "Jewelry") {
      result = [
        "Elegant Diamond Necklace",
        "Stunning Sapphire Earrings",
        "Sparkling Emerald Bracelet",
        "Chic Gold Bangle",
        "Timeless Pearl Pendant",
        "Exquisite Ruby Ring",
        "Dazzling Crystal Choker",
        "Opulent Opal Brooch",
        "Glamorous Garnet Anklet",
        "Sophisticated Silver Cuff",
        "Vintage Cameo Pin",
        "Enchanting Amethyst Necklace",
        "Delicate Rose Gold Chain",
        "Modern Minimalist Hoop Earrings",
        "Art Deco Diamond Brooch"
      ];
    } else {
      result = [
        "Mystic Moonstone Necklace",
        "Midnight Star Sapphire Earrings",
        "Whimsical Woodland Bracelet",
        "Enigmatic Enamel Brooch",
        "Radiant Rainbow Gemstone Ring",
        "Serene Seashell Pendant",
        "Dreamy Dandelion Seed Necklace",
        "Aurora Borealis Crystal Bracelet",
        "Twilight Twilight Topaz Earrings",
        "Galactic Geode Necklace",
        "Silent Serenity Amethyst Ring",
        "Sunset Skyline Citrine Bracelet",
        "Mystical Mermaid Pearl Necklace",
        "Secret Garden Emerald Earrings",
        "Cherry Blossom Diamond Necklace"
      ];
    }
    return result;
  }
}
