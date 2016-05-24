 z←numermain;b;w;layernum;nin;nout;a;updates;count;input;numlayers;isz;xt;xj;f0;f1;firstimg
 ⍝ use of a RBM for discriminative training
 ⍝ classification
 ⍝ calculate free energy, for each class
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 isz←28 ⍝ mnist image size 28X28 pixels
 numlayers←2 ⍝ one v, one h
 mnistmat←(nr,isz,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]
 y←isz⍴1
 y[(isz÷2)?isz]←0
 firstimg←mnistmat[1;;],y
 ⍝ sending one row now, can send whole 28X29 as a minibatch
 input←createinput(1,isz+1)⍴↑firstimg[1;]

 ⍝ input←(xt)(w)((numlayers,nin+1)⍴b)(lr)

 count←0 ⍝ counter for CD-10
 updates←count numeraicd input
 b←(numlayers,isz+1)⍴⊃updates[2]
 w←⊃updates[1]
 xt←(1,isz+1)⍴⊃updates[3]
 ⍝ For each row, add a 0 first, then a 1
 ⍝ Compare free energies, the output class is the one that gives
 ⍝ the least free energy
 
 xt[1;isz+1]←0  ⍝ set class as 0
 xj←((1,isz+1)⍴b[2;])+(xt+.×⍉w) ⍝ 2 → hidden layer number
 f0←+/(-1×xt+.×⍉(1,isz+1)⍴b[1;],0)-(10⍟(1+*xj))

 xt[1;isz+1]←1 ⍝ set class as 1
 xj←((1,isz+1)⍴b[2;])+(xt+.×⍉w)
 f1←+/(-1×xt+.×⍉(1,isz+1)⍴b[1;],0)-(10⍟(1+*xj))  ⍝ bias initialized and added for yc


 :If f0<f1
     z←0
 :Else
     z←1
 :EndIf
