 z←gencreateinput

 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 ⎕←'Reading done'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 g_isz←28
 nin←g_isz+1 ⍝ for y values, add 1
 nout←nin
 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 numlayers←2
 mnistmat←(nr,g_isz,g_isz)⍴(mnist[(⍳nr);1+⍳((-1)+nc)])

 ⍝ sending whole 28X28 image as a minibatch
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html
 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X28 random numbers, uniformly distributed b/w
 ⍝ (-a/4) and (a/4)
 ⍝ create w as a 3D array
 w←(numlayers,nin,nout)⍴0
 ⍝ Initialize 1st laywe weights
 w[1;;]←⊃,/(nin,nin)⍴tmp       ⍝ ⊃ and ,/ for removing the nesting on each item -- aargh
 b←(numlayers,nin)⍴0 ⍝ biases

 hhatarr←(numlayers,nin)⍴0
 input←(g_isz)(hhatarr)(w)((numlayers,nin)⍴b)(lr)(nin)(numlayers)(mnistmat)
 z←input
