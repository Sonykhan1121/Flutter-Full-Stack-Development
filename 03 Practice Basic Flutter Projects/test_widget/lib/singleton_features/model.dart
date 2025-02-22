class Model {


  static Model? _instance;

  Model._init(){
    print('Model Initialized');
  }

  static Model get instance {
    _instance ??=Model._init();
    return _instance!;
  }
  void doSomething()
  {
    print('Do something');
  }
}
