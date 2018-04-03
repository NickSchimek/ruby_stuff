module RandomNumberGenerator

  def self.run
    range, quantity, num_files = ARGV

    range = range ? range.to_i : 10000000
    quantity = quantity ? quantity.to_i : 99
    num_files = num_files ? num_files.to_i : 10

    self.create_file range, quantity, num_files
  end

  # Creates x number of files
  def self.create_file range, quantity, num_files
    for i in 1..num_files
      i = "" if i == 1
      file = "file_name#{i}.txt"
      generate range, quantity, file
    end
  end

  # Creates a random number file derangeed by spaces.
  def self.generate range, quantity, file
    file = open file, 'w'
    rand = Random.new
    for i in 1...quantity
      random_num = (rand.rand range).to_i
      file.write "#{random_num} "
    end

    # No space after last value
    random_num = (rand.rand range).to_i
    file.write "#{random_num}"
    file.close
  end

  def self.help
    help_doc = <<-HEREDOC
      Random number generator creates a space delimited file containing random integers.
      The program has three optional parameters: range, quantity, num_files.

      The first specifies the range of the number being generated ex: (0 to 100).
      The second parameter 'quantity' specifies how many random numbers will be
      generated and written to the output file.
      The third parameter 'num_files' specifies how many files will be created.


      Default values are:
          range:     10000000
          quantity:  99
          num_files: 10

      Usage example: random_number_generator 1000, 100

      This will create 10 files each containing 100 random numbers in the range
      of 0 to 1000.
    HEREDOC

    puts help_doc
  end
end

ARGV.first == 'help' ? RandomNumberGenerator.help : RandomNumberGenerator.run
