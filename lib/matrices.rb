
e = MatrixDSL.new("Densa","Dispersa")
e.operacion "+"  

e.operando [[1,2],[3,4]]  
e.operando [[0,0],[1,0]]


e = MatrixDSL.new("Densa","Densa")
e.operacion "-"  

e.operando [[1,2],[3,4]]  
e.operando [[5,8],[1,1]]


e = MatrixDSL.new("Densa","Densa")
e.operacion "*"  

e.operando [[1,2],[3,4]]  
e.operando [[2,2],[3,3]]


e = MatrixDSL.new("Dispersa","Dispersa")
e.operacion "+"  

e.operando [[0,-1],[0,0]]  
e.operando [[0,0],[1,0]]
