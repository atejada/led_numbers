class LED_Numbers
{
  static Void main()
  {
    leds := ["0":" _  ,| | ,|_| ", 
             "1":"  ,| ,| ", 
             "2":" _  , _| ,|_  ",
             "3":"_  ,_| ,_| ",
             "4":"    ,|_| ,  | ",
             "5":" _  ,|_  , _| ",
             "6":" _  ,|_  ,|_| ",
             "7":"_   , |  , |  ",
             "8":" _  ,|_| ,|_| ",
             "9":" _  ,|_| , _| "]
             
    Str? userInput := ""
    Str[] lines := [,]
    Str? line := ""
  
    echo("Enter a number: ")
    userInput = Env.cur.prompt("> ")
    
    for (i:=0; i<3; ++i){
      line = ""
      userInput.each |Int val | {
        lines = leds[val.toChar].split(',', false)
        line += lines[i]
      }
      echo(line)
    }
  }
}
