float xCactus = 180;
float yCactus = 610;
int velMov = 15;

float posXagua[];
float posYagua[];

float posXacido[];
float posYacido[];

float distancia = 0;
float distanciaAcido = 0;
int estadoAgua[];

int estadoAcido[];

int puntaje = 0;

PImage cactus;
PImage agua;
PImage acido;
PImage fondo;

PFont granSubtitulo;
PFont contenido;

void setup(){
  granSubtitulo = loadFont("SweetCupcakeDemo-51.vlw");
  contenido = loadFont("SweetCupcakealtdemo-31.vlw");
  
  cactus = loadImage("cactus.png");
  agua=loadImage("agua.png");
  acido=loadImage("acido.png");
  fondo = loadImage("fondo.jpg");
  
  size (400,720);
  posYacido= new float[10];
  posXacido= new float[10];
  estadoAcido = new int[10];
  
  posXagua = new float[30];
  posYagua = new float[30];
  estadoAgua = new int[30];
  
    
  for(int i = 0 ; i<10; i++){
    posXacido[i]=random(380);
    posYacido[i]=random(-4000);
    estadoAcido[i]=1;
  }


  for(int i = 0 ; i<30; i++){
    posXagua[i]=random(380);
    posYagua[i]=random(-4000);
    estadoAgua[i]=1;
  }
}

void draw(){
  background(fondo);
  puntaje = 0;
  
  //agua
  noStroke();
  fill(229,242,252);
  for(int i = 0; i<30; i ++){
    posYagua[i] = posYagua[i]+4;
    
    if(estadoAgua[i] == 1){
      image(agua,posXagua[i],posYagua[i]);
    } else {
      puntaje = puntaje +1;
    }
    
    
      distancia = dist(mouseX,yCactus,posXagua[i],posYagua[i]);
      if(distancia <= 20){
        estadoAgua[i]=0;
      }
    
  }
  
  //acido
  noStroke();
  fill(193,48,48);
  
  for(int i = 0; i<10; i ++){
    posYacido[i] = posYacido[i]+3;
    distanciaAcido = dist(mouseX,yCactus,posXacido[i],posYacido[i]);
    if(estadoAcido[i] == 1){
      image(acido,posXacido[i],posYacido[i]);
    } else {
      puntaje = puntaje -1;
    }
      
      if(distanciaAcido<20){
        estadoAcido[i]=0;
      }
      
    if(posYacido[i]>4000){
      
      if(puntaje<=20){
        fill(91,26,0);
        textFont(granSubtitulo);
        text("¡Has perdido!",70,250);
        
        fill(94,60,0);
        textFont(contenido);
        text("!El cactus no recolectó",75,300);
        text(" suficiente agua!",115,335);
        } else {
          
        fill(78,91,0);
        textFont(granSubtitulo);
        text("¡Has ganado!",70,250);
        
        fill(94,60,0);
        textFont(contenido);
        text("El cactus sobrevivirá",75,300);
        text(" un año más",130,335);
      }
      
    }
    }
    
  
  //Cactus
  image(cactus,mouseX,yCactus);
  
  fill(255);
  textFont(granSubtitulo,20);
  text("Puntaje: " + puntaje,30,30);
  //print(puntaje);
  
  }// fin del draw
  
