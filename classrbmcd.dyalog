 z←l classrbmcd x;b;w;lr;v0;v1;h0hat;h1hat;bias;h0;h1
 ⍝ CD-1 for a classifier RBM - labels added to the visible layer
 ⍝ start with a training unit vector v0
 ⍝ of visible units
 ⍝ weights are passed to this function - initialized
 ⍝ w←3 3⍴-2.80804935,-0.98573124,-1.84607092,-0.19229113,1.88018512,-2.17080185,-0.63218141,2.82216473,1.06585069
 ⍝ w is the matrix of weights between a layer j and the layer
 ⍝ k=j+1  (wjk)
 ⍝ initialize biases to 0
 ⍝ l is layer number
 ⍝ b←(1,numneu)⍴0  initialized and passed here

 ⍝ might need to add a node to the hidden layer, corresponding to the
 ⍝ Ys added

 b←⊃x[3] ⍝ biases - initialize according to Bengio's paper. (Practical...)

 v0←⊃x[1] ⍝ visible inputs

 w←⊃x[2]

 lr←⊃x[4]

 t←((-1)↑(⍴b))
 h0hat←⊃x[1] ⍝ initialize posterior of visible as input
 biash←((1,t)⍴b[2;],0)
 w←(t,t)⍴w
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)  ⍝ sigmoid activation

 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×biash+v0+.×⍉w1)


 ⍝ v1← P(v|h0)
 biasv←((1,t)⍴b[1;],0)
 v1←1÷(1+*-1×biasv+h1hat+.×w)

 ⍝ Update:
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[2;]←b[2;]+lr×(h0hat-h1hat)
 b[1;]←b[2;]+lr×(v0-v1)
