class BilheteUnico {
  double saldo = 0.0;
  double valorDiaUtil = 0.0;
  double valorDiaFds = 0.0;
  
  LinkedHashMap valorPorDia ;
    
  BilheteUnico(double saldo, double valorDiaUtil, [double valorDiaFds = 0.0]){
    this.saldo = saldo;
    this.valorDiaUtil = valorDiaUtil;
    this.valorDiaFds = valorDiaFds;
    this.valorPorDia =  new LinkedHashMap();
  }
  
  
  void adicionaSaldo(double newSaldo){
    saldo += newSaldo;
  }
  
  
  Date proximaRecarga([Date now]){
    if(now == null){
      now = new Date.now().add(new Duration(1));
    }
    double currSaldo = saldo;
    Date currDate = now;
    while(currSaldo >= valorDiaUtil){
      currDate = currDate.add(new Duration(1));
      if(currDate.weekday == Date.SAT || currDate.weekday == Date.SUN){
        currSaldo -= valorDiaFds;
        valorPorDia[Utils.formatDate(currDate)]= currSaldo;
      } else {
        currSaldo -= valorDiaUtil;
        valorPorDia[Utils.formatDate(currDate)] = currSaldo;
      }
    }
    return currDate;
  }
   
  toString(){
    return "Saldo: $saldo, valor dia util: $valorDiaUtil";
  }
}
