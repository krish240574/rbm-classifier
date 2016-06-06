 z←numermain;b;w;layernum;updates;count;li;input;numlayers;isz;xt;xj;f0;f1;firstimg

 (g_isz g_hhatarr g_w g_b g_lr g_nin g_numlayers g_mnistmat g_u g_d)←gencreateinput


 ⍝ add y values here - always add y values before use

⍝ ⍝ we're doing online learning, send one row at a time
⍝ count←1
⍝ layernum←2
⍝ li←(0)(layernum)(10)
⍝ :While count≤g_isz
⍝     updates←numeraicd li
⍝     count←count+1
⍝ :EndWhile
⍝

⍝ firstimg←g_mnistmat[1;;],y
⍝
⍝ count←0 ⍝ counter for CD-10
⍝

 p_y_given_x_1←(*g_d[1;1])×(×/(1+*(g_b[2;]+g_u[1;]+g_hhatarr[1;(⍳g_isz)]+.×g_w[1;;])))
 p_y_given_x_0←(*g_d[1;2])×(×/(1+*(g_b[2;]+g_u[2;]+g_hhatarr[1;(⍳g_isz)]+.×g_w[1;;])))


 ⍝ For each row, add a 0 first, then a 1
 ⍝ Compare free energies, the output class is the one that gives
 ⍝ the least free energy

⍝ firstimg[;g_isz+1]←0 ⍝ batch - all rows in y column to 0
⍝ xj←((1,g_isz+1)⍴g_b[2;])+(g_hhatarr[1;]+.×⍉g_w[1;;]) ⍝ 2 → hidden layer number
⍝ f0←+/,(-1×g_hhatarr[1;]+.×⍉(1,g_isz+1)⍴g_b[1;],0)-(10⍟(1+*xj))
⍝
⍝ firstimg[;g_isz+1]←1 ⍝ batch - all rows in y column to 1
⍝ xj←((1,g_isz+1)⍴g_b[2;])+(g_hhatarr[1;]+.×⍉g_w[1;;])
⍝ f1←+/,(-1×g_hhatarr[1;]+.×⍉(1,g_isz+1)⍴g_b[1;],0)-(10⍟(1+*xj))  ⍝ bias initialized and added for yc
⍝
⍝
⍝ :If f0<f1
⍝     z←0
⍝ :Else
⍝     z←1
⍝ :EndIf
