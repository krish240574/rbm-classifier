 z←numeraicd x;b;w;lr;v0;v1;h0hat;h1hat;biash;biashv;h0;h1
 ⍝ CD-1
 ⍝ start with a training unit vector v0
 ⍝ of visible units
 ⍝ weights are passed to this function - initialized
 ⍝ w is the matrix of weights between a layer 1 and the layer 2
 ⍝ initialize biases to 0
 ⍝ b←(1,numneu)⍴0  initialized and passed here - biases

 ⍝ might need to add a node to the hidden layer, corresponding to the
 ⍝ Ys added
 ⎕←'Now training the RBM with CD1...'
 b←⊃x[3] ⍝ biases - initialize according to Bengio's paper. (Practical...)

 v0←⊃x[1] ⍝ visible inputs

 w←⊃x[2]

 lr←⊃x[4]

 t←((-1)↑(⍴b))
 h0hat←⊃x[1] ⍝ initialize posterior of visible as input
 biash←((1,t)⍴b[2;])
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)  ⍝ sigmoid activation


 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×biash+v0+.×⍉w1)


 ⍝ v1← P(v|h0)
 biasv←((1,t)⍴b[1;],0)
 v1←1÷(1+*-1×biasv+h1hat+.×w)

 ⍝ Update:
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[2;]←(((1,(nin+1)))⍴b[2;])+lr×(h0hat-h1hat)
 b[1;]←(((1,(nin+1)))⍴b[2;])+lr×(v0-v1)
 ⎕←'Updates are in the following format :'
 ⎕←'1. Weights after CD1'
 ⎕←'2. Biases of layer 1(visible layer)'
 ⎕←'3. Biases of layer 2(hidden layer)'
 updates←(w)(b[1;])(b[2;])
 z←updates
