# MetalResCalc
Description:

This SKILL script inspects selected metal shapes in Cadence Virtuoso, extracting their width, length, and area. 
It organizes shapes by metal layer and reports shape counts, dimensions, and total area—making it well-suited for layout audits and checking metal utilization efficiency.

How to Use:

Download the file into your directory. 
Update the script with the correct metal resistivity values from your PDK documentation. 
In the CIW, run the following commands: 
- loadi("/path/to/listNetsFromSelection.il")
- Select the desired metal shapes as shown in figure 1
- Call listNetsFromSelection()
Results will be printed in your CIW window as shown in figure 2


![Metals_selection](https://github.com/user-attachments/assets/8cf014e4-f615-46e4-b061-f0d8deb08c49)

=======================================  Figure 1  =======================================



![Outputs_Metals](https://github.com/user-attachments/assets/6f4e4379-c42c-4ea6-a2b7-5d565141f937)

=======================================  Figure 2  =======================================
