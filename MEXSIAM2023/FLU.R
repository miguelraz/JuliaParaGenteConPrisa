Dbehind=function(A){
  X=rep(0,nrow(A))
  n=nrow(A)
  X[n]=A[n,n+1]/A[n,n]
  K=sort(seq(1,n-1),decreasing = T)
  for(k in K){
    Aux=rep(0,n)
    for(j in (k+1):n){
      Aux[n-(j-1)]=A[k,j]*X[j]
    }
    X[k]=A[k,n+1]/A[k,k]-sum(Aux)/A[k,k]
  }
  return(X)
  
}

Dnow=function(A){
  n=nrow(A)
  S=rep(0,n)
  Aux=S
  S[1]=A[1,n+1]
  
  for(i in 2:n){
    for(j in 1:(i-1)){
      Aux[j]=A[i,j]*S[j]
    }
    S[i]=A[i,n+1]-sum(Aux)
  }
  return(S)
}


FLU=function(A,Solution){
  Asdim=nrow(A)
  U=A[1:Asdim,1:Asdim]
  L=matrix(0,Asdim,Asdim)
  if(det(U)!=0){
    for(pivote in 1:(Asdim-1)){
      for(i in (pivote+1):Asdim){
        L[pivote,i]=U[i,pivote]/U[pivote,pivote]
        U[i,]=-(U[i,pivote]/U[pivote,pivote])*U[pivote,]+U[i,]
      }
    }
    
    L=diag(Asdim)+t(L)    
    
    if(Solution==1){
      b=A[,Asdim+1]
      
      Lb=cbind(L,b)
      
      Y=Dnow(Lb)
      
      Uy=cbind(U,Y)
      
      Solution=Dbehind(Uy)
      
      return(list("L"=L,"U"=U,"X"=Solution))    
    }else{
      return(list("L"=L,"U"=U))
    }
  }else{print("Esta parte se verá más adelante")}
}

#Caso Ejemplo 

a1=c(-1,3,2)
a2=c(3,-4,1)
a3=c(2,5,-2)

A=rbind(a1,a2,a3)
A
start = Sys.time()
FLU(A,0)
print(Sys.time() - start)

L=as.matrix(FLU(A,0)[[1]])
U=as.matrix(FLU(A,0)[[2]])


