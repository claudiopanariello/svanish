void AmpiezzeFasi(int n, float[][] f, float[] A, float[] fi) 
{
  int NMezzi=n/2; 
  int i, k;
  float coseno, seno;

  for (i=0; i<n; i++)
  {
    f[i][0]=f[i][0]/( float)NMezzi;
    f[i][1]=f[i][1]/( float)NMezzi;
  }
  A[0]=f[0][0];
  fi[0]=0;


  for (k=1; k<=NMezzi; k++)
  {
    A[k] = sqrt(f[k][0] * f[k][0] + f[k][1] * f[k][1]);

    if (f[k][0]==0)
    {
      if (f[k][1]>0) fi[k]=PI;

      if (f[k][1]==0) fi[k]=0;

      else fi[k]=(TWO_PI-PI/2);
    }
    if (f[k][0]>0) {
      if (f[k][0]>=0) fi[k]=atan(f[k][1]/f[k][0]);

      else fi[k]=(TWO_PI+atan(f[k][1]/f[k][0]));
    }

    if (f[k][0]<0) {
      fi[k]=(atan(f[k][1]/f[k][0])+PI);
    }
  }
}

