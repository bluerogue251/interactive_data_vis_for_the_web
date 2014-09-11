Vis = {}
Vis.returnD = (d) ->
  "I can count up to #{d}"

Vis.redIfPastThreshold = (d, threshold) ->
  if d > threshold
    "red"
  else
    "black"

Vis.dAsPixels = (d) ->
  d * 5 + "px"

Vis.addRand = (dataset) ->
  newNumber = Math.random() * 30
  dataset.push(Math.floor(newNumber))

Vis.horizontalSpace = (i) ->
  i * 50 + 25

$ ->
  # dataset = [5, 10, 15, 20, 25]
  # dataset = [ 25, 7, 5, 26, 11, 8, 25, 14, 23, 19,
  #             14, 11, 22, 29, 11, 13, 12, 17, 18, 10,
  #             24, 18, 25, 9, 3 ]
  w = 500
  h = 120
  barPadding = 1
  dataset = []
  Vis.addRand(dataset) for d in [0..19]

  svg = d3.select("#main")
          .append("svg")
          .attr("width", w)
          .attr("height", h)

  rects = svg.selectAll("rect")
             .data(dataset)
             .enter()
             .append("rect")

  rects.attr("x", (d, i) -> i * (w / dataset.length))
       # .attr("y", (d) -> h - d * 4)
       # .attr("width", (d) -> (w / dataset.length) - barPadding)
       # .attr("height", (d) -> d * 4)
       # .attr("fill", (d) -> "rgb(0, 0, #{d * 10}")
       .attr
         "y":      (d) -> h - d * 4
         "width":  (d) -> (w / dataset.length) - barPadding
         "height": (d) -> d * 4
         "fill":   (d) -> "rgb(0, 0, #{d * 10}"

  svg.selectAll("text")
     .data(dataset)
     .enter()
     .append("text")
     .text( (d) -> d )
     .attr
       "x":           (d, i) -> i * (w / dataset.length) + (w / dataset.length - barPadding)/ 2
       "y":           (d)    -> h - (d * 4) + 14
       "font-family": "sans-serif"
       "font-size": "11px"
       "fill": "white"
       "text-anchor": "middle"

  # circles = svg.selectAll("circle")
  #              .data(dataset)
  #              .enter()
  #              .append("circle")

  # circles.attr("cx", (d, i) -> Vis.horizontalSpace(i))
  #        .attr("cy", h/2)
  #        .attr("r", (d) -> d)
  #        .attr("fill", "yellow")
  #        .attr("stroke", "orange")
  #        .attr("stroke-width", (d) -> d/5)

  # d3.select("#main")
  #   .selectAll("div")
  #   .data(dataset)
  #   .enter()
  #   .append("div")
  #   .classed("bar", true)
  #   .style( "height", (d) -> Vis.dAsPixels(d) )
    # .text( (d) -> Vis.returnD(d) )
    # .style("color", (d) -> Vis.redIfPastThreshold(d, 15))
