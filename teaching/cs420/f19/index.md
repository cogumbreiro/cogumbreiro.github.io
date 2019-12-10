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
video12: https://echo360.org/media/882b9751-9ec4-4878-b815-37c02c75bb49/public
video13: https://echo360.org/media/18449864-736f-4e50-9e38-f1b97332196b/public
video14: https://echo360.org/media/9e6af315-63b1-4ecf-8d52-f34e8731794e/public
video15: https://echo360.org/media/da096d82-1b1f-4e1d-8d6c-b6888adb5335/public
video16: https://echo360.org/media/bccdcc31-4290-4f71-bedd-b8b7dbbef1c6/public
module2: https://echo360.org/media/efadc769-ff74-4460-9c2d-fde21e4c3e9c/public
video17: https://echo360.org/media/636a5ca2-4364-4384-966d-6b30e0c1c42c/public
video18: https://echo360.org/media/6d26c362-ee93-491c-a35a-f09f90b28a61/public
video19: https://echo360.org/media/70a3b825-ff35-4130-bc78-4bd6fc66a712/public
video20: https://echo360.org/media/c8cf0afd-13c1-4f50-8732-d2c15f779b14/public
video21: https://echo360.org/media/05d398ae-537a-4fd7-98dc-3d99d44da859/public
video22: https://echo360.org/media/db7d50d5-986a-4bdb-a65a-b73c9c5a30d9/public

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


# Final Grade Calculator
<script type="text/javascript">
function fix(grade, min, max) {
    if (grade < min) return min;
    if (grade > max) return max;
    return grade;
}
function calc(test1, test2, project1, test3, part) {
    // make sure grades are within bound
    test1 = fix(test1, 0, 100);
    test2 = fix(test2, 0, 80);
    project1 = fix(project1, 0, 35);
    test3 = fix(test3, 0, 100);
    part = fix(part, 0, 100);
    return test1*.32 + (test2 + project1)*.32 + test3 *.32 + part *.04;
}
function letter(grade) {
    let grades = [
      [89, 'A'],
      [85, 'A-'],
      [81, 'B+'],
      [74, 'B'],
      [70, 'B-'],
      [66, 'C+'],
      [59, 'C'],
      [55, 'C-'],
      [51, 'D+'],
      [44, 'D'],
      [40, 'D-'],
    ];
    const result = grades.find(pair => {
      const [cutoff, _] = pair;
      return grade >= cutoff;
    });
    if (result != undefined) {
      const [_, letter] = result;
      return letter;
    }
    return 'F';
}
function updateGrade() {
  const project1 = parseInt(document.getElementById("project1").value) * 2.692307692;
  const test1 = parseInt(document.getElementById("test1").value);
  const test2 = parseInt(document.getElementById("test2").value);
  const test3 = parseInt(document.getElementById("test3").value);
  const part = (parseInt(document.getElementById("participation").value) / 24) * 100;
  document.getElementById("final-grade").innerHTML = "Final grade: " + letter(calc(test1, test2, project1, test3, part));
  return false;
}
</script>

**Disclaimer: THE GRADE CALCULATOR IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND AND MIGHT PRODUCE INCORRECT RESULTS; THE CALCULATOR IGNORES YOUR HOMEWORK SUBMISSIONS.**

Test 1 (out of 100): <input type="number" name="test1" min="0" max="100" id="test1" onchange="updateGrade()" value="0" ><br/>
Project 1 (out of 13 exercises): <input type="number" name="project1" min="0" max="13" value="0" onchange="updateGrade()" id="project1"><br/>
Test 2 (out of 80): <input type="number" name="test2" min="0" max="80" id="test2" value="0" onchange="updateGrade()"> <br/>
Test 3 (out of 100): <input type="number" name="test3" min="0" max="100" id="test3" value="0" onchange="updateGrade()"><br/>
Attendance (out of 24) <input type="number" name="participation" min="0" max="24" id="participation" value="0" onchange="updateGrade()"><br/>
<div id="final-grade" onload="updateGrade()">(Edit values to update final grade)</div>

# Course information
* **Location:** Room W02-0158, 2<sup>nd</sup> floor, Wheatley
* **Schedule:** Tuesdays & Thursdays 5:30pm to 6:45pm

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** Room 0201-16, 3<sup>rd</sup> floor, McCormack
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
| Th, Oct 17 | 12 | [Turing Machines](lecture12.html) | § 3.1 | {% include_relative links.html slides-url="lecture12.pdf" recording-url=page.video12 %} | [HW6](hw6.pdf)
| Tu, Oct 22 | 13 | [Variants of Turing Machines](lecture13.html) | § 3.2 | {% include_relative links.html slides-url="lecture13.pdf" recording-url=page.video13 %} | [lf.zip](https://piazza.com/class_profile/get_resource/k02r6uf6if147e/k23el06j9sg1ip) |
| Th, Oct 24 | 14 | [Functional Programming in Coq](lecture14.html) (`Basics.v`) | [§ LF.1](https://softwarefoundations.cis.upenn.edu/lf-current/Basics.html)  | {% include_relative links.html slides-url="lecture14.pdf" recording-url=page.video14 %} | [ex.v](lecture14.v) |
| Tu, Oct 29 | 15 | [Proofs by induction](lecture15.html) (`Induction.v`) | [§ LF.2](https://softwarefoundations.cis.upenn.edu/lf-current/Induction.html)  | {% include_relative links.html slides-url="lecture15.pdf" recording-url=page.video15 %} | [ex.v](lecture15.v) |
| Th, Oct 31 | 16 | [More tactics (`Tactics.v`)](lecture16.html) | [§ LF.5](https://softwarefoundations.cis.upenn.edu/lf-current/Tactics.html) | {% include_relative links.html slides-url="lecture16.pdf" recording-url=page.video16 %} |
| Tu, Nov 05 | | [(Module 2 recap)](module-2.html) | |  {% include_relative links.html slides-url="module-2.pdf" recording-url=page.module2 %} | [ex.v](module2.v) |
| Th, Nov 07 | | (Mini-Test 2) | |
| Tu, Nov 12 | 17 | [Acceptance, emptiness and equality tests](lecture17.html) | § 4.1 | {% include_relative links.html slides-url="lecture17.pdf" recording-url=page.video17 %} |
| Th, Nov 14 | 18 | [Countable and uncountable sets](lecture18.html) | § 4.2 | {% include_relative links.html slides-url="lecture18.pdf" recording-url=page.video18 %} |
| Tu, Nov 19 | 19 | [TM Acceptance](lecture19.html) | § 4.2  | {% include_relative links.html slides-url="lecture19.pdf" recording-url=page.video19 %} |
| Th, Nov 21 | 20 | [Decidability](lecture20.html) |  § 4.2 | {% include_relative links.html slides-url="lecture20.pdf" recording-url=page.video20 %} | [HW7](hw7.pdf) |
| Tu, Nov 26 | 21 | [Undecidable problems](lecture21.html) | § 4.2 | {% include_relative links.html slides-url="lecture21.pdf" recording-url=page.video21 %} |
| Th, Nov 28 | | (Thanksgiving recess)        | |
| Tu, Dec 03 | | (Class cancelled) |  |  |
| Th, Dec 05 | 22 | [Mapping reducibility](lecture22.html) |  § 5.3 | {% include_relative links.html slides-url="lecture22.pdf" recording-url=page.video22 %} |
| Tu, Dec 10 | | [(Module 3 recap)](module-3.html) | {% include_relative links.html slides-url="lecture23.pdf" %} |
| Th, Dec 12 | | (Mini-Test 3) | |
