//The | wind | was | a | torrent | of | darkness | among | the | gusty | trees.  
//The wind | was | a torrent | of | darkness | among the  gusty | trees.   

String[] the_wind = {"The wind","The sound"};
String[] was = {"was","had","hasn't","wasn't"};
String [] a_torrent = {"a torrent","a storm","a bunch","an ocean"};
String [] of = {"of"};
String [] darkness = {"darkness","friends","lights"};
String [] among = {"among","around","between"};
String [] the_gusty = {"the gusty","the hasty","the nasty"};
String [] trees = {"trees","bees","classes"};

PFont font;

void setup()
{
  size(1200,800);
  font = createFont("baskerville.ttf",80);
}

void draw()
{
  String sentence = 
    randomWord(the_wind) +" "+ 
    randomWord(was) +" "+ 
    randomWord(a_torrent) +" "+ 
    randomWord(of) +" "+ 
    randomWord(darkness) +" "+ 
    randomWord(among) +" "+ 
    randomWord(the_gusty) +" "+ 
    randomWord(trees) + ".";
    
  background(color(255,255,255));
  fill(color(0,0,0));
  textSize(80);
  textFont(font);
  text(sentence,100,100,width-200,height-200);
  delay(3000);
}

String randomWord(String[] dictionary)
{
  return(dictionary[round(random(dictionary.length-1))]);
}
