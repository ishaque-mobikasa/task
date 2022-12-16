class CustomWarningStrings {
  static const emailAlreadyRegistered =
      "OOPS !!..E mail is already registered..Try Logging in or use a different Email";
  static const registrationSuccess =
      "Successfully created new Account..Now try Logging in";
  static const validCredentials = "Valid Credentials";
  static const loginSuccess = "You are Successfully Logged in";
  static const invalidCredentials = "Invalid Credentials";
  static const notRegistered = "You are not registered..";
  static const registerPrompt = "Try Registering with Us";
}
class SharedPrefString{
  static const String isLoggedIn="isLoggedIn";
} 
class CategoryStrings{
static const String jewelery="jewelery";
static const String electronics="electronics";
static const String mensClothing="men's clothing";
static const String womensClothing="women's clothing";
}
//Api EndPoints
class MyApiUrl {
  static String backendUrl = "https://fakestoreapi.com/";
  static String allProducts = "products";
  static String allCategories = "products/categories";
  static String jewelery = "products/category/jewelery";
  static String electronics = "products/category/electronics";
  static String mensClothing = "products/category/men's clothing";
  static String womensClothing = "products/category/women's clothing";
}
