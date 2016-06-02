 z←gencreateinput
 layernum←1 ⍝ for now

 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 ⍝ a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 ⎕←'Reading done'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 isz←28
 nin←isz
 nout←nin
 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 numlayers←2
 mnistmat←(nr,isz,isz)⍴(mnist[(⍳nr);1+⍳((-1)+nc)])

 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X28 random numbers, uniformly distributed b/w
 ⍝ (-a/4) and (a/4)
 ⍝ create w as a 3D array
 w←(numlayers,nin,nout)⍴0
 ⍝ Initialize 1st laywe weights
 w[1;;]←⊃,/(nin,nin)⍴tmp ⍝ ⊃ and ,/ for removing the nesting on each item -- aargh
 b←(numlayers,nin)⍴0 ⍝ biases
 hhatarr←(numlayers,nin+2)⍴0  ⍝ add 2 classes to input

 ⍝ add y values here - always add y values before use
 numclasses←2 ⍝ binary classifier
 d←(1,numclasses)⍴1
 y←(1,numclasses)⍴0 ⍝ classes
 y[1;1]←0
 y[1;2]←1
 tmp←(1,isz)⍴(,⊃mnistmat[1;1;])
 hhatarr[1;]←tmp,y ⍝ add first row of input and class cond. probs.
 u←(numclasses,nin)⍴,w[1;;] ⍝ just borrow from g_w - class-hidden wts

 input←(isz)(hhatarr)(w)((numlayers,nin)⍴b)(lr)(nin)(numlayers)(mnistmat)(u)(d)
 z←input
