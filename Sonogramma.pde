void sonogramma(float[] A, int N, int NumCampioni, int Ci,int m){
 draw(A, N, NumCampioni, Ci, m);
}
void draw(float[] A, int N, int NumCampioni, int Ci, int m) {
  //N=4096 m=12 k=10.8 ////  N=2048 m=11 k=21.6   N=1024  m=10   k=43.2     ///  N=16384 m=14 k= 2.7

  int i=0; 
  float k=0;

  float M=max(A), min=min(A);
  float[] r= new float[N]; 
  float[] g= new float[N]; 
  float[] b= new float[N]; 
  k=10.8*4096/N; 

  
  
  
  
  float alpha=width/(( float)NumCampioni);
  float beta=(float)k*height/( float)(22050);
  float gamma=(float)N*width/( float)NumCampioni;
  float delta=(float)k*height/( float)(22050);
  
  for (i=0; i<N; i++)
  {
    g[i]= map(A[i], min, M, 0, 255);
    if (g[i]<15)
    {
      color c = color(r[i]*12, 0, b[i]*8); 
      fill(c);
      noStroke();
      rect((float)Ci*alpha, (height-( float)i*beta)/2, gamma, 0.5*delta, 7);
    } else {
      color c = color(255, g[i], 0); 
      fill(c);
      noStroke();
      rect((float)Ci*alpha, (height-( float)i*beta)/2, gamma, 0.5*delta, 7);
      //abbina colori 
      // rgb=  giallo= 255, 255, 0  arancione 255, 153,0    rosso 255,0,0 viola scuro 66  49  137 viola 143 0 153 viola melanzana 153 17 153  blu 0,0,255
    }
  }
}


