
require "matriznyj"
require "test/unit"
require "rspec"
include Matriznyj


class Test_Matriz_Densa < Test::Unit::TestCase

	def test_mostrar
	
		assert([[1, 2],[3, 4]] == Densa.new(2,2).to_s(1,2,3,4))				# |
		assert_equal(0, [[1, 2],[3, 4]] <=> Densa.new(2,2).to_s(1,2,3,4))	# 3 formas distintas de hacer lo mismo
		assert_equal([[1, 2],[3, 4]], Densa.new(2,2).to_s(1,2,3,4))			# |
		
		assert_equal([[1, 2, 3], [4, 5, 6], [7, 8, 9]], Densa.new(3,3).to_s(1,2,3,4,5,6,7,8,9))
		
	end
	
	def test_suma
		assert_equal([[1, 3],[3, 6]], Densa.new(2,2,1,2,3,4).+(Dispersa.new(2,2,0,1,0,2)))
		assert_equal([[2, 3],[4, 5]], Densa.new(2,2,1,2,3,4).+(Densa.new(2,2,1,1,1,1)))

	end
	
	
	def test_resta
		assert_equal([[1, 2],[3, 8]], Densa.new(2,2,1,2,3,4).-(Dispersa.new(2,2,0,0,0,-4)))
		assert_equal([[0, 0, 0],[0, 0, 0], [0, 0, 0]], Densa.new(3,3,1,2,3,4,5,6,7,8,9).-(Densa.new(3,3,1,2,3,4,5,6,7,8,9)))
		
		assert_equal([[0, 1],[2, 3]], Densa.new(2,2,1,2,3,4).-(Densa.new(2,2,1,1,1,1)))
		assert_equal([[0, 1, 2],[3, 4, 5], [6, 7, 8]], Densa.new(3,3,1,2,3,4,5,6,7,8,9).-(Densa.new(3,3,1,1,1,1,1,1,1,1,1)))
	end
	
	
	def test_multiplicacion
		assert_equal([[7, 10],[15, 22]], Densa.new(2,2,1,2,3,4).*(Densa.new(2,2,1,2,3,4)))
		assert_equal([[30, 36, 42],[66, 81, 96], [102, 126, 150]], Densa.new(3,3,1,2,3,4,5,6,7,8,9).*(Densa.new(3,3,1,2,3,4,5,6,7,8,9)))
		
		assert_equal([[6, 6],[14, 14]], Densa.new(2,2,1,2,3,4).*(Densa.new(2,2,2,2,2,2)))
		assert_equal([[4, 2, 4],[10, 5, 10], [16, 8, 16]], Densa.new(3,3,1,2,3,4,5,6,7,8,9).*(Densa.new(3,3,1,0,1,0,1,0,1,0,1)))
	end

	def minimo
		
		assert_equal(1, Densa.new(2,2,3,7,1,8).minimo)
		
	end

	def maximo
		
		assert_equal(10, Densa.new(2,2,10,4,2,7).maximo)
		
	end
	
end



class Test_Matriz_Dispersa < Test::Unit::TestCase

	def test_suma
		assert_equal([[2, 2],[0, 0]], Dispersa.new(2,2,1,0,0,0).+(Dispersa.new(2,2,1,2,0,0)))
		assert_equal([[1, 2, 3],[0, 5, 0], [0, 16, 9]], Dispersa.new(3,3,0,2,0,0,5,0,0,8,0).+(Dispersa.new(3,3,1,0,3,0,0,0,0,8,9)))
	end
	
	
	def test_resta
		assert_equal([[-1, 0],[-5, 4]], Dispersa.new(2,2,0,0,0,4).-(Dispersa.new(2,2,1,0,5,0)))
		assert_equal([[1, -2, 3],[-4, 0, 6], [-7, 8, -9]], Dispersa.new(3,3,1,0,3,0,0,6,0,8,0).-(Dispersa.new(3,3,0,2,0,4,0,0,7,0,9)))
	end
	
	def minimo
		
		assert_equal(0, Dispersa.new(2,2,0,0,0,4).minimo)
		
	end

	def maximo
		
		assert_equal(4, Dispersa.new(2,2,0,0,0,4).maximo)
		
	end
	
end
