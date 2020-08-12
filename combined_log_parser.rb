class CombinedLogParser

  GREP_STRING                       = "done: "
  GREPPED_OUTPUT_REGULAR_EXPRESSION = /([0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}.[0-9]*Z) [a-zA-Z0-9\s\S]+ ([a-zA-Z::]+::[a-zA-Z]+) JID-([a-zA-Z0-9]+)[a-zA-Z0-9\s\S]+ ([0-9]*.[0-9]+) sec/
  CSV_COLUMN_HEADER_LABELS          = "DateTime,Job Name,Job ID,Job Duration,blank,Unique Job,Min (s),Max (s),Average (s),Job Count"

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

    puts CSV_COLUMN_HEADER_LABELS
    grep_output.each do | grep_line |
      match_data = GREPPED_OUTPUT_REGULAR_EXPRESSION.match( grep_line )
      puts "#{match_data[1]},#{match_data[2]},#{match_data[3]},#{match_data[4]}"
    end

  end

  def output_spreadsheet_formula
    puts "OSF"
  end
end

CombinedLogParser.new( ARGV[0] )