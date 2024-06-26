# Discussion and Reflection


The bulk of this project consists of a collection of five
questions. You are to answer these questions after spending some
amount of time looking over the code together to gather answers for
your questions. Try to seriously dig into the project together--it is
of course understood that you may not grasp every detail, but put
forth serious effort to spend several hours reading and discussing the
code, along with anything you have taken from it.

Questions will largely be graded on completion and maturity, but the
instructors do reserve the right to take off for technical
inaccuracies (i.e., if you say something factually wrong).

Each of these (six, five main followed by last) questions should take
roughly at least a paragraph or two. Try to aim for between 1-500
words per question. You may divide up the work, but each of you should
collectively read and agree to each other's answers.

[ Question 1 ] 

For this task, you will three new .irv programs. These are
`ir-virtual?` programs in a pseudo-assembly format. Try to compile the
program. Here, you should briefly explain the purpose of ir-virtual,
especially how it is different than x86: what are the pros and cons of
using ir-virtual as a representation? You can get the compiler to to
compile ir-virtual files like so: 

racket compiler.rkt -v test-programs/sum1.irv 

(Also pass in -m for Mac)

The three .irv programs are tester1.irv, teser2.irv, and tester3.irv.
Using ir-virtual? shows us how assembly operates in the language racket. It's simple enough in the sense that it resembles assembly and is easier to create a compiler for and understand in comparison with x86. The cons are that the assembly commands are limited.  


[ Question 2 ] 

For this task, you will write three new .ifa programs. Your programs
must be correct, in the sense that they are valid. There are a set of
starter programs in the test-programs directory now. Your job is to
create three new `.ifa` programs and compile and run each of them. It
is very much possible that the compiler will be broken: part of your
exercise is identifying if you can find any possible bugs in the
compiler.

For each of your exercises, write here what the input and output was
from the compiler. Read through each of the phases, by passing in the
`-v` flag to the compiler. For at least one of the programs, explain
carefully the relevance of each of the intermediate representations.

For this question, please add your `.ifa` programs either (a) here or
(b) to the repo and write where they are in this file.

The files are, suma.ifa, suma2.ifa, and suma3.ifa
suma.ifa - (let* ((x 4)
       (y 6)
       (sum (+ x y))
       (result (* sum 2)))
  (print result))
output = 20
The first phase shows what was inputted in the file, 
then it is simplified to be turned into assembly, 
then finally the asm file.

suma2.ifa - (let* ([a 8]
       [b (* a 3)]
       [c (+ b 20)])
  (print c))
output = 44

suma3.ifa - (let* ([a 22]
       [b (* a 5)]
       [c (- b 13)])
  (print c))
output = 97

[ Question 3 ] 

Describe each of the passes of the compiler in a slight degree of
detail, using specific examples to discuss what each pass does. The
compiler is designed in series of layers, with each higher-level IR
desugaring to a lower-level IR until ultimately arriving at x86-64
assembler. Do you think there are any redundant passes? Do you think
there could be more?

In answering this question, you must use specific examples that you
got from running the compiler and generating an output.

Using suma3.ifa - First the compiler parses through the input (ifarith), 
it is then desugared (ifarith tiny) and looks like this (let ((x1254 22)),
then is ir-virtual which transforms it into this '(((label lab1259) (mov-lit x1254 22)),
then is x86 and then finally nasm. 

[ Question 4 ] 

This is a larger project, compared to our previous projects. This
project uses a large combination of idioms: tail recursion, folds,
etc.. Discuss a few programming idioms that you can identify in the
project that we discussed in class this semester. There is no specific
definition of what an idiom is: think carefully about whether you see
any pattern in this code that resonates with you from earlier in the
semester.

Lambda calculus to establish the foundation for ifarith and ifarith-tiny functionality. A lot of ifarith->ifarith-tiny is tail recursive, and inside it uses match cases to contain all the cases necessary. 

[ Question 5 ] 

In this question, you will play the role of bug finder. I would like
you to be creative, adversarial, and exploratory. Spend an hour or two
looking throughout the code and try to break it. Try to see if you can
identify a buggy program: a program that should work, but does
not. This could either be that the compiler crashes, or it could be
that it produces code which will not assemble. Last, even if the code
assembles and links, its behavior could be incorrect.

To answer this question, I want you to summarize your discussion,
experiences, and findings by adversarily breaking the compiler. If
there is something you think should work (but does not), feel free to
ask me.

Your team will receive a small bonus for being the first team to
report a unique bug (unique determined by me).

Idiv and Mul don't work. As well as the Complier doesn’t work with negative numbers.

[ High Level Reflection ] 

In roughly 100-500 words, write a summary of your findings in working
on this project: what did you learn, what did you find interesting,
what did you find challenging? As you progress in your career, it will
be increasingly important to have technical conversations about the
nuts and bolts of code, try to use this experience as a way to think
about how you would approach doing group code critique. What would you
do differently next time, what did you learn?

I believe that working on this gave me a better understanding on how compilers work, 
especially with turning source code into executable machine code. When testing/running 
the code we realized we had to download something in order to make the asm files 
which was annoying when we were in the middle of working on the code. 
There were several steps that were very repetitive in making sure each program worked. Reflecting on this experience, there are several things I would do differently next time. Firstly, I would allocate more time for the project, allowing for unexpected delays and ensuring that each step could be approached methodically without feeling rushed. Starting earlier would provide the necessary buffer to address any technical challenges or dependencies that may arise. Prioritizing communication and collaboration within the group is very important. Overall, this project has been a valuable learning experience, offering insights into the complexities of compiler design and implementation.
