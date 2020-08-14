class MarcaService {
  static final List<String> cities = [
    'ACURA',
    'ALFA ROMEO',
    'ASTON MARTIN',
    'AUDI',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  static List<String> getSuggestions(String query, List<String> data) {
    List<String> matches = List();
    matches.addAll(data);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}
