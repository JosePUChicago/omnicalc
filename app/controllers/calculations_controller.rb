class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================
text=@text.length
text_no_space=@text.gsub(" ", "").length

words=@text.split(/[\s,]+/).count

paragraph=@special_word.downcase
lowercase=@text.downcase
downwords=lowercase.split
occurrence=downwords.count(paragraph)

    @character_count_with_spaces = text

    @character_count_without_spaces = text_no_space

    @word_count = words

    @occurrences = occurrence
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
rate=@apr/100/12
months=@years*12
loaned=@principal

    @monthly_payment = loaned*(rate/(1-(1+rate)**(months*-1)))

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================
secondstime=@ending-@starting
minutestime=secondstime/60
hourstime=minutestime/60
daystime=hourstime/24
weekstime=daystime/7
yearstime=daystime/365.25
    @seconds = secondstime
    @minutes = minutestime
    @hours = hourstime
    @days = daystime
    @weeks = weekstime
    @years = yearstime
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================
array=@numbers
sorted=@numbers.sort
counted=@numbers.count
mini=@numbers.min
maxa=array.max
ranged=maxa-mini
summed=(@numbers).reduce(:+)
meaned=summed/counted
varianced=array.inject(0.0) {|s,x| s + (x - meaned)**2}
len = sorted.length
medianed=(sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0


    @sorted_numbers = sorted
    @count = counted
    @minimum = mini
    @maximum = maxa

    @range = ranged

    @median = medianed

    @sum = summed

    @mean = meaned

    @variance = varianced

    @standard_deviation = "Replace this string with your answer."

    @mode = "Replace this string with your answer."

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
