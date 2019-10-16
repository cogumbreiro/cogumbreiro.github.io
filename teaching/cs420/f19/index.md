---
author: Tiago Cogumbreiro
semester: Fall 2019
title: "CS 420: Introduction to the Theory of Computation"
layout: single
video1: https://echo360.org/media/3fc6131e-60e6-4092-aeb3-6821114b276b/public
video2: https://echo360.org/media/cf5c78f0-0f52-4cd8-bf67-189e25437e70/public
video3: https://echo360.org/media/428a8801-30f2-465d-ba84-d8706724eaaa/public
video4: https://echo360.org/media/ab2fd8b4-e488-47d6-a17a-ce15bd6403c2/public
video5: https://echo360.org/media/f4d1b893-932e-49ff-aac6-7db3a1fa2216/public
video6: https://echo360.org/media/7ea30802-29d0-4340-ba68-0b8582946fd8/public
video7: https://echo360.org/media/a00ccbb4-1b24-4cdf-9041-b133698a0883/public
video8: https://echo360.org/media/46208eef-a98e-4f23-9cea-7f47d727aa46/public
video9: https://echo360.org/media/5d87087a-f85e-4a73-9c9a-760c22746da8/public
module1: https://echo360.org/media/c6c27e65-480e-4f90-9f84-367dd3d39010/public
video10: https://echo360.org/media/60e1ce62-99ef-478f-a6b0-4b1fbd2c10a5/public
video11: https://echo360.org/media/afc5897a-5cfd-4f50-ad1a-1abdf6810c10/public
---

# {{ page.title }}
## {{ page.semester }}

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
<a class="button is-large is-link" href="https://piazza.com/umb/fall2019/cs420/home">Forum</a>
<a class="button is-large is-link" href="https://umb.umassonline.net/webapps/blackboard/content/listContentEditable.jsp?content_id=_3274098_1&course_id=_62251_1&mode=reset">Homework submission</a>
<a class="button is-large is-link" href="https://www.estalee.com/">Attendance (ZS40HJD)</a>
<a class="button is-large is-link" href="https://echo360.org/section/c4732671-9a09-4122-ae27-47103529a0cb/public">Video Recordings</a>
</div>


# Course information
* **Location:** `W02-0158`, Wheatley
* **Schedule:** Tuesdays & Thursdays 5:30pm to 6:45pm

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** `S-3-183`, Science Center
* **Office hours:** Tuesdays & Thursdays 2:30pm to 4:00pm

## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.

| Date       | # | Lecture      | Section | Material | <acronym title="Homework">HW</acronym> |
|:-----------|-:|:-------------|:-------------|---|
| Tu, Sep 03 | 1 | [Deterministic Finite Automata](lecture01.html) | § 1.1  | {% include_relative links.html slides-url="lecture01.pdf" recording-url=page.video1 %} | [HW1](hw1.pdf) |
| Th, Sep 05 | 2 | [DFA operations](lecture02.html) | § 1.1 | {% include_relative links.html slides-url="lecture02.pdf" recording-url=page.video2 %} | |
| Tu, Sep 10 | 3 | [Nondeterministic Finite Automata; NFA ⇔ DFA](lecture03.html) | § 1.2 | {% include_relative links.html slides-url="lecture03.pdf" recording-url=page.video3 %} | [HW2](hw2.pdf) |
| Th, Sep 12 | 4 | [NFA operations](lecture04.html) | § 1.2 | {% include_relative links.html slides-url="lecture04.pdf" recording-url=page.video4 %} |
| Tu, Sep 17 | 5 | [Regular expressions](lecture05.html) | § 1.3 | {% include_relative links.html slides-url="lecture05.pdf" recording-url=page.video5 %} | [HW3](hw3.pdf) |
| Th, Sep 19 | 6 | [Pumping lemma; Non-regular languages](lecture06.html) | § 1.4 | {% include_relative links.html slides-url="lecture06.pdf" recording-url=page.video6 %}|
| Tu, Sep 24 | 7 | [Context-free grammars](lecture07.html) | § 2.1 | {% include_relative links.html slides-url="lecture07.pdf" recording-url=page.video7 %} | [HW4](hw4.pdf)
| Th, Sep 26 | 8 | [Chomsky Normal Form](lecture08.html) | § 2.1 | {% include_relative links.html slides-url="lecture08.pdf" recording-url=page.video8 %} |
| Tu, Oct 01 | | [(Module 1 recap)](module-1.html) | | {% include_relative links.html slides-url="module-1.pdf" recording-url=page.module1 %}
| Th, Oct 03 | | (Minit-test 1)
| Tu, Oct 08 | 9 | [Pushdown Atomata](lecture09.html) | § 2.2 | {% include_relative links.html slides-url="lecture09.pdf" recording-url=page.video9 %} | [HW5](hw5.pdf) |
| Th, Oct 10 | 10 | [PDA ⇔ CFG](lecture10.html) | § 2.2 | {% include_relative links.html slides-url="lecture10.pdf" recording-url=page.video10 %} |
| Tu, Oct 15 | 11 | [Pumping lemma; Non-context-free Languages](lecture11.html) | § 2.2 | {% include_relative links.html slides-url="lecture11.pdf" recording-url=page.video11 %} |
| Th, Oct 17 | 12 | Turing Machines | § 3.1 | {% include_relative links.html %} |
| Tu, Oct 22 | 13 | Variants of Turing Machines | § 3.2 | {% include_relative links.html %} |
| Th, Oct 24 | 14|  Acceptance, emptiness and equality tests | § 4.1 | {% include_relative links.html %} |
| Tu, Oct 29 | 15 | Countable and uncountable sets | § 4.2 | {% include_relative links.html %} |
| Th, Oct 31 | 16 | TM Acceptance | § 4.2 | {% include_relative links.html %} |
| Tu, Nov 05 | | (Module 2 recap) | |
| Th, Nov 07 | | (Mini-Test 2) | |
| Tu, Nov 12 | 17 |  Undecidable problems | § 5.1 | {% include_relative links.html %} |
| Th, Nov 14 | 18 | Reduction via Computation Histories | § 5.1 | {% include_relative links.html %} |
| Tu, Nov 19 | 19 | Mapping reducibility | § 5.3 | {% include_relative links.html %} |
| Th, Nov 21 | 20 | Mapping reducibility | § 5.3 | {% include_relative links.html %} |
| Tu, Nov 26 | 21 | Measuring complexity | § 7.1 | {% include_relative links.html %} |
| Th, Nov 28 | | (Thanksgiving recess)        | |
| Tu, Dec 03 | 22 | The Class P | § 7.2  | {% include_relative links.html %} |
| Th, Dec 05 | 23 | The Class NP/ NP Completeness | § 7.3 | {% include_relative links.html %} |
| Tu, Dec 10 | | (Module 3 recap) | |
| Th, Dec 12 | | (Mini-Test 3) | |
