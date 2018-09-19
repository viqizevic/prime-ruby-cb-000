require 'benchmark'

# Add  code here!
def prime?(n)
  return false if n <= 1
  return true if 2 == n
  return false if n % 2 == 0
  i = 3
  while (i ** 2) <= n
    return false if n % i == 0
    i += 1
  end
  true
end

def primy?(n)
  return false if n <= 1
  return true if 2 == n
  return false if n % 2 == 0
  not (3..(n**(0.5))).to_a.any? { |e| n % e == 0 }
end

iterations = 10_000

Benchmark.bm do |bm|
  # joining an array of strings
  bm.report do
    iterations.times do
      prime?(105557)
    end
  end

  # using string interpolation
  bm.report do
    iterations.times do
      primy?(105557)
    end
  end
end

puts prime?(105557)
