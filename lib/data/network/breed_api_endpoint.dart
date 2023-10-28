
class ApiEndPoint {
  static const String keyBreadName = "{{param_breed_name}}";
  static const String keySubBreadName = "{{param_sub_breed_name}}";
  static const String breedList = "/list/all";
  static const String dogListByBreed = "/$keyBreadName/images";
  static const String dogListBySubBreed = "/$keyBreadName/$keySubBreadName/images";
  static const String randomDogImageBreed = "/$keyBreadName/images/random";
  static const String randomDogImageSubBreed = "/$keyBreadName/$keySubBreadName/images/random";
}

//random breed image https://dog.ceo/api/breed/australian/images/random/5
//random sub bread image https://dog.ceo/api/breed/australian/shepherd/images/random/5

//https://dog.ceo/api/breed/hound/afghan/images
//https://dog.ceo/api/breed/hound/afghan/images