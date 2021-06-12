tally = %{}


increment = fn amt ->
  fn (x) -> x + amt end
end

tally = Map.update(tally, :a, 1, increment.(5))
tally = Map.update(tally, :a, 1, increment.(5))


defmodule Util do
  def compose(data, outer_fun, inner_fun) do
    outer_fun.(inner_fun.(data))
  end
end


text = """
Rod Johnson, Juergen Hoeller,
Keith Donald, Colin Sampaleanu, Rob Harrop, Thomas Risberg, Alef Arendsen,
Darren Davison, Dmitriy Kopylenko, Mark Pollack, Thierry Templier, Erwin Vervaet,
Portia Tung, Ben Hale, Adrian Colyer, John Lewis, Costin Leau, Mark Fisher,
Sam Brannen, Ramnivas Laddad, Arjen Poutsma, Chris Beams, Tareq Abedrabbo, Andy Clement, Dave Syer,
Oliver Gierke, Rossen Stoyanchev, Phillip Webb, Rob Winch, Brian Clozel,
Stephane Nicoll, Sebastien Deleuze, Jay Bryant, Mark Paluch
"""


#res = Util.compose(text, &length/1, &String.split/1)
res = text |> String.split |> length
IO.inspect(res)