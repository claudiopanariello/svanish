int[] ReadWav(byte[] b)
{
  int NumCampioni=0, stereomono=0, numbit=0;
  int[] Vettore= new int[3];
  stereomono=b[22];
  int b1, b2, b3, b4;

  b1=(b[24]+ 256) % 256;
  b2=(b[25]+ 256) % 256;
  b3=(b[26]+ 256) % 256;
  b4=(b[27]+ 256) % 256;
  int samplingrate = b4*16777216+b3*65536+b2*256+b1;

  b1=(b[34] + 256) % 256;
  b2=(b[35] + 256) % 256;
  numbit=b2*256+b1;

  b1=(b[40]+ 256) % 256;
  b2=(b[41]+ 256) % 256;
  b3=(b[42]+ 256) % 256;
  b4=(b[43]+ 256) % 256;
  int Dim_file_dati=b4*16777216+b3*65536+b2*256+b1;

  NumCampioni=Dim_file_dati/(stereomono*(numbit/8));
  Vettore[0]=NumCampioni;
  Vettore[1]=stereomono;
  Vettore[2]=numbit;
  
  //println(NumCampioni);
  return Vettore;
}

