Vis = {}
Vis.returnD = (d) ->
  "I can count up to #{d}"

Vis.redIfPastThreshold = (d, threshold) ->
  if d > threshold
    "red"
  else
    "black"

$ ->
  dataset = [5, 10, 15, 20, 25]

  d3.select("body")
    .selectAll("p")
    .data(dataset)
    .enter()
    .append("p")
    .text( (d) -> Vis.returnD(d) )
    .style("color", (d) -> Vis.redIfPastThreshold(d, 15))
