
#Declaring new methods for the String class.
class String
	def isFloat
		true if Float(self) rescue false
	end
#  def isInt
#  	true if Int(self) rescue false

#  end
end
def fib (n)
	#puts n
	#these are the seeder values. IE: making the program stop
	if (n == 0) 
		return 0 
	end
	if (n == 1) 
		return 1 
	end
	return fib(n - 1) + fib(n - 2)
end
def isPrime inputNumber #when I is from 2 to number-1, run this program and increment I by one
	for i in 2..(inputNumber - 1) 
   if (inputNumber % i) == 0 #Checks the remainder of number against i, which will be 2 and then 3 +up
    return false #if the remainedr is 0, then it can be divided succesfully. The number - 1 is so that it is not divided by itself
end
end
 	return true # if it gets to number-1, meaning that it went from 2 all the way to the 1 below the number selected. then it is prime.
 end
=begin
http://en.wikipedia.org/wiki/Primality_test
http://en.wikipedia.org/wiki/Wilson%27s_theorem
http://www.millersville.edu/~bikenaga/number-theory/wilson-fermat/wilson-fermat.html
https://www.khanacademy.org/computing/computer-science/cryptography/modarithmetic/a/what-is-modular-arithmetic
tripple bar means: if and only if
(n -1)! tripple bar (n-1)! mod n
mod is %. It divides but only outputs the remeinder.
=end


#wikipedia putsfibonacci = Fn-2 = Fn - Fn-1
	#it also talks about something called the:
	#Binet's Fibonacci Number Formula
	#funber = (1+sqrroot(5))**n - (1-sqrroot(5))b*n) / 2**n * sqrroot(5)
=begin
the new method: isFloat
it is declared true if the string the method is called on
can be a float. If not. It the rescue returns false
=end

#Begin Building Gui
Shoes.app :title => "Evan Hruskar's Calculators",
:width => 1080,
:height => 282 do

	stack :width => "25%" do #stack that is 1/4 of the width of the screen
		background blue..gray
		tagline "Slope and Distance" #title of the calculator
		flow do
			para "Enter x2:"
			@x2 = edit_line #, align: center
		end
		flow do
			para "Enter x1:"
			@x1 = edit_line #, align: center
		end
		flow do
			para "Enter y2:"
			@y2 = edit_line #, align: center
		end
		flow do
			para "Enter y1:"
			@y1 = edit_line #shjoe, align: center
		end
		button "Calculate Distance" do
			x2 = @x2.text
			x1 = @x1.text
			y2 = @y2.text
			y1 = @y1.text

			if x2.isFloat == false
				@x2.text = "INVALID"	
			end
			if x1.isFloat == false
				@x1.text = "INVALID"
			end
			if y2.isFloat == false
				@y2.text = "INVALID"
			end
			if y1.isFloat == false
				@y1.text = "INVALID"
			end

			distance = Math.sqrt((x2.to_f - x1.to_f)**2 + (y2.to_f - y1.to_f)**2)
			@slopeDistanceOutput.text = distance.to_s
			@preSlopeDistanceOutput.text = "Distance:"
		end
		button "Calculate Slope" do
			x2 = @x2.text
			x1 = @x1.text
			y2 = @y2.text
			y1 = @y1.text

			if x2.isFloat == false
				@x2.text = "INVALID"
			end
			if x1.isFloat == false
				@x1.text = "INVALID"
			end
			if y2.isFloat == false
				@y2.text = "INVALID"
			end
			if y1.isFloat == false
				@y1.text = "INVALID"
			end

			slope = ((x1.to_f - x2.to_f) / (y1.to_f - y2.to_f))
			@slopeDistanceOutput.text = slope.to_s
			@preSlopeDistanceOutput.text = "Slope:"
		end
		flow do
			@preSlopeDistanceOutput = para "Answer:"
			@slopeDistanceOutput = tagline "0.0"
		end
	end
	#end of first stack
	stack :width => "25%" do
		background yellow..gray
		tagline "Sales Tax"
		flow do
			para "Item Value: "
			@valueInput = edit_line
		end
		flow do
			para "Tax: "
			@taxInput = edit_line
		end
		button "Calculate Sales Tax" do
			valueInput = @valueInput.text
			taxInput = @taxInput.text
			if valueInput.isFloat == false
				@valueInput.text = "INVALID"
			end
			if taxInput.isFloat == false
				@taxInput.text = "INVALID"
			end
			taxOutput = valueInput.to_f * taxInput.to_f
			totalOutput = totalOutput.to_f + valueInput.to_f  
			@taxOutput.text = "Tax: $" + taxOutput.to_s
			@totalOutput.text = "Total: $" + totalOutput.to_s
		end
		@taxOutput = tagline ""
		@totalOutput = tagline ""
	end
	stack :width => "25%" do
		background green..gray
		tagline "Fibonacci"
		flow do
			para "Fibonacci Sequence Number: "
			@fibInput = edit_line
		end
		button "Go" do
			fibInput = @fibInput.text
			if fibInput.isFloat == false
				@fibInput.text = "INVALID"
			end
			fibOutput = fib(fibInput.to_f)
			@fibOutput.text = "Number: " + fibOutput.to_s
		end
		@fibOutput = tagline "Number: "
	end # add a warning for crashing.
	stack :width => "25%" do
		background red..gray
		tagline "Prime"
		flow do
			para "Is: "
			@userInputPrime = edit_line
			para " Prime?"
		end
		button "Calculate" do
			primeInput = @userInputPrime.text
			if primeInput.isFloat == false
				@userInputPrime.text = "INVALID"
			end
			primeOutput = isPrime(primeInput.to_f)
			if primeOutput == true
				@primeOutput.text = "Yes"
			else
				@primeOutput.text = "No"
			end
		end
		@primeOutput = tagline ""
	end
end