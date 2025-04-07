import 'package:flutter/material.dart';
import 'package:test_widget/slidable_features/user.dart';

class ListSlideProvider extends ChangeNotifier {
  List<User> _users = [
    User(name: 'Alice Doe', email: 'alice.doe@example.com'),
    User(name: 'Michael Smith', email: 'michael.smith@example.com'),
    User(name: 'Emma Johnson', email: 'emma.johnson@example.com'),
    User(name: 'Liam Brown', email: 'liam.brown@example.com'),
    User(name: 'Olivia Jones', email: 'olivia.jones@example.com'),
    User(name: 'Noah Garcia', email: 'noah.garcia@example.com'),
    User(name: 'Ava Miller', email: 'ava.miller@example.com'),
    User(name: 'Elijah Davis', email: 'elijah.davis@example.com'),
    User(name: 'Isabella Wilson', email: 'isabella.wilson@example.com'),
    User(name: 'James Martinez', email: 'james.martinez@example.com'),
    User(name: 'Sophia Anderson', email: 'sophia.anderson@example.com'),
    User(name: 'Benjamin Taylor', email: 'benjamin.taylor@example.com'),
    User(name: 'Charlotte Thomas', email: 'charlotte.thomas@example.com'),
    User(name: 'Lucas Hernandez', email: 'lucas.hernandez@example.com'),
    User(name: 'Mia Moore', email: 'mia.moore@example.com'),
    User(name: 'Henry Martin', email: 'henry.martin@example.com'),
    User(name: 'Amelia Jackson', email: 'amelia.jackson@example.com'),
    User(name: 'Alexander White', email: 'alexander.white@example.com'),
    User(name: 'Harper Lee', email: 'harper.lee@example.com'),
    User(name: 'Daniel Clark', email: 'daniel.clark@example.com'),
    User(name: 'Evelyn Lewis', email: 'evelyn.lewis@example.com'),
    User(name: 'Matthew Walker', email: 'matthew.walker@example.com'),
    User(name: 'Abigail Hall', email: 'abigail.hall@example.com'),
    User(name: 'Jackson Young', email: 'jackson.young@example.com'),
    User(name: 'Emily Allen', email: 'emily.allen@example.com'),
    User(name: 'Sebastian King', email: 'sebastian.king@example.com'),
    User(name: 'Elizabeth Scott', email: 'elizabeth.scott@example.com'),
    User(name: 'David Green', email: 'david.green@example.com'),
    User(name: 'Sofia Adams', email: 'sofia.adams@example.com'),
    User(name: 'Carter Baker', email: 'carter.baker@example.com'),
    User(name: 'Ella Nelson', email: 'ella.nelson@example.com'),
    User(name: 'Wyatt Hill', email: 'wyatt.hill@example.com'),
    User(name: 'Scarlett Ramirez', email: 'scarlett.ramirez@example.com'),
    User(name: 'Grayson Campbell', email: 'grayson.campbell@example.com'),
    User(name: 'Chloe Mitchell', email: 'chloe.mitchell@example.com'),
    User(name: 'Levi Roberts', email: 'levi.roberts@example.com'),
    User(name: 'Victoria Carter', email: 'victoria.carter@example.com'),
    User(name: 'Julian Phillips', email: 'julian.phillips@example.com'),
    User(name: 'Grace Evans', email: 'grace.evans@example.com'),
    User(name: 'Ezra Turner', email: 'ezra.turner@example.com'),
    User(name: 'Hannah Torres', email: 'hannah.torres@example.com'),
    User(name: 'Leo Parker', email: 'leo.parker@example.com'),
    User(name: 'Aria Collins', email: 'aria.collins@example.com'),
    User(name: 'Nathan Edwards', email: 'nathan.edwards@example.com'),
    User(name: 'Zoe Stewart', email: 'zoe.stewart@example.com'),
    User(name: 'Isaac Morris', email: 'isaac.morris@example.com'),
    User(name: 'Lily Rogers', email: 'lily.rogers@example.com'),
    User(name: 'Samuel Reed', email: 'samuel.reed@example.com'),
  ];

  List<User> get users => _users;

  void setUsers(List<User> value) {
    _users = value;
    notifyListeners();
  }

  void clearUsers() {
    _users.clear();
    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }

  void RemoveUser(User user) {
    _users.remove(user);
    notifyListeners();
  }
  void Removeindex(int index)
  {
     _users.removeAt(index);
     notifyListeners();
  }
}
