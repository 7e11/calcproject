
#Declaring new methods for the String class.
class String
	def isFloat
		true if Float(self) rescue false
	end
end
def fib n
	#puts n
	#these are the seeder values. IE: making the program stop
	if n == 0
		return 0 
	end
	if n == 1 
		return 1 
	end
	return fib(n - 1) + fib(n - 2) #the recursive functions are needed
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

puts "Hello There. What you you like to calculate?"
#Begin While Loop
while true
	puts "You have the option of Distance, Slope, Fibonacci, Sales Tax, and Prime"
	calculationSelection = gets.chomp

	if calculationSelection == "Distance"

		puts "You have selected Distance"
		while true
			puts "Please enter x2"
			x2 = gets.chomp
			break if x2.isFloat
		end
		while true
			puts "Please enter x1"
			x1 = gets.chomp
			break if x1.isFloat
		end
		while true
			puts "Please enter y2"
			y2 = gets.chomp
			break if y2.isFloat
		end
		while true
			puts "Please enter y1"
			y1 = gets.chomp
			break if y1.isFloat
		end

		distance = Math.sqrt((x2.to_f - x1.to_f)**2 + (y2.to_f - y1.to_f)**2)
		print "Your distance is: "
		puts distance.to_s

		puts "Keep calculating? y/n"
		keepGoing = gets.chomp

	elsif calculationSelection == "Fibonacci"

		puts "You have selected Fibonacci"
		puts "Enter the desired number"
		fibInput = gets.chomp
		fibOutput = fib(fibInput.to_f)
		puts "Result is: " + fibOutput.to_s

		puts "Keep calculating? y/n"
		keepGoing = gets.chomp

	elsif calculationSelection == "Slope"

		puts "You have selected Slope"

		while true
			puts "Please enter x1"
			x1 = gets.chomp
			break if x1.isFloat
		end
		while true
			puts "Please enter y1"
			y1 = gets.chomp
			break if y1.isFloat
		end
		while true
			puts "Please enter x2"
			x2 = gets.chomp
			break if x2.isFloat
		end
		while true
			puts "Please enter y2"
			y2 = gets.chomp
			break if y2.isFloat
		end

		slope = ((x1.to_f - x2.to_f) / (y1.to_f - y2.to_f))
		puts "Your slope is: " + slope.to_s

		puts "Keep calculating? y/n"
		keepGoing = gets.chomp

	elsif calculationSelection == "Sales Tax"

		puts "You have selected Sales Tax"
		while true
			puts "Enter the value of the Item"
			valueInput = gets.chomp
			break if valueInput.isFloat
		end
		#loop to make sure value is a float
		while true
			puts "Enter the sales tax"
			taxInput = gets.chomp
			break if taxInput.isFloat
		end
		taxOutput = taxInput.to_f * valueInput.to_f
		puts "Your Tax is: " + taxOutput.to_s
		puts "Your Total Price is: " + valueInput.to_s

		puts "Keep calculating? y/n"
		keepGoing = gets.chomp

	elsif calculationSelection == "Prime"

		puts "You have selected Prime"
		while true
			puts "Type in a float value that you want to be Prime Tested"
			primeInput = gets.chomp
			break if primeInput.isFloat
		end
		primeOutput = isPrime(primeInput.to_f)
		if primeOutput == true
			puts "That number is PRIME"
		else
			puts "That number is NOT PRIME"
		end
		puts "Keep calculating? y/n"
		keepGoing = gets.chomp
	elsif calculationSelection == "1337"
		puts "\nYou are EL1T3\n\n" #Jokes #Eastereggs #this is a hashtag #It's just convinient it comments too.
	end #ends if statement
break if keepGoing == "n"
end #ends Loop
