---
author: Tiago Cogumbreiro
title: CS 450 - Structure of Higher Level Languages - Fall 2018
layout: single
---

# CS 450: Structure of Higher Level Languages

**[(Download all slides)](all.zip)**

## Instructor contact
* Email: Tiago.Cogumbreiro@umb.edu
* Office: S-3-183

## Course information

**Warning: No courses required by the CS major, minor, or certificate may be
taken pass/fail.**

* Room: M-1-0207, McCormack
* Schedule: Tuesdays & Thursdays 5:30pm to 6:45pm
* Office hours: Tuesdays & Thursdays 3:30pm to 5:00pm


## Course description

We will be learning and designing the semantics of functional and object
oriented programming.
The course is taught "from the ground up," so it does not assume a specific
background in functional programming.
Important topics include mechanisms for parameter passing, scoping, dynamic
storage allocation, and the implementation of object-oriented programming. The
language of instruction is Racket, a dialect of LISP, which is taught and
implemented in the course.

## Prerequisites

* CS310 (Advanced Data Structures and Algorithms)
* CS320 (Applied Discrete
Mathematics)

Or permission from the instructor.


## Textbook

Structure and Interpretation of Computer Programs. Harold Abelson and
Gerald Jay Sussman with Julie Sussman. MIT Press. 1996. ISBN: 978-0-262-51087-5
[A free PDF version is available online.](https://github.com/sarabander/sicp-pdf)

## Topics covered
* semantics of programming languages
* functional programming
* object oriented programming
* persistent data structures
* assignment-free programming

## Course work and grades

**There will be no exams.**  Your grade will be a (possibly weighted) average of at
most 10 homework assignments.

* Homework: 90%
* Participation: 10%

If `P` is the final percentage of your homework and participation, then
your course grade will be calculated as follows.

```scheme
(define (get-grade p)
  (cond [(> p 90) 'A]
        [(> p 85) 'A-]
        [(> p 80) 'B+]
        [(> p 75) 'B]
        [(> p 70) 'B-]
        [(> p 65) 'C+]
        [(> p 60) 'C]
        [(> p 55) 'C-]
        [(> p 50) 'D+]
        [(> p 45) 'D]
        [(> p 40) 'D-]
        [else 'F]))
```

# Software requirements

Students are expected to have access to Racket 7.0. Homework assignments consist
of a Racket script or a paper that will be submitted to Gradescope (unless
stated otherwise).

## Attendance

Attendance is required. All students are responsible for knowing everything that
is covered during class meetings, including announcements. If you must be absent
from a class meeting, make arrangements with another student to find out what
you missed.

## Homework

* No late homework will be accepted. The reception of assignments is done
automatically.
* You may **not** collaborate with anyone else on any homework. Each
homework represents your own, individual work.
* It is *acceptable* to discuss the concept in general terms, but
*unacceptable* to discuss specific solutions to any homework assignment.


## Participation

The participation component in the evaluation corresponds to student
participation in classes and in the online forum.
Participation does not just mean just answering questions correctly.
Discussion and questions, either posed online or in class, are encouraged and
counted toward participation.

## Accommodations

This class seeks ways to become a working and evolving model of inclusion and
universal design for all participants.   Individuals  with  disabilities  of any
kind  (including  learning  disabilities,  ADHD,  depression,  health
conditions),  who  require  instructional,  curricular,  or  test accommodations
are  responsible for make such needs known to the instructor as early as
possible.  Every effort will be made to accommodate students in a timely and
confidential manner.  Individuals who request accommodations must be registered
with the Ross Center for Disability Services, which authorizes accommodations
for students with disabilities.  If applicable, students may obtain adaptation
recommendations from the [Ross Center for Disability
Services](https://www.rosscenter.umb.edu), M-1-401,
(617-287-7430).  The student must present these recommendations and discuss them
with each professor within a reasonable period, preferably by the end of
Drop/Add period.

## Student Conduct

Students are required to adhere to the University Policy on Academic Standards
and Cheating, to the University Statement on Plagiarism and the Documentation of
Written Work, and to the Code of Student Conduct as delineated in the catalog of
Undergraduate Programs, pp.  44-45, and 48-52.  [The Code is available online.](https://www.umb.edu/life_on_campus/policies/community/code)

# Schedule

Week 1:
                              HW1
* 01/29 01. [Values, conditionals, function calls [PDF]](lecture01.pdf)
* 01/31 02. [Definitions, function definition, booleans [PDF]](lecture02.pdf)

Week 2:
* 02/05 03. [Data structures [PDF]](lecture03.pdf)
                              HW2
* 02/07 04. [Nested definitions, tail calls, activation frames](lecture04.pdf)

Week 3:
* 02/12     (school closure)
* 02/14 05. (HW1 deadline) [Structs, first-class funcs, currying](lecture05.pdf)

Week 4:
* 02/19 06. [Functional patterns (lists), tail call optimization](lecture06.pdf)
                              HW3
* 02/21 07. [Delayed evaluation [PDF]](lecture07.pdf)

Week 5:
* 02/26 08. [Streams [PDF]](lecture08.pdf) (HW2 deadline)
* 02/28 09. [Evaluating expressions [PDF]](lecture09.pdf) (Calc-Racket)

Week 6:
                              HW4
* 03/05 10. [Implementing the λ-Racket [PDF]](lecture10.pdf)
* 03/07 11. (HW3 deadline) [Lexical scopes, function closures [PDF]](lecture11.pdf)

Week 7:
* 03/12 (Spring break)
* 03/14 (Spring break)

Week 8:
* 03/19 12. [Implementing the λ<sub>E</sub>-calculus with environments [PDF]](lecture12.pdf), closures
                            HW5
* 03/21 13. [Shared mutable state and immutability [PDF]](lecture13.pdf)

Week 8:
* 03/26 14. (HW4 deadline) [Mutable environment semantics and frames [PDF]](lecture14.pdf)
* 03/28 15. [Mutable environment semantics and frames [PDF]](lecture14.pdf)
                            HW6

Week 9:
* 04/02 16. [Garbage collection [PDF]](lecture16.pdf)
* 04/04 17. (HW5 deadline) [Monads [PDF]](lecture17.pdf)

Week 10:
* 04/09 18. [Exceptions [PDF]](lecture18.pdf)
                            HW7
* 04/11 19. [Continuations [PDF]](lecture19.pdf)

Week 11:
* 04/16 20. (HW6 deadline) [What is a PhD? / Pattern matching [PDF]](lecture20.pdf)
* 04/18 21. [Pattern matching & Dynamic dispatching [PDF]](lecture21.pdf)

Week 12:
                            HW8
* 04/23 22. [Macros [PDF]](lecture22.pdf)
* 04/24 23. [Intro to OOP [PDF]](lecture23.pdf)

Week 13:
* 04/30 24. [Inheritance [PDF]](lecture24.pdf)
                            HW9
* 05/02 25. [Deconstructing JavaScript (I) [PDF]](lecture25.pdf)

Week 14:
* 05/07 26. [Deconstructing JavaScript (II) [PDF]](lecture26.pdf)
* 05/09 27. [Semester Wrap Up & Parallelism [PDF]](lecture27.pdf)

Week 18:
* 05/14 28. victory lap (HW7, HW8 deadline)

