import 'dart:io';

//======= enum =======
enum Position { attacker, goalkeeper, middle, defence }

//====== mixin ====
mixin IdGenerator {
  static int _counter = 0;
  int generateId() {
    _counter++;
    return _counter;
  }
}

//======== User class =======
class User with IdGenerator {
  late int _id;
  String _name;
  int? _phone;
  Position? _position;
  String _password;
  double _budget = 0;

  User({required String name, required String password})
      : _name = name,
        _password = password {
    _id = generateId();
  }

  int get id => _id;
  String get name => _name;
  double get budget => _budget;

  set setName(String value) => _name = value;
  set setPhone(int value) => _phone = value;
  set setPosition(Position value) => _position = value;

  void deposit([double amount = 0]) {
    _budget += amount;
  }

  bool withdraw(double amount) {
    if (_budget >= amount) {
      _budget -= amount;
      return true;
    }
    return false;
  }

  void showInfo() {
    print(
        "ID:$_id | Name:$_name | Phone:$_phone | Position:$_position | Balance:$_budget");
  }
}

/// ================= PITCH =================
class Pitch with IdGenerator {
  late int _id;
  String name;
  int ownerPhone;

  Pitch({required this.name, required this.ownerPhone}) {
    _id = generateId();
  }

  int get id => _id;

  void display() {
    print("Pitch ID:$id | Name:$name | Contact:$ownerPhone");
  }
}

/// ================= GAME =================
class Game with IdGenerator {
  late int _id;
  String name;
  User owner;
  int playersCount;
  int joinedPlayers = 1;
  double price;

  Game(
      {required this.name,
      required this.owner,
      required this.playersCount,
      this.price = 2}) {
    _id = generateId();
  }

  int get id => _id;

  void join(User user) {
    if (joinedPlayers >= playersCount) {
      print("Game is full");
      return;
    }

    if (user.withdraw(price)) {
      joinedPlayers++;
      print("Joined successfully (Paid $price)");
    } else {
      print("Not enough balance");
    }
  }

  void display() {
    print(
        "Game ID:$id | $name | Players:$joinedPlayers/$playersCount | Price:$price");
  }
}

/// ================= AUTH =================
List auth(Map<String, String> usersAuth) {
  while (true) {
    print("\n1- Login");
    print("2- Signup");
    print("3- Exit");

    String input = stdin.readLineSync() ?? "";

    switch (input) {
      case "1":
        print("Username:");
        String username = stdin.readLineSync() ?? "";

        print("Password:");
        String password = stdin.readLineSync() ?? "";

        if (usersAuth[username] == password) {
          return [true, User(name: username, password: password)];
        }
        print("Invalid credentials");
        break;

      case "2":
        print("Username:");
        String username = stdin.readLineSync() ?? "";

        print("Password:");
        String password = stdin.readLineSync() ?? "";

        usersAuth[username] = password;
        return [true, User(name: username, password: password)];

      case "3":
        exit(0);

      default:
        print("Invalid choice");
    }
  }
}

/// ================= SEARCH GAME =================
void searchGame(List<Game> games) {
  print("Enter game id:");
  int id = int.parse(stdin.readLineSync() ?? "0");

  for (var g in games) {
    if (g.id == id) {
      g.display();
      return;
    }
  }
  print("Game not found");
}

/// ================= DELETE GAME =================
void deleteGame(List<Game> games) {
  print("Enter game id to delete:");
  int id = int.parse(stdin.readLineSync() ?? "0");

  print("Are you sure? (y/n)");
  String confirm = stdin.readLineSync() ?? "";

  if (confirm.toLowerCase() == "y") {
    games.removeWhere((g) => g.id == id);
    print("Game deleted");
  }
}

/// ================= PROFILE =================
void editProfile(User user) {
  while (true) {
    print("\n1- Show info");
    print("2- Deposit");
    print("0- Back");

    String input = stdin.readLineSync() ?? "";

    switch (input) {
      case "1":
        user.showInfo();
        break;

      case "2":
        print("Amount:");
        user.deposit(double.parse(stdin.readLineSync() ?? "0"));
        break;

      case "0":
        return;
    }
  }
}

/// ================= HOME MENU =================
void homeMenu(List<Pitch> pitches, List<Game> games, User user) {
  while (true) {
    print("\n===== HOME MENU =====");
    print("1- Show pitches");
    print("2- Show games");
    print("3- Book pitch");
    print("4- Join game");
    print("5- Search game");
    print("6- Delete game");
    print("7- Profile");
    print("0- Exit");

    String input = stdin.readLineSync() ?? "";

    switch (input) {
      case "1":
        pitches.forEach((p) => p.display());
        break;

      case "2":
        games.forEach((g) => g.display());
        break;

      case "3":
        print("Game name:");
        String name = stdin.readLineSync() ?? "";

        print("Players:");
        int players = int.parse(stdin.readLineSync() ?? "10");

        Game game =
            Game(name: name, owner: user, playersCount: players);

        games.add(game);
        print("Game created");
        break;

      case "4":
        print("Enter game id:");
        int id = int.parse(stdin.readLineSync() ?? "0");

        for (var g in games) {
          if (g.id == id) {
            g.join(user);
            break;
          }
        }
        break;

      case "5":
        searchGame(games);
        break;

      case "6":
        deleteGame(games);
        break;

      case "7":
        editProfile(user);
        break;

      case "0":
        exit(0);
    }
  }
}

/// ================= MAIN =================
void main() {
  Map<String, String> usersAuth = {};

  List<Pitch> pitches = [
    Pitch(name: "Oman Arena", ownerPhone: 99112233),
    Pitch(name: "Seeb Stadium", ownerPhone: 99223344),
  ];

  List<Game> games = [];

  List result = auth(usersAuth);

  if (result[0]) {
    User user = result[1];
    homeMenu(pitches, games, user);
  }
}