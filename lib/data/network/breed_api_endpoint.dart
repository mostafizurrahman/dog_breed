
class ApiEndPoint {
  static const String keyBreedName = "{{param_breed_name}}";
  static const String keySubBreedName = "{{param_sub_breed_name}}";
  static const String breedList = "/list/all";
  static const String dogListByBreed = "/$keyBreedName/images";
  static const String dogListBySubBreed = "/$keyBreedName/$keySubBreedName/images";
  static const String randomDogImageBreed = "/$keyBreedName/images/random";
  static const String randomDogImageSubBreed = "/$keyBreedName/$keySubBreedName/images/random";
}

//random breed image https://dog.ceo/api/breed/australian/images/random/5
//random sub Breed image https://dog.ceo/api/breed/australian/shepherd/images/random/5

//https://dog.ceo/api/breed/hound/afghan/images
//https://dog.ceo/api/breed/hound/afghan/images