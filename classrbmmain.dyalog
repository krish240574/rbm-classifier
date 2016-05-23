 z←classrbmmain;layernum;nin;nout;a
 ⍝ use of a RBM for discriminative training
 ⍝ classification
 ⍝ calculate free energy, for each class
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 isz←28 ⍝ mnist image size 28X28 pixels
 mnistmat←(nr,isz,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]
 input←createinput⍉⊃mnistmat[1;1;] ⍝ createinput will add Ys to the input


 ⍝ no need for layer number here - we have 2 layers only
 updates←numeraicd input

 xt←(1,isz+1)⍴x[1;] ⍝ use xt as posterior

 ⍝ For each row, add a 0 first, then a 1
 ⍝ Compare free energies, the output class is the one that gives
 ⍝ the least free energy
 xt[isz+1]←0  ⍝ set class as 0
 xj←((1,isz+1)⍴b[2;])+(xt+.×⍉w) ⍝ 2 → hidden layer number
 f0←(-1×xt+.×⍉(1 4)⍴b[1;],0)-(10⍟(1+*xj))

 xt←(1,isz+1)⍴x[1;]
 xt[isz+1]←1 ⍝ set class as 1
 xj←((1,isz+1)⍴b[2;])+(xt+.×⍉w)
 f1←(-1×xt+.×⍉(1,isz+1)⍴b[1;],0)-(10⍟(1+*xj))  ⍝ bias initialized and added for yc

 :If f0<f1
     z←f0
 :Else
     z←f1
 :EndIf
