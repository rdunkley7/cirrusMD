# Summary
My program will read and parse the `input.csv` and output any valid data.
If any Invalid data is present it will be reported in the `report.txt`.
I've included rspec unit tests to check my phone and date validators.
The required data for a valid patient was: first_name, last_name, dob, member_id, effective_date.
As you will see many of the patients had an invalid effective_date rendering the patient invalid.


# Ruby Version
ruby 3.0.0

# Instructions to run: 
1. Navigate to project directory
2. Run command `irb -r ./read_input.rb`
3. In the irb console run `ReadInput.new()` to run the program and view the outputted files.

# Instructionsn to run tests:
1. Navigate to project directory
2. Run command `bundle exec rspec spec/`

# Next Steps
- Remove whitespaces
    - Write tests to check for whitespace
- Validate member_id. Some patient member_ids were invalid but since their other data (dates) were non-compliant they would be invalid regardless.
- Improve the phone validator. Just found a quick gsub that works for most valid numbers, but may not handle edge cases well.
- I would clean up the output file (whitespaces and extra quotation marks).
