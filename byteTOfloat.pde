void btf(byte[] b, float[] c, int[] Vettore)
{
  int  NumCampioni=0, stereomono=0, numbit=0;
  NumCampioni=Vettore[0];
  stereomono=Vettore[1];
  numbit=Vettore[2];
  if (stereomono==1 && numbit==16)
  {

    int i, b1, b2;

    // Carica su un vettore float tutti i campioni
    int j=44;
    for (i=0; i<NumCampioni; i++)
    {
      b1=(b[j]+256) % 256;
      j++;
      b2=(b[j]+256) % 256;
      j++;

      c[i]= int(b2*256+b1);
      if (c[i] > 32768) c[i]=c[i]-65536;
    }
  }
}

