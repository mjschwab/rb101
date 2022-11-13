def prompt(message)
  puts("#{message}")
end

def valid_number?(num)
  num.to_i != 0
end


    
prompt("Welcome to this loan calculator.")
prompt("Will this calculation be for a mortgage or a car loan?")
loan_type = ""

loop do
  loan_type = gets.chomp
  if loan_type.empty?
    prompt("Make sure to enter a valid type of loan.")
  else
    break
  end
end

prompt("Excellent. Let's get some information about your #{loan_type}.")

loop do
  loan_amount = ""
loop do
  prompt("What is the loan amount?")
  loan_amount = gets.chomp.gsub(/[^\d\.]/, '').to_f   
  if valid_number?(loan_amount)
    break
  else
    prompt("That doesn't look like a valid loan amount. Could you please enter the figure again?")
  end
end

annual_rate = ""
loop do
  prompt("What is the Annual Percentage Rate (APR)?")
  annual_rate = gets.chomp.to_f
  if valid_number?(annual_rate)
    break
  else
    prompt("That doesn't look like a valid APR. Could you please enter the figure again?")
  end
end

loan_years = ""
loop do
  prompt("How many years is the loan for?")
  loan_years = gets.chomp.to_i
  if valid_number?(loan_years)
    break
  else
    prompt("That doesn't look like a valid number of years. Could you please enter the figure again?")
  end
end

monthly_rate = (annual_rate / 12) / 100
loan_months = loan_years * 12

monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-loan_months)))

prompt("Your monthly payment will be $#{monthly_payment.to_i}! Enjoy your loan!") #decimal points

prompt("Do you have any other loans you'd like to calculate the terms for? (Y to calculate again)")
answer = gets.chomp
break unless answer.downcase.start_with?('y')
end

prompt("Thanks for using us to calculate your loan terms!")
