
class Player{
  
  int cash;
  
  String name;
  
  //where they are
  int locationIndex;
  
  ArrayList<PropertyTile> properties;
  
  //reference to where they currently are
  int currOnIndex;
  
  //0 is starting turn (asking if want to roll)
  //1 is doing the action of the tile they landed on
  //2 is buying and placing houses
  //3 currently placing a house
  //4 means it should move to the next player
  int turnProgress;
  
  public Player(){
    cash = 1500;
    locationIndex = 0;
    
    properties = new ArrayList<PropertyTile>();
    
    turnProgress = 0;
    
    currOnIndex = 0;
  }
  
  void buyProperty(PropertyTile which){
    //reduce money
    //change the values for which
    which.owned = true;
    which.owner = this;
    which.mortgaged = false;
    cash -= which.buyCost;
    which.numHouses = 0;
    //display a bar on the property showing new ownership TO-DO
  }
  
  void rollDie(){
    int roll = (int) (random(6) + 1);
    locationIndex += roll;
    locationIndex %= NUM_TILES;
    
    turnProgress = 1;
    
    analyzeTile();
  }
  
  void display(){
    //display the player at the tile's postions
  }
  
  boolean canKeepPlaying(){
    return cash > 0;
  }
  
  void analyzeTile(){
    if(board[locationIndex].tileType.equals("TileTile")){
      //just a normal tile so don't do anything (free parking, go, regular jail)
    }
    else if(board[locationIndex].tileType.equals("PropertyTile")){
      PropertyTile tile = (PropertyTile) board[locationIndex];
      if(tile.owned){
        tile.owner.cash += (tile.rent[tile.numHouses]);
        cash -= tile.rent[tile.numHouses];
      }
      else{
        
      }
    }
    else if(board[locationIndex].tileType.equals("JailTile")){
      
    }
    else if(board[locationIndex].tileType.equals("CardTile")){
      
    }
    //if property
      //if unowned
        //ask if buying
      //if owned
        //pay rent
    //if go to jail
      //go to jail
    //if draw card
      //draw a card
      
    //all of those change turnProgress accordingly
  }
  
  void buyHouse(){
    //change player's money
    //change the progress
  }
  
  void applyCard(Card which){
    //figure this out
  }
  
}
