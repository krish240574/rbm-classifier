 z←createinput sample

 layernum←1 ⍝ for now
 nin←1↑(⍴sample)
 nout←nin
 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html
 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X29 randoom numbers, uniformly distributed between (-a/4) and (a/4)

 ⍝ nin+1 , because we're adding another column to the inputs - the Ys.
 w←(nin,nin+1)⍴tmp
 numlayers←2 ⍝ for now
 b←(numlayers,nin+1)⍴0 ⍝ biases

 ⍝ start with sample of input

 xt←(1,nin)⍴sample[1;] ⍝ use xt as posterior

 xt←xt,(?0)>0.5  ⍝ add class

 ⍝ create the input nested array here
 ⎕←'Input is as follows :'
 ⎕←'1. Row of input, with class(Y) added'
 ⎕←'2. Weights between v and h - 28X29'
 ⎕←'3. Biases for each layer'
 ⎕←'4. Learning rate'

 input←(xt)(w)((numlayers,nin+1)⍴b)(lr)
 z←input