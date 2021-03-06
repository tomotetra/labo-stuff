require "csv"

class Reader
  def initialize(input_file)
    @input_file = input_file
  end

  def read_csv
    results = []
    headers = CSV.table(@input_file).headers
    CSV.foreach(@input_file, headers: true) do |row|
      row_hash = {}
      headers.each do |key|
        row_hash[key] = row.field(key.to_s)
      end
      results.push(row_hash)
    end
    results
  end

  def read_lines
    File.readlines(@input_file)
  end

end
