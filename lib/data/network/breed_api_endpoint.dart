
class ApiEndPoint {
  static const String keyBreedName = "{{param_breed_name}}";
  static const String keySubBreedName = "{{param_sub_breed_name}}";
  static const String breedList = "breeds/list/all";
  static const String dogListByBreed = "breed/$keyBreedName/images";
  static const String dogListBySubBreed = "breed/$keyBreedName/$keySubBreedName/images";
  static const String randomDogImageBreed = "breed/$keyBreedName/images/random";
  static const String randomDogImageSubBreed = "breed/$keyBreedName/$keySubBreedName/images/random";
}