 z←count numeraicd x;b;w;lr;v0;v1;h0hat;h1hat;biash;biasv;input;nin;t;updates
 ⍝ CD-10
 ⍝ start with a training unit vector v0
 ⍝ of visible units
 ⍝ weights are passed to this function - initialized
 ⍝ w is the matrix of weights between a layer 1 and the layer 2
 ⍝ initialize biases to 0
 ⍝ b←(1,numneu)⍴0  initialized and passed here - biases

 b←⊃x[3] ⍝ biases - initialize according to Bengio's paper. (Practical...)

 w←⊃x[2]

 lr←⊃x[4]

 h0hat←⊃x[1] ⍝ initialize posterior of visible as input
 v0←⊃x[1] ⍝ visible inputs
 nin←((-1)↑⍴(v0))

 biash←((1,nin)⍴b[2;])
 h1hat←1÷(1+*-1×biash+v0+.×⍉w)  ⍝ sigmoid activation

 ⍝ Repeat of h1hat calculation
 ⍝ h0 ← P(h|v0)
 ⍝h0←1÷(1+*-1×biash+v0+.×⍉w1)


 ⍝ v1← P(v|h0)
 biasv←((1,nin)⍴b[1;],0)
 v1←1÷(1+*-1×biasv+h1hat+.×w)

 ⍝ Update:
 w←w+lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 b[2;]←((1,nin)⍴b[2;])+lr×(h0hat-h1hat)
 b[1;]←((1,nin)⍴b[2;])+lr×(v0-v1)
⍝ ⎕←'Updates are in the following format :'
⍝ ⎕←'1. Weights after CD1'
⍝ ⎕←'2. Biases of layer 1(visible layer)'
⍝ ⎕←'3. Biases of layer 2(hidden layer)'
 :If count<10
     input←(v1)(w)(b)(lr)
     z←(1+count)numeraicd input
 :Else
     updates←(w)(b)(v1)
     z←updates
 :EndIf
