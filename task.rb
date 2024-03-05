def calculate_check_digit(code)
    code = code.gsub(/[-\s]/, '')
    raise ArgumentError, 'Invalid code length' unless code.length == 12
    digits = code.chars.map(&:to_i)
    sum = digits.each_with_index.map { |d, i| i.even? ? d : d * 3 }.sum
    mod = sum % 10
    check_digit = (10 - mod).to_s
    check_digit = '0' if check_digit == '10'
    return check_digit
  end
  
  example_code = '978014300723'
  check_digit = calculate_check_digit(example_code)
  complete_code = "#{example_code}#{check_digit}"
  puts "Complete Code: #{complete_code}"
  