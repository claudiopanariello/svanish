import java.awt.*;
import java.awt.event.*;
import javax.swing.JFileChooser;

Scrollbar redSlider, redSlider1;

int NumCampioni, setNumCampioni, setNumCampioni1;
float[] finale3;

int m, Ci=0, Cf=0;

void setup() 
{  //Per aprire il file o decommento la parte di sotto e si aprirà la finestra di dialogo, oppure lo scrivo direttamente nella riga più in basso
  /*
  JFileChooser chooser = new JFileChooser();
  chooser.setFileFilter(chooser.getAcceptAllFileFilter());
  File dataDir = new File(sketchPath, "data");
  chooser.setSelectedFile(dataDir); 
  int returnVal = chooser.showOpenDialog(null);
  String file;
  if (returnVal == JFileChooser.APPROVE_OPTION)
  {
    file = chooser.getSelectedFile().getName();
    println("File da elaborare: " + file);
  }  
  file = chooser.getSelectedFile().getName();
  */
  int i=0, j=0;
  String file = "ostia_riff.wav";  //nome del file da elaborare
  byte c[] = loadBytes(file);

  int[] Vettore_c= new int[3];

  size(1000, 700);
  background(0, 0, 0);

  Vettore_c=ReadWav(c);


  NumCampioni=Vettore_c[0];
  float[] d=new float[NumCampioni];
  btf(c, d, Vettore_c);

  /////////////////FFT///////////////////

  int N = 65536; // 65536// 32768// 16384 //8192 // 4096 // 2048 // 1024 // 512 // 256
  int ni=-1;
  m=(int)round(log(N)/log(2)); 
  int overlapping = 4;
  float[][] f1= new float[N][2];
  float[] A= new float[N/2+1];
  float[] fi= new float[N/2+1];
  float[][] G= new float[N][2];
  float[] fre= new float[N];
  //float[] finale3= new float[NumCampioni];
  finale3= new float[NumCampioni];

  float[] ampfin= new float[NumCampioni];
  while (Cf + N -1 <= NumCampioni)
  {
    ni++;
    Ci=(ni*N)/overlapping;
    Cf=Ci+N-1;
  }
  println(ni);
  int numero_iterazioni=ni;
  Ci=0;
  Cf=0;
  ni=-1;

  while (Cf + N -1 <= NumCampioni)
  {
    ni++;
    Ci=(ni*N)/overlapping;
    Cf=Ci+N-1;
    j=0;
    for (i=Ci; i<=Cf; i++)
    {
      f1[j][0]=d[i]* (0.5 - 0.5 * cos(TWO_PI * (float)j*2 / (float)N));
      f1[j][1]=0;
      // println(j+" "+f1[j][0]+" ");
      j++;
    }

    // println(i +" "+Ci+" "+Cf);

    FFT(m, f1);

    AmpiezzeFasi(N, f1, A, fi);

    println("Svanishing " + ni*100/numero_iterazioni + "% ..."); 
    Svanish(A, N, numero_iterazioni, ni);

    InversoAmpiezzeFasi(N, G, A, fi);

    IFFT(m, G);

    for (i=0; i<N; i++) fre[i]=G[i][0]* (0.5 - 0.5 * cos(TWO_PI * (float)i / (float)N));

    j=0;
    // println(ni+" "+ Ci +" "+ Cf);
    for (i=Ci; i<=Cf; i++) {
      finale3[i]+=fre[j];
      j++;
    }
  }//fine while
  // println(m);

  WriteWav(finale3, NumCampioni, "Svanish " + N + " " + file);
  println("Fine."); 

}
