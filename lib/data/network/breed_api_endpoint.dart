
class ApiEndPoint {
  static const String keyBreadName = "{{param_breed_name}}";
  static const String keySubBreadName = "{{param_sub_breed_name}}";
  static const String breedList = "breeds/list/all";
  static const String dogListByBreed = "breed/$keyBreadName/images";
  static const String dogListBySubBreed = "breed/$keyBreadName/$keySubBreadName/images";
  static const String randomDogImageBreed = "breed/$keyBreadName/images/random";
  static const String randomDogImageSubBreed = "breed/$keyBreadName/$keySubBreadName/images/random";
}

//random breed image https://dog.ceo/api/breed/australian/images/random/5
//random sub bread image https://dog.ceo/api/breed/australian/shepherd/images/random/5

//https://dog.ceo/api/breed/hound/afghan/images
//https://dog.ceo/api/breed/hound/afghan/images