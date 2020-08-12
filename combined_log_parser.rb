class CombinedLogParser

  GREP_STRING                       = "done: "
  GREPPED_OUTPUT_REGULAR_EXPRESSION = /([0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]*Z) [a-zA-Z0-9\s\S]+ ([a-zA-Z::]+::[a-zA-Z]+) JID-([a-zA-Z0-9]+)[a-zA-Z0-9\s\S]+ ([0-9]*.[0-9]+) sec/
  DELIMITER                         = "\t"
  NUMBER_OF_FORMULA_ROWS            = 23
  JOB_NAME_COLUMN                   = "B"
  JOB_DURATION_COLUMN               = "D"
  UNIQUE_JOB_COLUMN                 = "E"
  ROW_BELOW_HEADER                  = 2
  MIN_GOOGLE_SHEET_FUNCTION         = "MINIFS"
  MAX_GOOGLE_SHEET_FUNCTION         = "MAXIFS"
  AVG_GOOGLE_SHEET_FUNCTION         = "AVERAGEIFS"
  COUNT_GOOGLE_SHEET_FUNCTION       = "COUNTIFS"
  UNIQUE_GOOGLE_SHEET_FUNCTION      = "UNIQUE"

  def initialize( arguments )
    @arguments = arguments

    @arguments ? process_combined_log_file : output_spreadsheet_formula
  end

  private

  def process_combined_log_file

    # Grep the file
    grep_output = `grep -i #{GREP_STRING} #{@arguments}`

    # Split the grepped output into an array of lines
    grep_output = grep_output.split("\n")

    puts column_header_labels.map{ | label | label << DELIMITER }.join
    grep_output.each do | grep_line |
      match_data = GREPPED_OUTPUT_REGULAR_EXPRESSION.match( grep_line )
      puts "#{match_data[1]}#{DELIMITER}#{match_data[2]}#{DELIMITER}#{match_data[3]}#{DELIMITER}#{match_data[4]}"
    end

  end

  def column_header_labels
    [
      "DateTime",
      "Job Name",
      "Job ID",
      "Duration",
      "Unique Job",
      "Min (s)",
      "Max (s)",
      "Average (s)",
      "Job Count"
    ]
  end

  def statistical_formula_string_for_row( stat_function, this_row )
    formula_row = "=#{stat_function}(" +
                    "#{JOB_DURATION_COLUMN}#{ROW_BELOW_HEADER}:#{JOB_DURATION_COLUMN}," +
                    "#{JOB_NAME_COLUMN}#{ROW_BELOW_HEADER}:#{JOB_NAME_COLUMN}," +
                    "#{UNIQUE_JOB_COLUMN}#{this_row}" +
                  ")"
  end

  def count_formula_string_for_row( this_row )
    formula_row = "=#{COUNT_GOOGLE_SHEET_FUNCTION}(" +
                    "#{JOB_NAME_COLUMN}#{ROW_BELOW_HEADER}:#{JOB_NAME_COLUMN}," +
                    "#{UNIQUE_JOB_COLUMN}#{this_row}" +
                  ")"
  end

  def unique_formula_string_for_row
    formula_row = "=#{UNIQUE_GOOGLE_SHEET_FUNCTION}(" +
                    "#{JOB_NAME_COLUMN}#{ROW_BELOW_HEADER}:#{JOB_NAME_COLUMN}" +
                  ")"
  end

  def output_spreadsheet_formula

    (0 ... NUMBER_OF_FORMULA_ROWS ).each do | iteration |

      adjusted_row_number = iteration + ROW_BELOW_HEADER
      formula_row         = ""

      formula_row << DELIMITER
      formula_row << statistical_formula_string_for_row( MIN_GOOGLE_SHEET_FUNCTION, adjusted_row_number )
      formula_row << DELIMITER
      formula_row << statistical_formula_string_for_row( MAX_GOOGLE_SHEET_FUNCTION, adjusted_row_number )
      formula_row << DELIMITER
      formula_row << statistical_formula_string_for_row( AVG_GOOGLE_SHEET_FUNCTION, adjusted_row_number )
      formula_row << DELIMITER
      formula_row << count_formula_string_for_row( adjusted_row_number )

      formula_row.prepend( unique_formula_string_for_row ) if iteration == 0

      puts formula_row

    end
  end
end

CombinedLogParser.new( ARGV[0] )