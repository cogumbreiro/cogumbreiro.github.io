---
author: Tiago Cogumbreiro
title: CS 720 - Logical Foundations of Computer Science - Fall 2018
layout: single
---
# CS 720: Logical Foundations of Computer Science
## Fall 2018

* **[Download all slides](cs720-slides.zip)**

# Course schedule

Week 1:

* [Lecture 1 [PDF]](lecture1.pdf), Sept  4 (Tue): Introduction (`Basics.v`)
* [Lecture 2 [PDF]](lecture2.pdf), Sept  6 (Thu): Induction (`Induction.v`)

Week 2:

* [Lecture 3 [PDF]](lecture3.pdf), Sept 11 (Tue): Data structures (`Lists.v`)
* Sept 12 (Wed):  **Homework 1 due:** `Basics.v`
* [Lecture 4 [PDF]](lecture4.pdf), Sept 13 (Thu): Lists, Polymorphism (`Poly.v`)

Week 3:

* [Lecture 5 [PDF]](lecture5.pdf), Sept 18 (Tue): Tactics (`Tactics.v`). **Homework 2 due:** `Induction.v`, `List.v`
* [Lecture 6 [PDF]](lecture6.pdf), Sept 20 (Thu): More tactics (`Tactics.v`).

Week 4:

* [Lecture 7 [PDF]](lecture7.pdf), Sept 25 (Tue): Logic in Coq (`Logic.v`). **Homework 3 due:** `Poly.v`
* [Lecture 8 [PDF]](lecture8.pdf), Sept 27 (Thu): Logic in Coq (`Logic.v`). **Homework 4 due:** `Tactics.v`

Week 5:

* [Lecture 9 [PDF]](lecture9.pdf), Oct  2 (Tue): Inductively defined propositions (`IndProp.v`).
* [Lecture 10 [PDF](lecture10.pdf), Oct  4 (Thu): Inductively defined propositions and proof objects (`IndProp.v`, `ProofObjects.v`) **Homework 5 due:** `Logic.v`

Week 6:

* [Lecture 11 [PDF]](lecture11.pdf), Oct  9 (Tue): Total and partial maps, modeling an imperative programming language (`Maps.v`, `Imp.v`, `ImpParser.v`, `ImpCEvalFun.v`).
* [Lecture 12 [PDF]](lecture12.pdf), Oct 11 (Thu): More automation (`Auto.v`) **Homework 6 due:** `IndProp.v`

Week 7:

* [Lecture 13 [PDF]](lecture13.pdf), Oct 16 (Tue): Program equivalence (`Equiv.v`).
* [Lecture 14 [PDF]](lecture14.pdf), Oct 18 (Thu): Hoare Logic (`Hoare.v`). **Homework 7 due:** `Imp.v`

Week 8:

* [Lecture 15 [PDF]](lecture15.pdf), Oct 23 (Tue): Hoare Logic (`Hoare.v`).
* [Lecture 16 [PDF]](lecture16.pdf), Oct 25 (Thu): Hoare Logic (`Hoare2.v`, `HoareLogic.v`). **Homework 8:** `Equiv.v`

Week 9

* [Lecture 17 [PDF]](lecture17.pdf), Oct 30 (Tue): Small-step operational semantics (`Smallstep.v`).
* [Lecture 18 [PDF]](lecture18.pdf), Nov  1 (Thu): Small-step operational semantics (`Smallstep.v`). **Homework 9:** `Hoare.v`, `Hoare2.v`

Week 10:

* [Lecture 19 [PDF]](lecture19.pdf), Nov  6 (Tue): Type systems (`Types.v`).
* [Lecture 20 [PDF]](lecture20.pdf), Nov  8 (Thu): Simply typed lambda calculus (STLC) (`Stlc.v`). **Homework 10:** `SmallStep.v`

Week 11:

* [Lecture 21 [PDF]](lecture21.pdf), Nov 13 (Tue): Properties of the STLC (`StlcProp.v`).
* Lecture 22, Nov 15 (Thu): [Project [PDF]](project.pdf)(. **Homework 11:** `Types.v`, `Stlc.v`

Week 12:

* Lecture 23, Nov 20 (Tue): [Project [PDF]](project.pdf)
* Lecture 24, Nov 22 (Thu): **(No class. Thanksgiving recess.)**

Week 13:

* Lecture 25, Nov 27 (Tue): Presentations **Homework 12:** `StlcProp.v`.
* Lecture 26, Nov 29 (Thu): Presentations    **Homework 13:** Project.
**Homework 13:** `Sub.v`

Week 14:

* Lecture 27, Dec  4 (Tue): Presentations
* Lecture 28, Dec  6 (Thu): Presentations

Week 15:

* Lecture 29, Dec 11 (Tue): Presentations
* Lecture 30, Dec 13 (Thu): Presentations, Course review.


# Syllabus

## Course information
* Room: M-1-0208
* Schedule: Tuesdays & Thursdays 12:30noon to 1:45pm
* Office hours: Tuesdays & Thursdays 2:30pm to 4:00pm

## Instructor contact
* Email: Tiago.Cogumbreiro@umb.edu
* Office: S-3-088
* Phone #: 617.287.6479

## Reading material
* Software Foundations. Volume 1 and 2. Benjamin Pierce et al. 2018.<br/>
  [`softwarefoundations.cis.upenn.edu`](https://softwarefoundations.cis.upenn.edu/)


## Course description

What makes a functional language functional? What makes an imperative language
imperative? Can we prove that all program executions are *absent* of undefined
behavior? Can we prove that a compiler *preserves* the intent of the source
program?

This course will introduce the formalization of the semantics of a programming
language. We will use a rigorous mathematical formalism to describe a
computation model (eg, a programming language) and its properties (eg, avoiding
undefined behavior).

The objective of this course is to specify a functional and
imperative language with pre- and post-conditions. We will use the Coq Proof
Assistant to specify the language, and prove the properties of the
the programming language we are specifying.

One of the underlying goals of the class is to appeal to practitioners (software
engineers) as well as researcher. To this end, we will learn a lightweight
testing technique, called property testing, that leverages properties of a
computation model (eg, a data structure or a component) to improve the quality
of our software.

## Topics covered

* basic concepts of logic
* computer-assisted theorem proving (Coq)
* functional programming
* logic programming
* operational semantics
* static type systems
* Hoare logic

## Prerequisites

The course is taught "from the ground up," so it does not assume a specific
background in logic or programming. However, familiarity with functional
programming and rigorous mathematical proofs is advantageous.

If you are unsure about meeting the requirements for this course, I recommend
doing the Coq exercises in the `Basics.v` chapter of the Software Foundations
book, Volume 1.

## Course work and grades

* Homework: 75%
* Presentation: 15%
* Participation: 10%

## Software requirements

Students are expected to have access to CoqIDE 8.7.2.

Homework assignments consist of Coq programs that will be submitted to the
instructor unless stated otherwise.

## Attendance

Attendance is required. All students are responsible for knowing everything that
is covered during class meetings, including announcements. If you must be absent
from a class meeting, make arrangements with another student to find out what
you missed.

## Homework

No late homework will be accepted.

Any homework may be revised and resubmitted once, up to **one week** after the
original deadline. (If you didn't submit on time, your original score will be
0.) The grade for that homework will be the average of the two submissions.

All homework will be weighted equally. Your lowest homework score will be
dropped.

You may **not** collaborate with anyone else on any homework. Each homework
represents your own, individual work.

It is *acceptable* to discuss the concept in general terms, but *unacceptable*
to discuss specific solutions to any homework assignment.

### On auto grading

Grading of Coq exercises is done automatically. Thus, in order for a homework to
be graded, it needs to be accepted by Coq. Use `Admitted` to allow incomplete
proofs and definitions.

## Presentations

Every student must present one of two:

* One chapter of the textbook to the class (60 minutes). The instructor will
  still publish the slides of that chapter.
* One paper on the subject of formalizing the semantics of a programming
  language or system (20 minutes presentation). The student may suggest a paper
  (or request one suggestion).

Grading presentations:
- 60% instructor's grade
- 25% peers' grade
- 15% grading peer participation (submit at least 10 sheets)

## Participation

The participation component in the evaluation corresponds to student
participation in classes and in the online forum. Participation does not just
mean just answering questions correctly. Discussion and questions, either posed
online or in class, are encouraged and counted toward participation.

Each reasonable student intervention (in the class or online) yields 1 point. If
the student reaches 14 points, they are graded the full mark of participation.

## Accommodations

This class seeks ways to become a working and evolving model of inclusion and
universal design for all participants.   Individuals  with  disabilities  of
any  kind  (including  learning  disabilities,  ADHD,  depression,  health
conditions),  who  require  instructional,  curricular,  or  test
accommodations  are  responsible for make such needs known to the instructor as
early as possible.  Every effort will be made to accommodate students in a
timely and confidential manner.  Individuals who request accommodations must be
registered with the Ross Center for Disability Services, which authorizes
accommodations for students with disabilities.  If applicable, students may
obtain adaptation recommendations from the Ross Center for Disability Services,
M-1-401, (617-287-7430),
[`www.rosscenter.umb.edu`](https://www.rosscenter.umb.edu).  The student must
present these recommendations and discuss them with each professor within a
reasonable period, preferably by the end of Drop/Add period.

## Student Conduct

Students are required to adhere to the University Policy on Academic Standards
and Cheating, to the University Statement on Plagiarism and the Documentation of
Written Work, and to the Code of Student Conduct as delineated in the catalog of
Undergraduate Programs, pp.  44-45, and 48-52.  The Code is available online at:
[`www.umb.edu/life_on_campus/policies/community/code`](https://www.umb.edu/life_on_campus/policies/community/code)

