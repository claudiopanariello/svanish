void Svanish(float[] A, int N, int numero_iterazioni, int ni) 

{
  int i, indice, pick;
  float temp, step;
  
  step = pow(A.length, (float)1/numero_iterazioni);

  indice = round( A.length - pow(step, ni));   //ricomposizione esponenziale

  //ni = numero_iterazioni-ni;                  //per avere una scomposizione esponenziale
  //indice = round(A.length - pow(step, ni));   //decommentare queste due righe
  
  //indice = round((A.length)*(float)ni/numero_iterazioni);   //ricomposizione lineare
  
 // print(indice + ", "); 

  //Creo un array T[] di lunghezza A.length con interi progressivi
  float[] T = new float[A.length];
  for(i=0; i<T.length; i++)
  T[i] = i;
  
  //Mescolo gli interi all'interno del vettore T[]
  for(i=0; i<T.length; i++)
        { temp = T[i]; 
          pick  = (int)random(T.length); 
          T[i] = T[pick]; 
          T[pick]= temp; 
        }

  //Utilizzo i valori di T[] come indici per A[]: in questo modo evito che randomizzando escano fuori gli stessi indici già processati
  i = 0;
    for(int j = 0 ; j < indice; j++)
    {
          A[(int)T[i]] = 0;
          i++;
    }
}