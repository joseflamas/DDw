//################################################################
//## DDLogoV001::13032021
//## Darc Data®, DarcData®, DD®, darc data®, darcdata®, dd®.
//## FEELGOODSOFTWAREBYGUILLERMOGONZÁLEZIRIGOYENCOFOUNDERDD
//################################################################
//# Titulo: Dark data
//# País: México
//# Año: 2021
//# Técnica: Software
//# Autor: Guillermo González Irigoyen



//CANVAS
int pW, pH;
PFont pTipografia;
int pbordeSuperior  = 0;
int pbordeIzquierdo = 3;
int pTamanoLetra    = 24;
int pTamanoLinea    = 26;
int pLargoLetra     = 26;
int pInterLineado   = 0;
int pNumberodeCaracteresTotales = 42; //42 para un logo de 450X400 px aprox;
int lposX,lposY;
int tamanoKey = 4;
String k1 = "DARC DATA";
String k2 = "DARCDATA";
String k3 = "DARC";
String k4 = "DATA ";
String combinaciones = "DARC DATA DARC DATA";
String kt = "";
String cuerda = "";// { "DATA POR CUADRO"}
int delayInterpretacion  = 250; //menos es mas tiempo.
int delayI;                     //para modificacion desde el loop.
int delayColision        = 2;




void setup()
{
  //CANVAS
  //int altura = pH - (2*pTamanoLinea);
  size(640, 480);//, P2D);
  pW=width;
  pH=height;
  frameRate(24);
  smooth();
  background(255,255);
  textFont(loadFont("SourceCodePro-Regular-24.vlw"));
  textSize(pTamanoLetra);
  lposX=pbordeIzquierdo;
  lposY=pTamanoLinea+pbordeSuperior;
  pNumberodeCaracteresTotales=((pW*(pH-pTamanoLinea))/(pTamanoLinea*pLargoLetra));
  delayInterpretacion=(pNumberodeCaracteresTotales);
}



void draw()
{
  //Color inicial NO MATCH
  background(255,255);
  fill(0,0,0,255);
  smooth();
  delayI = delayInterpretacion;
  //frameRate(delayI);
  for(int r = 0; r < pNumberodeCaracteresTotales; r++)
  {
    cuerda+=combinaciones.charAt(int(random(0,combinaciones.length())));
  }
  String[] m1 = match( cuerda , k1);
  String[] m2 = match( cuerda , k2);
  String[] m3 = match( cuerda , k3);
  String[] m4 = match( cuerda , k4);
  int lugarColision = pNumberodeCaracteresTotales;

  

  //CONDICIONES M1
  if( m1 != null )
  {
    lugarColision=cuerda.indexOf(m1[0]);
    kt = "k1";
    tamanoKey = k1.length();
    frameRate(delayColision);
    background(55,255);
    fill(0,0,0,255);
  }
  //CONDICIONES M2
  if( m2 != null )
  {
    lugarColision=cuerda.indexOf(m2[0]);
    kt = "k2";
    tamanoKey = k2.length();
    frameRate(delayColision);
    background(50,255);
     fill(154,154,154,255);
  }
  //CONDICIONES M3
  if( m3 != null )
  {
    lugarColision=cuerda.indexOf(m3[0]);
    kt = "k3";
    tamanoKey = k3.length();
    frameRate(delayColision);
    background(55,255);
    fill(0,0,0,255);
  }
  //CONDICIONES M4
  if( m4 != null )
  {
    lugarColision=cuerda.indexOf(m4[0]);
    kt = "k4";
    tamanoKey = k4.length();
    frameRate(delayColision);
    background(255,255);
    fill(166,166,166,255);
  }
  
  for(int i = 0; i < pNumberodeCaracteresTotales; i++)
  {
    if((lugarColision+tamanoKey)!= pNumberodeCaracteresTotales && 
                              i >= lugarColision &&
                              i <  lugarColision+tamanoKey)
    {
      if (kt == "k1" || kt == "k3") { fill(255,255,255,255); } else { fill(0,0,0,255); }

    } else {

      if(kt == "k1")
      {
        fill(0,0,0,255);
      }
      if(kt == "k2")
      {
        fill(186,74,74,255);
      }
      if(kt == "k3")
      {
        fill(0,0,0,255);
      }
      if(kt == "k4")
      {
        fill(166,166,166,255);
      }

    }
    text(cuerda.charAt(i), lposX, lposY);
    lposX+= pLargoLetra;
    


      if(lposX > pW)
      {
        lposX=pbordeIzquierdo;
        lposY+=pTamanoLinea;
      }
      if(lposY > pH)
      {
        lposY=pTamanoLinea+pbordeSuperior;
      }


  }
  cuerda="";



  
}
