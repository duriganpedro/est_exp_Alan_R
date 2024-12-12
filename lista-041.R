#lista 4.1
frase<-"A vida é bela"
n<-10
#para comparar ao n, preciso de uma variavel
#auxiliar de contagem(i,j,k,l,m)
i <- 1
#while é uma estrutura de repetição
while(i<=n){
    i<-i+1
    print(frase)
    i<-i+1
}

for(j in 1:n){
  print (frase)
}

k<-1
  repeat{
    print(frase)
    k <-k+1
    if(k>n) break
  }

for(l in 1:n){
print(paste(frase,"-",i))
}

#Exercicio 2 imprima na tela de 1 a 20

1:20
20:1
seq(0,20,2)
seq(20,0,-2)


for(i in 1:7){
  if(i%%2==0){
    print(-i)
  }else{
    print(i)
  }
}


seq(0,25,2)
10:-10

S<-0
for(i in 1:10){
  if(i%%2==1){
    s = s - i/i^2
  }
}
s

#exercicio 6 - dada a idaade de n pessoas , classificar a media entre
# n<-s/0 e 25,26 e 60, respectivamente, jovem, adulto e idoso
idade<-c(22,28,44,35,30)
#tirar a media

#classificar
med<-mean(idade)
if med<=25{
  print("jovem")
  else if(med<=60){
    print ("adulto")
  }else{
    print("idoso")
    }



  #construção de função#####MULTIPLICADOR
  #1-entrar com 2 numeros
  #2-multiplicar
  #3-mostrar

  multiplicador<-function(x,y){
    r=x*y
    return(r)
  }

  multiplicador(4,5)


  CL<-function(x){
    y=3-4*x
    return (y)
  }
CL(2)


#1construir a funçao normal
minha_normal<-function(x,mu,sigmma){
  y=1/(sqrt(2*pi*sigmma^2))*exp(-1/2*((x-mu)/sigmma)^2)
  return(y)
}

minha_normal(1,0,1)

#construir o eixo x
delta<-0.001
x<-seq(-1,1,delta)

#3construir o eixo y(densidade)
y<-minha_normal(x,0,1)
plot(x,y)

#4calcular as áreas(metodo trapezio (B+b*n)/2)
area<-0
for(i in 1:(length(y)-1)){
area[i]<-(y[i]+y[i+1])*delta/2
}
plot(area)
#5integrar as areas(integral  )
sum(area)


