⍝  Just run all this code in the main console - copy paste 

 (g_hhatarr g_w g_b g_lr g_nin g_numlayers g_mnistmat)←gencreateinput
 ⍝ add y values here - always add y values before use
 y←g_isz⍴1
 y[(g_isz÷2)?g_isz]←0
 firstimg←g_mnistmat[1;;],y
 layernum←2
 count←0 ⍝ counter for CD-10
 li←(0)(layernum)(10)
 updates←numeraicd li

 ⍝ For each row, add a 0 first, then a 1
 ⍝ Compare free energies, the output class is the one that gives
 ⍝ the least free energy

 firstimg[;g_isz+1]←0 ⍝ batch - all rows in y column to 0
 xj←((1,g_isz+1)⍴g_b[2;])+(g_hhatarr[1;]+.×⍉g_w[1;;]) ⍝ 2 → hidden layer number
 f0←+/,(-1×g_hhatarr[1;]+.×⍉(1,g_isz+1)⍴g_b[1;],0)-(10⍟(1+*xj))

 firstimg[;g_isz+1]←1 ⍝ batch - all rows in y column to 1
 xj←((1,g_isz+1)⍴g_b[2;])+(g_hhatarr[1;]+.×⍉g_w[1;;])
 f1←+/,(-1×g_hhatarr[1;]+.×⍉(1,g_isz+1)⍴g_b[1;],0)-(10⍟(1+*xj))  ⍝ bias initialized and added for yc


 :If f0<f1
     z←0
 :Else
     z←1
 :EndIf
