void InversoAmpiezzeFasi(int n,float[][] G,float[] A, float[] fi)
{
  int NMezzi=n/2;
  int k;


  for(k=0;k<NMezzi;k++)
  {
    G[k][1]=NMezzi*A[k]*sin(fi[k]);
    G[k][0]=NMezzi*A[k]*cos(fi[k]);
  }



  k=NMezzi;
    G[k][1]=NMezzi*A[k]*sin(fi[k]);
    G[k][0]=NMezzi*A[k]*cos(fi[k]);


  for(k=1;k<NMezzi;k++)
  {
    G[NMezzi+k][1]=-G[NMezzi-k][1];
    G[NMezzi+k][0]=G[NMezzi-k][0];
  }

}
