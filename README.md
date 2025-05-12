# MetalResCalc
This SKILL script analyzes selected metal shapes in Cadence Virtuoso, extracting their width, length, and area. It groups shapes by metal layer, then reports shape counts, dimensions, and total area per layer—ideal for layout auditing and metal utilization checks.


# How to use

Download the file into your direcoty.


in the Main terminal of Cadence run the following command.

loadi("/path/to/listMetalLayersWithDimensions.il")   ; Executes and prints each line/output to CIW

listMetalLayersWithDimensions()
