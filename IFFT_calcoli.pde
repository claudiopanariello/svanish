void IFFT(int m, float[][] f)
{
  float  w, nesp;
  float[] e= new float[2];
  float[] t= new float[2];
  int n;
  int k, s, r, r1, d, l, i, z, z1, q;

  n=2<<(m-1);  // 2 alla m
  nesp=0.5;
  for (k=1; k<=m; k++)
  {
    d=n/(2<<(k-1));  //    d = n / (2 ^ k)
    nesp=nesp*2;
    s=0;
    for (i=1; i<=nesp; i++)
    {
      r=s;
      z1=r>>(m-k);  // z1 = r \ 2 ^ (m - k)
      z=0;
      for (q=0; q<k; q++) z=(((z1>>q) & 01) | (z<<1));      // z = z * 2 + (z1 \ (2 ^ q)) Mod 2
      w=TWO_PI*(float)z/(2<<(k-1));
      e[0]=cos(w);
      e[1]=sin(w); //qui differisce dalla FFT. Nella FFT c'è:  e(1) = -Sin(w)

      for (l=0; l<d; l++) //calcolo delle coppie di duali che utilizzano e(z/(2^k))
      {
        r=l+s;
        r1=r+d;  //indice II elemento coppia
        t[0]=e[0]*f[r1][0]-e[1]*f[r1][1]; //calcolo coppia nodi duali
        t[1]=e[0]*f[r1][1]+e[1]*f[r1][0];
        f[r1][0]=f[r][0]-t[0];
        f[r1][1]=f[r][1]-t[1];
        f[r][0]=f[r][0]+t[0];
        f[r][1]=f[r][1]+t[1];
      }
      s=s+2*d; //indice I elemento di ck non ancora calcolato
    } // fine del ciclo i
  }
  // FINE DEL CICLO k

  // Dividi tutto per n
  for (i=0; i<n; i++)
  {
    f[i][0]=f[i][0]/(float)n;
    f[i][1]=f[i][1]/(float)n;
  }

  BitReversal(f, n, m);
}

