 z←numermain;b;w;layernum;nin;nout;a;updates;count;input;numlayers;isz;xt;xj;f0;f1;firstimg
 ⍝ use of a RBM for discriminative training
 ⍝ classification
 ⍝ calculate free energy, for each class

 (g_hhatarr g_w g_b g_lr g_nin g_numlayers g_mnistmat)←gencreateinput
 ⍝ add y values here - always add y values before use - need to figure how to add columns to all arrays 
 y←g_isz⍴1
 y[(g_isz÷2)?g_isz]←0
 firstimg←g_mnistmat[1;;],y

 li←(0)(layernum)(10)
 updates←numeraicd li

 b←(g_numlayers,g_isz+1)⍴⊃updates[2]
 w←⊃updates[1]
 xt←(1,g_isz+1)⍴⊃updates[3]
 ⍝ For each row, add a 0 first, then a 1
 ⍝ Compare free energies, the output class is the one that gives
 ⍝ the least free energy

 firstimg[;g_isz+1]←0 ⍝ batch - all rows in y column to 0
 xj←((1,g_isz+1)⍴g_b[2;])+(g_hhatarr[1;]+.×⍉w) ⍝ 2 → hidden layer number
 f0←+/(-1×xt+.×⍉(1,isz+1)⍴b[1;],0)-(10⍟(1+*xj))

 firstimg[;g_isz+1]←1
 xj←((1,isz+1)⍴b[2;])+(g_hhatarr[1;]+.×⍉w)
 f1←+/(-1×xt+.×⍉(1,isz+1)⍴b[1;],0)-(10⍟(1+*xj))  ⍝ bias initialized and added for yc


 :If f0<f1
     z←0
 :Else
     z←1
 :EndIf
