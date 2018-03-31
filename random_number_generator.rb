module RandomNumberGenerator

  def self.run
    size, num_files, limit = ARGV
    size = size ? size.to_i : 99
    num_files = num_files ? num_files.to_i : 1
    limit = limit ? limit.to_i : 10000000
    self.create_file num_files, size, limit
  end

  # Creates x number of files
  def self.create_file num_files, size, limit
    for i in 1..num_files
      i = "" if i == 1
      file = "unsorted#{i}.txt"
      generate file, size, limit
    end
  end

  # Creates a random number file delimited by spaces.
  def self.generate file, size, limit
    file = open file, 'w'
    rand = Random.new
    for i in 1...size
      random_num = (rand.rand limit).to_i
      file.write "#{random_num} "
    end

    # No space after last value
    random_num = (rand.rand limit).to_i
    file.write "#{random_num}"
    file.close
  end

  def self.help
    help_doc = <<-HEREDOC
      Random number generator has three optional parameters: size, num_files,
      and limit.

      The first parameter 'num_files' specifies how many files will be created.
      The second parameter 'size' specifies how many random numbers will be
      generated and written to the output file. The third specifies the range of
      the number being generated from 0 to limit.

      Default values are num_files = 1 & size = 99

      Usage example: random_number_generator 10, 1000

      This will create 10 files each containing 1000 random numbers.
    HEREDOC

    puts help_doc
  end
end

if ARGV.first == 'help'
  RandomNumberGenerator.help
else
  RandomNumberGenerator.run unless ARGV.first == nil
end
