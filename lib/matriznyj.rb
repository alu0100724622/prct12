#require "matriznyj/version"

require "./fraccion.rb"

# = ejemplo_rdoc.rb
#
#Autor:: Noelia Rodriguez Martin y Juan Manuel Ramos Perez
#
# == Matriz## Descripcion:
# - Definición de la clase Matriz y sus heredadas Densa y Dispersa
# - Se Establecen las relaciones de herencia anteriormente expresadas
#
# - *rdoc*

module Matriznyj


# CLASE MATRIZ (ABSTRACTA)

# Clase Matriz
class Matriz

end


# CLASE MATRIZ DENSA

#= Clase Densa
class Densa < Matriz

attr_accessor :matrix, :fil, :col						# define una variable matrix, fil, col y realiza por defecto 
														# un set y un get de dicha variable

	#== Inicializacion Densa
	def initialize(filas, columnas, *args)
		
		@fil = filas
		@col = columnas
		@numCeldas = @fil * @col
		@matrix = Array.new(@fil) {Array.new(@col)}		# variable de instancia al accessor matrix que se hizo previamente
		
		
		if args.length != 0
			to_s(*args)
		end
		
	end


	#== Paso a string Densa
	def to_s(*args)
		
		if args.length != @numCeldas
			raise ArgumentError, "Numero incorrecto de elementos"
		else
			
			numEle = 0
			i = 0
			
			while i < @fil
				
				j = 0
				
				while j < @col
					
					@matrix[i][j] = args[numEle]
					numEle += 1
					j += 1
					
				end
				i += 1
				
			end
			
			return @matrix
			
		end
	end
	
	#== Metodo suma Densa
	def +(other)
		
		if (((other.class.to_s == "Matriznyj::Densa") && (other.fil == @fil) && (other.col == @col)) || ((other.class.to_s == "Densa") && (other.fil == @fil) && (other.col == @col)))
								
			0.upto(@fil - 1) do |i| 
				j = 0									
				0.upto(@col - 1) do |j|
					
					@matrix[i][j] = @matrix[i][j] + other.matrix[i][j]
					
				end
				
			end
			
			#puts "#{@matrix}"
			return @matrix
			
		else
			
			i = 0								
			
			while i < @fil						
				
				j = 0
				
				while j < @col					
					
					k = 0
					
					while k < other.numElementos
						
						if (i == other.filM[k] && j == other.colM[k])
							
							@matrix[i][j] = @matrix[i][j] + other.eleM[k]
							
						end
						
						k += 1
					end
					
					j += 1
				end
				
				i += 1
			end
			
			#puts "#{@matrix}"
			return @matrix
		end
	end

	#== Metodo resta Densa
	def -(other)
		
		if (((other.class.to_s == "Matriznyj::Densa") && (other.fil == @fil) && (other.col == @col)) || ((other.class.to_s == "Densa") && (other.fil == @fil) && (other.col == @col)))
				
			0.upto(@fil - 1) do |i|				
				0.upto(@col - 1) do |j|					
					@matrix[i][j] = @matrix[i][j] - other.matrix[i][j]					
				end
			end
			
			#puts "#{@matrix}"
			return @matrix
			
		else
			
			i = 0								
			
			while i < @fil						
				
				j = 0
				
				while j < @col					
					
					k = 0
					
					while k < other.numElementos
						
						if (i == other.filM[k] && j == other.colM[k])
							
							@matrix[i][j] = @matrix[i][j] - other.eleM[k]
							
						end
						
						k += 1
					end
					
					j += 1
				end
				
				i += 1
			end
			
			#puts "#{@matrix}"
			return @matrix
		end
	end
	
	#== Metodo producto Densa
	def *(other)
		
		#if ((other.class.to_s == "Densa") && (@fil == @col) && (other.fil == other.col) && (@fil == other.fil))
			
			matrizMult = Array.new(@fil) {Array.new(@col)}
			
			i = 0
			(0..(@fil - 1)).collect {
													
				0.upto(@col - 1) do |j|
					
					matrizMult[i][j] = 0		
					
					k = 0					
					0.upto(@col - 1) do |k| 
						
						matrizMult[i][j] = matrizMult[i][j] + (@matrix[i][k] * other.matrix[k][j])
						
					end
					
				end
				i += 1	
			}
			
			#puts "#{matrizMult}"
			return matrizMult
			
		#else
			#raise ArgumentError, "Numero distinto de filas y columnas"
		#end
		
	end
	
	#== Metodo minimo Densa
	def minimo
		
		min = @matrix[0][0]
		
		i = 0								
		
#		while i < @fil						
		(@fil).times do
			
			j = 0
			
#			while j < @col					
			(@col).times do
				
				if(@matrix[i][j] < min)
					
					min = @matrix[i][j]
					
				end
				
				j += 1
				
			end
			
			i += 1
			
		end
		
		#puts "minimo: #{min}"
		
		return min
		
	end
	
	#== Metodo maximo Densa
	def maximo
		
		max = @matrix[0][0]
		
		i = 0								
		
#		while i < @fil						
		(@fil).times do			
			j = 0
			
#			while j < @col					
			(@col).times do				
				if(@matrix[i][j] > max)
					
					max = @matrix[i][j]
					
				end
				
				j += 1
				
			end
			
			i += 1
			
		end
		
		#puts "maximo: #{max}"
		
		return max
		
	end
	
end


# CLASE MATRIZ DISPERSA

#= Clase Dispersa 
class Dispersa < Matriz

	attr_accessor :matrix, :fil, :col, :eleM, :filM, :colM, :numElementos

	#== Inicializacion Dispersa 
	def initialize(filas, columnas, *args)
		
		@fil = filas
		@col = columnas
		@numCeldas = @fil * @col
		@numElementos = 0											# numero de elementos NO NULOS de la matriz
		
		@eleM = Array.new(0)										# matriz con los elementos no nulos de matrix
		@filM = Array.new(0)										# matriz con los numeros de fila asociado
		@colM = Array.new(0)										# matriz con los numeros de columna asociado
		
		
		
		#------------- COMPROBAR ELEMENTOS NO NULOS DE LA MATRIZ QUE SE HA PASADO -------------------
		
		if args.length == 0
			raise ArgumentError, "Numero incorrecto de elementos"
		else
			
			i = 0
			numElem = 0													# numero de elementos de la matriz
			
			while i < args.length
				
				if args[i] != 0
					
					@eleM.push(args[i])
					calcularFilCol(numElem)
					@numElementos += 1
					
				end
				
				numElem += 1
				i += 1
			end
			
		end
		
		#------------------------------------------------------------------------------------------------
		
		
		#puts "eleM: #{@eleM}"
		#puts "filM: #{@filM}"
		#puts "colM: #{@colM}"
		#puts "numEl: #{@numElementos}"
		
		
	end

	#== Metodo calular fila - columna Dispersa
	def calcularFilCol(numElem)
		
		i = 0
		num = 0
		
		while i < @fil
			
			j = 0
			
			while j < @col
				
				if (num == numElem)
					
					@filM.push(i)
					@colM.push(j)
					
				end
				
				num += 1
				j += 1
				
			end
			
			i += 1
			
		end
		
	end
	
	#== Metodo minimo Dispersa
	def minimo
		
		min = 0
		
		i = 0
		
		while i < @numElementos						
			
			if(@eleM[i] < min)
				
				min = @eleM[i]
				
			end
			
			i += 1
		end
		
		#puts "minimo: #{min}"
		
		return min
		
	end
	
	#== Metodo maximo Dispersa
	def maximo
		
		max = 0
		
		i = 0
		
		while i < @numElementos						
			
			if(@eleM[i] > max)
				
				max = @eleM[i]
				
			end
			
			i += 1
		end
		
		#puts "maximo: #{max}"
		
		return max
		
	end

	#== Paso a string Dispersa
	def to_s
		
		matrizMuestra = Array.new(@fil) {Array.new(@col) {0}}
		
		numEle = 0
		i = 0
			
		while i < @numElementos						
			
			matrizMuestra[@filM[i]][@colM[i]] = @eleM[i]
			
			i += 1
		end
		
		#puts "muestra = #{matrizMuestra}"
		return matrizMuestra
		
	end

	#== Metodo suma Dispersa
	def +(other)
		
		#if ((other.class.to_s == "Dispersa") && (other.fil == @fil) && (other.col == @col))
			
			matrizSuma = Array.new(@fil) {Array.new(@col) {0}}
			
			0.upto(@numElementos - 1) do |i|

				matrizSuma[@filM[i]][@colM[i]] = @eleM[i]

			end
			
			0.upto(other.numElementos - 1) do |i|				
				
				matrizSuma[other.filM[i]][other.colM[i]] += other.eleM[i]

			end
			
			
			#puts "suma = #{matrizSuma}"
			return matrizSuma
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end

	#== Metodo resta Dispersa
	def -(other)
		
		#if ((other.class.to_s == "Dispersa") && (other.fil == @fil) && (other.col == @col))
			
			matrizResta = Array.new(@fil) {Array.new(@col) {0}}
			
			i = 0
			
			0.upto(other.numElementos - 1) do |i|
				
				matrizResta[other.filM[i]][other.colM[i]] = 0 - other.eleM[i]
				
			end
			
			
			i = 0
			
			0.upto(@numElementos - 1) do |i|
				
				matrizResta[@filM[i]][@colM[i]] += @eleM[i] 
				
			end
				
			#puts "resta = #{matrizResta}"
			return matrizResta
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
	end

	#== Metodo producto Dispersa
	def *(other)
		
		#if ((other.class.to_s == "Dispersa") && (other.fil == @fil) && (other.col == @col))
			
			matrizProd = Array.new(@fil) {Array.new(@col) {0}}			
			
			0.upto(other.numElementos - 1) do |i|

				if (other.filM[i] = @colM[i])
					matrizProd[@filM[i]][@colM[i]] += @eleM[i] * other.eleM[i]
				end

			end			
			
			#puts "prod = #{matrizProd}"
			return matrizProd
			
		#else
			#raise ArgumentError, "Matrices de distinto tamanio"
		#end
		
	end

end



class MatrixDSL

	attr_accessor :matrix1, :matrix2, :vis

	def initialize(op1, op2)
		
		@opcion1 = op1
		@opcion2 = op2
		@matrix1 = "0"
		@matrix2 = "0"
		
	end

	def operacion(oper)
		
		@oper = oper
		
	end
	
	
	def operando(other)
		
		mat = Array.new(other)
		
		@fil = mat.length
		@col = mat[0].length
		elementos = nil
		
		0.upto(@fil - 1) do |i| 
			
			0.upto(@col - 1) do |j|
				
				if((i == @fil -1) && (j == @col -1))
					elementos = elementos.to_s << mat[i][j].to_s
				else
					elementos = elementos.to_s << mat[i][j].to_s << ","
				end
				
			end
		end
		
		if(@matrix1 == "0")
			@matrix1 = elementos
			
			@vis = other.to_s << " " << @oper.to_s << " "
			
		else
			@matrix2 = elementos
			
			@vis = @vis << other.to_s << " = "
			
		end
		
		
		ejecutar
		
	end
	

	def ejecutar
		
		if(@matrix1 != "0" && @matrix2 == "0")
			@matrix1 = @opcion1.to_s << ".new(" << @fil.to_s << "," << @col.to_s << "," << @matrix1.to_s << ")"
			#puts "matriz 1: #{@matrix1}"
		end
		
		if(@matrix1 != "0" && @matrix2 != "0")
			@matrix2 = @opcion2.to_s << ".new(" << @fil.to_s << "," << @col.to_s << "," << @matrix2.to_s << ")"
			#puts "matriz 2: #{@matrix2}"
			
			resultado = @matrix1.to_s << "." << @oper.to_s << "(" << @matrix2.to_s << ")"
			resultado = Array.new(eval(resultado))
			#puts "resultado: #{resultado}"
			
			
			@vis = @vis << resultado.to_s
			puts "----------------------------------------------------"
			puts @vis			
			
		end
		
	end


end

end		# -module Matriznyj-







