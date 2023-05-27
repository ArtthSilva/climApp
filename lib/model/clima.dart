 
 class Clima {
   final String name;
   var main;
   var wind;
   var weather;

  Clima(
    {required this.name,
    required this.main,
    required this.wind,
    required this.weather,}
  );

  factory Clima.fromJson(Map<String, dynamic> json){
    return Clima(
      name: json['name'],
      main: json['main'],
      wind: json['wind'],
      weather: json['weather'],
    );
  }

 }