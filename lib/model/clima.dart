 
 class ClimaModel {
   String  name;
   var  main;
   var  wind;
   var  weather;

  ClimaModel(
    {required this.name,
    required this.main,
    required this.wind,
    required this.weather,}
  );

  factory ClimaModel.fromJson(Map<String, dynamic> json){
    return ClimaModel(
      name: json['name'],
      main: json['main'],
      wind: json['wind'],
      weather: json['weather'],
    );
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['main'] = main;
    data['weather'] = weather;
    data['wind'] = wind;
    return data;
  }
 

 }