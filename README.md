# MetalResCalc
This SKILL script analyzes selected metal shapes in Cadence Virtuoso, extracting their width, length, and area. It groups shapes by metal layer, then reports shape counts, dimensions, and total area per layer—ideal for layout auditing and metal utilization checks.


# How to use

Download the file into your direcoty.

in the CIW run the following commands.

 - loadi("/path/to/listNetsFromSelection.il")   ; Executes and prints each line/output to CIW
 - select the metals needed 
 - listNetsFromSelection()

They will show up in your CIW window.

![Outputs_Metals](https://github.com/user-attachments/assets/6f4e4379-c42c-4ea6-a2b7-5d565141f937)
![Metals_selection](https://github.com/user-attachments/assets/8cf014e4-f615-46e4-b061-f0d8deb08c49)
