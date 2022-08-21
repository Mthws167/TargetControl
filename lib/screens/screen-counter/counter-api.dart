class CounterApi{
  int valueMale;
  int valueFemale;
  int valueChield;
  CounterApi({this.valueMale = 0,this.valueFemale=0,this.valueChield=0});

  void incrementCounter(){
    valueMale++;
    valueFemale++;
    valueChield++;
    if(valueMale>100 && valueFemale>100 && valueChield>100){
      this.valueMale = 100;
      this.valueFemale = 100;
      this.valueChield = 100;
    }
  }

  void decrementCounter(){
    valueMale--;
    valueFemale--;
    valueChield--;
    if(valueMale<0 && valueFemale<0 && valueChield<0){
      this.valueMale = 0;
      this.valueFemale = 0;
      this.valueChield = 0;
    }
  }


}