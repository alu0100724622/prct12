require "./mcd.rb"

class Fraccion

        include Comparable
        
        attr_accessor :num, :den                # define un metodo set y get para las variables num y den
        
        def initialize(num, den)                # constructor
                @num = num
                @den = den
                
                maxcomdiv = mcd(@num,@den)
                
                @num = @num/maxcomdiv
                @den = @den/maxcomdiv
                
        end
        
        #================================== NUMERADOR ============================================
        
        def numerador()
                return @num
        end
        
        #================================== DENOMINADOR ==========================================
        
        def denominador()
                return @den
        end
        
        #================================== RACIONAL =============================================
        
        def to_s()
                "#{@num}/#{@den}"
                #puts "El numerador #{num} y denominador #{den} en forma a/b es: #{@num}/#{@den}"
        end
        
        #================================= FLOTANTE ==============================================
        
        def to_f()
                @num.to_f/@den.to_f
        end
        #============================== SOBRECARGA DEL METODO (==) ===============================

        def == (other)
                
                if ((@num == other.num) && (@den == other.den))
                        return true
                end 
                        return false 
        end 
 
        
        #================================ VALOR ABSOLUTO =========================================
        
        def abs()
                
                #"#{@num.abs}/#{@den.abs}"
                #puts "El valor absoluto es: #{num_abs}/#{den_abs}"
                
                return Fraccion.new(@num.abs, @den.abs)
        end
        
        #================================ RECIPROCO ==============================================
        
        def reciproco()
        #puts "El reciproco es : #{@den}/#{@num}"
        
        return Fraccion.new(den,num)

        end
        
        #================================= OPUESTO ===============================================
        
        def -@()
                
                return Fraccion.new(-@num,den)

        end
        
        #================================== SUMA =================================================
        
        #Metodo que suma dos fracciones con + y da el resultado de forma reducida
        
        def +(other)

		if (other.is_a? Integer)
			other = Fraccion.new(other,1)
		end
                return Fraccion.new((other.den * @num) + (@den * other.num), @den * other.den)
        end
        
        #================================== RESTA ================================================
        
        #Metodo que resta dos fracciones con - y da el resultado de forma reducida
        
        def -(other)
                return Fraccion.new((other.den * @num) - (@den * other.num), @den * other.den)
        end
        
        #============================= MULTIPLICACION =============================================
        
        #Metodo que multiplica dos fracciones con * y da el resultado de forma reducida
        
        def *(other)

		if (other.is_a? Integer)
			other = Fraccion.new(other,1)
		end
                return Fraccion.new(@num * other.num, @den * other.den)
        end
        
        #============================ DIVISION ====================================================
        
        #Metodo que divide dos fracciones con / y da el resultado de forma reducida
        
        def /(other)
                return Fraccion.new(@num * other.den, @den * other.num)
        end
        
        #============================== RESTO EN FORMA REDUCIDA ===================================
        
        #Método que calcula el resto de dos fracciones con el % y da el resulado de forma reducida
        
        def %(other)
        
                "#{@num % @den},#{other.num % other.den}"
        
        end

        #======================= METODO OPERADOR DE LAS GALAXIAS (mayor, mayor igual, menor, menor igual) ========================
        
        def <=>(other)

        return nil unless other.instance_of? Fraccion
          (num.to_f / den) <=> (other.num.to_f / other.den)

        end 

        #======================= METODO COERCE ========================
        
	def coerce(other)
		return self, Fraccion.new(other,1)
	end
        
end
