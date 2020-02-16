void BitReversal(float[][] f,int n,int m)
{
  int x,y,i;
  float t;
  for(x=1;x<n-1;x++)
  {
    y=0;
    for(i=0;i<m;i++) y=(((x>>i) & 01) | (y<<1));
    if(x < y)
    {
    t=f[x][0];
    f[x][0]=f[y][0];
    f[y][0]=t;
    
    t=f[x][1];
    f[x][1]=f[y][1];
    f[y][1]=t;
    }
  }
}
