void FFT(int m, float[][] f)
{
  int k, s, r, r1, d, l, i, z, z1, q;
  float  w, nesp;
  float[] e= new float[2];
  float[] t= new float[2];
  int n;
  float somma=0;


  n=2<<(m-1);  // 2 alla m


  nesp=0.5;
  for (k=1; k<=m; k++)
  {
    d=n/(2<<(k-1));
    nesp=nesp*2;
    s=0;
    for (i=1; i<=nesp; i++)
    {
      r=s;
      z1=r>>(m-k);

      z=0;
      for (q=0; q<k; q++) z=(((z1>>q) & 01) | (z<<1));

      w=TWO_PI*(float)z/( float)(2<<(k-1));
      e[0]=cos(w);
      e[1]=-sin(w);

      for (l=0; l<=d-1; l++)
      {
        r=l+s;
        r1=r+d;

        t[0]=e[0]*f[r1][0]-e[1]*f[r1][1];
        t[1]=e[0]*f[r1][1]+e[1]*f[r1][0];
        f[r1][0]=f[r][0]-t[0];
        f[r1][1]=f[r][1]-t[1];
        f[r][0]=f[r][0]+t[0];
        f[r][1]=f[r][1]+t[1];
      }
      s=s+2*d;
    }
  }

  BitReversal(f, n, m);

  for (i=0; i<n; i++)
  {
    somma=somma+(f[i][0]*f[i][0])/( float)(n)+f[i][1]*f[i][1]/( float)(n);
  }
  somma=sqrt(somma);
}

