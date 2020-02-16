void WriteWav(float[] finale, int NumCampioni, String nomefile)
{
  // trova massimo e minimo
  float massimo=max(finale);
  float minimo=min(finale);
  float Campione_massimo=max(abs(minimo), abs(massimo));
  //println(minimo+" , "+massimo+" , "+Campione_massimo);


  //normalizza a 32767
  for (int i=0; i<NumCampioni; i++)
  {
    finale[i]=32767*finale[i]/Campione_massimo;
  }

  ////////////////////////Headerfile/////////////////
  int aux=NumCampioni;
  int DimFile, DimFileDati, sr = 44100;
  byte stereomono = 1, numbit = 16;
  DimFileDati = aux * stereomono * (numbit / 8);
  DimFile = DimFileDati + 44;

  //Ora creo quello che sarà il file finale
  byte[] f=new byte[DimFile];

  f[0]='R';
  f[1]='I';
  f[2]='F';
  f[3]='F';
  byte f1, f2, f3, f4;
  f1=byte((DimFile-8)/16777216);
  f2=byte(((DimFile-8)- f1 * 16777216) / 65536);
  f3= byte(((DimFile-8) - f1 * 16777216 - f2 * 65536) / 256);
  f4 = byte((DimFile-8) % 256);
  f[4]=f4;
  f[5]=f3;
  f[6]=f2;
  f[7]=f1;
  f[8]='W';
  f[9]='A';
  f[10]='V';
  f[11]='E';
  f[12]='f';
  f[13]='m';
  f[14]='t';
  f[15]=' ';
  f[16]=16;
  f[17]=0;
  f[18]=0;
  f[19]=0;
  f[20]=1;
  f[21]=0;
  f[22]=stereomono;
  f[23]=0;
  f1=byte(sr/16777216);
  f2=byte((sr - f1 * 16777216) / 65536);
  f3= byte((sr - f1 * 16777216 - f2 * 65536) / 256);
  f4 = byte(sr % 256);
  f[24]=byte(68);
  f[25]=byte(172);
  f[26]=byte(0);
  f[27]=byte(0);

  int byte_per_secondo= sr * stereomono * numbit / 8;
  f1=byte(byte_per_secondo/16777216);
  f2=byte((byte_per_secondo- f1 * 16777216) / 65536);
  f3= byte((byte_per_secondo - f1 * 16777216 - f2 * 65536) / 256);
  f4 = byte(byte_per_secondo % 256);
  f[28]=f4; 
  
  f[29]=f3; 
  
  f[30]=f2; 
  
  f[31]=f1; 
  

  int byte_da_leggere_in_ogni_istante = stereomono * numbit / 8;
  f[32]=byte(byte_da_leggere_in_ogni_istante);
  f[33]=0;
  f[34]=numbit;
  f[35]=0;
  f[36]='d';
  f[37]='a';
  f[38]='t';
  f[39]='a';
  f1=byte(DimFileDati/16777216);
  f2=byte((DimFileDati- f1 * 16777216) / 65536);
  f3= byte((DimFileDati - f1 * 16777216 - f2 * 65536) / 256);
  f4 = byte(DimFileDati % 256);
  f[40]=f4;
  f[41]=f3;
  f[42]=f2;
  f[43]=f1;

  byte[] out=new byte[2*NumCampioni+44];
  int d1, d2;
  int i=0, j=0;

  // memorizza i campioni calcolati nel vettore di byte
  for (j=0; j<44; j++) {
    out[j]=f[j];
  }
  for (i=0; i<NumCampioni; i++)
  {
    finale[i]=finale[i]+65536; // Questa somma si fa per evitare gli errori causati dai numeri negativi.
    d1=byte(finale[i]/256);
    d2= byte(int(finale[i]) % 256);
    out[j]=byte(d2);
    j++;
    out[j]=byte(d1);
    j++;
  }

  saveBytes(nomefile, out);
}

