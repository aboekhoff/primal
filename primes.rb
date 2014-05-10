# complexity is O(N)
# for the purposes of the programming challenge
# this is acceptable performance

def prime?(n)
  return true if n == 2
  return true if n == 3
  return false if n % 2 == 0
  m = Math.sqrt(n)
  i = 3
  while i < m
    return false if n % i == 0
    i += 2
  end
  return true
end

# complexity is n^2
# this is clearly not scalable but
# acceptable for this programming challenge

def first_n_primes(n)
  return [] if n == 0
  return [2] if n == 1

  r = [2]
  i = 3
  while r.length < n
    r << i if prime?(i)
    i += 2
  end

  return r
end

# helpers for working with the number grid
def get_col(t, n)
  col = []
  t.each do |row|
    col << row[n]
  end
  col
end

def get_row(t, n)
  t[n]
end

# quick string utilities
def get_char_width(col)
  r = 0
  col.each do |n|
    r = [r, n.to_s.length].max
  end
  r
end

def pad(str, n)
  str = str.to_s
  while str.length < n
    str = " " + str
  end
  str
end

# main function
# constructs the grid
# then formats each cell into a string
# then prints all to standard out
def print_table(size)
  primes = first_n_primes(size)
  grid = [[nil]]

  # add header and seed rows
  first = true
  primes.each do |n|
    grid[0] << n
    grid << [n]
  end

  # fill out rows
  first = true
  grid.each do |row|
    if first
      first = false
      next
    end

    n = row[0]
    primes.each do |m|
      row << n * m
    end
  end

  # calculate widths of each column
  widths = []
  for i in 0..primes.length
    widths << get_char_width(get_col(grid, i))
  end

  # convert each cell to a string of desired width
  grid.each do |row|
    row.each_index do |idx|
      row[idx] = pad(row[idx], widths[idx])
    end
  end

  grid.each do |row|
    puts row.join(" ")
  end

  nil

end

print_table(10)