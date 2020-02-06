---
author: Tiago Cogumbreiro
semester: Spring 2020
title: "CS 450: Structure of Higher Level Languages"
layout: single
video2: https://echo360.org/media/96f75398-4060-4d4d-857c-ca1bc15282db/public
video3: https://echo360.org/media/4a56f9ea-37a2-453e-912e-ff5764d9eee6/public
video4: https://echo360.org/media/2625074b-6f3f-4742-827a-3249d5b01ad3/public
video5: https://echo360.org/media/ba0817ce-f3e6-4994-b953-1a0570cee1b4/public
---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
<a class="button is-large is-link" href="https://piazza.com/class/k5ubs34raz3ao">Forum</a>
<a class="button is-large is-link" href="https://www.gradescope.com/courses/85523">Homework submission</a>
<a class="button is-large is-link" href="https://www.estalee.com/">Attendance</a>
</div>

# Course information

* **Location:** (M01-0409) Room 0409, 1<sup>st</sup> floor, McCormack
* **Schedule:** 3:00pm to 3:50pm, Monday, Wednesday, Friday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact
* Abdelrahman Obyat, Dennis Liew
* **Office:** (M03-0201-33) Room 0201-33, 3<sup>rd</sup> floor, McCormack
* **Office hours:** 5:15pm to 7:00pm, Tuesday, Thursday

## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.


| Date       | #  | Lecture      |   |
|:-----------|---:|:-------------|---|
|            |    | **☙ Module 1: Basic Functional Programming ☙** |
| Mo, Jan 27 |  1 | [Course overview; arithmetic operations](lecture01.html) | {% include_relative links.html slides-url="lecture01.pdf" file-url="lecture01-examples.zip" %} |
| We, Jan 29 |  2 | [Function calls; boolean logic](lecture02.html)  | {% include_relative links.html slides-url="lecture02.pdf" recording-url=page.video2 file-url="lecture02-exercises.zip" %} |
| Fr, Jan 31 |  3 | [Function declarations; function definitions](lecture03.html) | {% include_relative links.html slides-url="lecture03.pdf" recording-url=page.video3 file-url="lecture03-exercises.zip" %} |
| Mo, Feb  3 |  4 | [Pairs; lists](lecture04.html) | {% include_relative links.html slides-url="lecture04.pdf" recording-url=page.video4 file-url="lecture04-exercises.zip" %} |
| We, Feb  5 |  5 | [Lists; quoting](lecture05.html) | {% include_relative links.html slides-url="lecture05.pdf" recording-url=page.video5 file-url="lecture05-exercises.zip" %} |
|            |    | **☙ Module 2: Advanced Functional Programming ☙** |
| Fr, Feb  7 |  6 | Nested definitions; caching |
| Mo, Feb 10 |  7 | Tail-call optimizations; structs |
| We, Feb 12 |  8 | Functions as values (closures) |
| Fr, Feb 14 |  9 | Functional patterns: find; map |
| Mo, Feb 17 |    | (School closure) |
| We, Feb 19 | 10 | Functional patterns: scan; reduce |
|            |    | **☙ Module 3: Lazy evaluation ☙** |
| Fr, Feb 21 | 11 | Functional Patterns: thunks; promises |
| Mo, Feb 24 | 12 | Streams |
| We, Feb 26 | 13 | Stream operators |
| Fr, Feb 28 | 14 | Evaluating expressions|
| Mo, Mar  2 | 15 | Variable argument functions; Formal methods |
|            |    | **☙ Module 4: Lambda calculus ☙** |
| We, Mar  4 | 16 | Spec lambda calculus |
| Fr, Mar  6 | 17 | Lexical/dynamic scoping |
| Mo, Mar  9 | 18 | Church encoding |
| We, Mar 11 | 19 | Spec lambda calculus with environments |
| Fr, Mar 13 | 20 | Implement lambda with environments |
| Mo, Mar 16 |    | (School closure) |
| We, Mar 18 |    | (School closure) |
| Fr, Mar 20 |    | (School closure) |
|            |    | **☙ Module 5: Mutable lambda calculus ☙**
| Mo, Mar 23 | 21 | Spec immutable lambda with defs |
| We, Mar 25 | 22 | Implement lambda with defs |
| Fr, Mar 27 | 23 | Spec mut-lambda with defs |
| Mo, Mar 30 | 24 | Implement mut-lambda with defs |
| We, Apr  1 | 25 | Exercises
| Fr, Apr  3 | 26 | Why study programming languages? |
|            |    | **☙ Module 6: Monads and side effects☙** |
| Mo, Apr  6 | 27 | Garbage collection |
| We, Apr  8 | 28 | Mark and sweep; sets; refactoring evaluation |
| Fr, Apr 10 | 29 | Effectful operations |
| Mo, Apr 13 | 30 | Refactoring errors; monads |
| We, Apr 15 | 31 | Type-directed monads; dynamic binding |
| Fr, Apr 17 | 32 | Monadic continuations |
| Mo, Apr 20 |    | (School closure) |
|            |    | **☙ Module 7: Abstraction ☙**
| We, Apr 22 | 33 | What is a PhD? |
| Fr, Apr 24 | 34 | Pattern-matching |
| Mo, Apr 27 | 35 | Generic methods |
| We, Apr 29 | 36 | Macros |
|            |    | **☙ Module 8: Object Oriented Programming ☙** |
| Fr, May  1 | 37 | LambdaJS; object method; Class inheritance |
| Mo, May  4 | 38 | SimpleJS; translating LambdaJS to SimpleJS |
| We, May  6 | 49 | Translating SimpleJS to LambdaJS |
| Fr, May  8 | 40 | The essence of JavaScript |
| Mo, May 11 | 41 | Parallelism with asynchronous evaluation |
| We, May 13 | 42 | Victory Lap |
