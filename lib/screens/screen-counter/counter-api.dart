class CounterApi{
  int value;
  CounterApi({this.value = 0});

  void incrementCounter(){
    value++;
    if(value>100){
      this.value = 100;
    }
  }

  void decrementCounter(){
    value--;
    if(value<0){
      this.value = 0;
    }
  }


}