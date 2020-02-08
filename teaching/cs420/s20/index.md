---
author: Tiago Cogumbreiro
semester: Spring 2020
title: "CS 420: Introduction to the Theory of Computation"
layout: single
video2: https://echo360.org/media/28f68251-2762-48b5-836c-b056b50ce793/public
video3: https://echo360.org/media/20cf88a8-c051-4a7c-bbde-33b7cb89b43c/public
video4: https://echo360.org/media/eb2ef42d-3f1d-42d7-badd-2800d985ace2/public
---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
<a class="button is-large is-link" href="https://piazza.com/class/k5ubsxch57r196">Forum</a>
<a class="button is-large is-link" href="https://www.gradescope.com/courses/81793">Homework submission</a>
<a class="button is-large is-link" href="https://www.estalee.com/">Attendance</a>
</div>

# Course information

* **Location:** (Y01-1100) Room 1100, 1<sup>st</sup> floor, University Hall
* **Schedule:** 4:00pm to 5:15pm, Monday, Wednesday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact
* Son Nam Nguyen
* **Office:** (M03-0152) Room 0152, 3<sup>rd</sup> floor, McCormack
* **Office hours:** 1:30pm to 2:30pm, Monday, Wednesday

# Resources

* [Logic Foundations exercises](lf.tgz)

## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.


| Date       | #  | Lecture      |            |
|:-----------|---:|:-------------|:-----------|
|            |    | **☙ Module 1: Logical Foundations ☙** |
| Mo, Jan 27 |  1 | [Course overview; Coq intro](lecture01.html) [(`Basic.v`)](https://softwarefoundations.cis.upenn.edu/lf-current/Basics.html#lab18) | {% include_relative links.html slides-url="lecture01.pdf" file-url="lecture01.v" %} |
| We, Jan 29 |  2 | [Pattern matching; reflexivity](lecture02.html) [(`Basic.v`)](https://softwarefoundations.cis.upenn.edu/lf-current/Basics.html) | {% include_relative links.html slides-url="lecture02.pdf" recording-url=page.video2 file-url="lecture02.v" %} |
| Mo, Feb  3 |  3 | [Proofs by induction](lecture03.html) [(`Induction.v`)](https://softwarefoundations.cis.upenn.edu/lf-current/Induction.html)  | {% include_relative links.html slides-url="lecture03.pdf" recording-url=page.video3 file-url="lecture03.v" %} |
| We, Feb  5 |  4 | [Manipulating theorems; data-structures](lecture04.html) (`List.v`) | {% include_relative links.html slides-url="lecture04.pdf" recording-url=page.video4 file-url="lecture04.v" %} |
| Mo, Feb 10 |  5 | Polymorphism; Constructor injectivity, explosion principle (`Poly.v`, `Tactics.v`) | 
| We, Feb 12 |  6 | Tactics (`Tactics.v`)|
| Mo, Feb 17 |    | President's Day (Holiday) |
|            |    | **☙ Module 2: Regular Languages ☙** |
| We, Feb 19 |  7 | Formal languages **(Mini-test 1)** |
| Mo, Feb 24 |  8 | The Kleen star, language equivalence |
| We, Feb 26 |  9 | Regular expressions |
| Mo, Mar  2 | 10 | Nondeterministic Finite Automata |
| We, Mar  4 | 11 | NFA operations; NFA ⇔ REGEX |
| Mo, Mar  9 | 12 | Pumping lemma; Non-regular languages |
| We, Mar 11 | 13 | Deterministic Finite Automata; NFA ⇔ DFA  |
| Mo, Mar 16 |    | Spring Break |
| We, Mar 18 |    | Spring Break |
|            |    | **☙ Module 3: Context-free Languages ☙** |
| Mo, Mar 23 | 14 | Context-free grammars **(Mini-test 2)** |
| We, Mar 25 | 15 | Pushdown Atomata |
| Mo, Mar 30 | 16 | PDA ⇔ CFG |
| We, Apr  1 | 17 | Pumping lemma; Non-context-free Languages |
| Mo, Apr  6 | 18 | Turing Machines |
| We, Apr  8 | 19 | Variants of Turing Machines |
| Mo, Apr 13 | 20 | Acceptance, emptiness and equality tests |
| We, Apr 15 | 21 | TM Acceptance |
| Mo, Apr 20 |    |  Patriot's Day (Holiday) | |
|            |    | **☙ Module 4: Decidability ☙** |
| We, Apr 22 | 22 | Acceptance, emptiness and equality tests **(Mini-test 3)** |
| Mo, Apr 27 | 23 | Undecidable problems |
| We, Apr 29 | 24 | Reduction via Computation Histories |
| Mo, May  4 | 25 | Mapping reducibility |
| We, May  6 | 26 | Mapping reducibility |
| Mo, May 11 | 27 | Mapping reducibility **(Mini-test 4)** |
| We, May 13 | 28 | Course wrap up  |
