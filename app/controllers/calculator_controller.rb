class CalculatorController < ApplicationController

  def index
  end

  def calculate
    input_from_form=params[:calculator][:input]
    @output= calc(input_from_form)
    render :index
  end

  #https://alfasin.com/2013/11/18/a-simple-calculator-in-ruby/
  def is_number? expr
    return false if expr.nil?
    expr = "#{expr}"              # we need this condition in case the expr is a number
    expr.match /^(\d+|\d+\.\d+)$/ # since match() is defined only for strings
  end

  def calc(expr)
    return expr.to_f if is_number? expr
    expr.gsub(" ","") # clean the string from whitespaces
    arr = expr.split /\+/
    return arr.inject(0){|x,y| calc(x) + calc(y) } if arr.size > 1
    arr = expr.split /\-/
    return arr.inject(0){|x,y| calc(x) - calc(y) } if arr.size > 1
    arr = expr.split /\*/
    return arr.inject(1){|x,y| calc(x) * calc(y) } if arr.size > 1
    arr = expr.split /\//
    return arr.inject   {|x,y| (calc(x) / calc(y)).to_f.round(2) } if arr.size > 1
  end

end
