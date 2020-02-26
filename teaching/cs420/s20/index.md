---
author: Tiago Cogumbreiro
semester: Spring 2020
title: "CS 420: Introduction to the Theory of Computation"
layout: single
video2: https://echo360.org/media/28f68251-2762-48b5-836c-b056b50ce793/public
video3: https://echo360.org/media/20cf88a8-c051-4a7c-bbde-33b7cb89b43c/public
video4: https://echo360.org/media/eb2ef42d-3f1d-42d7-badd-2800d985ace2/public
video5: https://echo360.org/media/72cef3f3-2ec2-43dc-8c1e-ff312e583c30/public
video6: https://echo360.org/media/0cc14e1a-7f61-4a18-9cf0-2e694000bfa0/public
data:
  - module: Logical Foundations
  - lecture: Course overview; Coq intro
    date: Mo, Jan 27
    published: true
  - lecture: Pattern matching; reflexivity
    date: We, Jan 29
    video: https://echo360.org/media/28f68251-2762-48b5-836c-b056b50ce793/public
  - lecture: Proofs by induction
    date: Mo, Feb  3
    video: https://echo360.org/media/20cf88a8-c051-4a7c-bbde-33b7cb89b43c/public
  - lecture: Manipulating theorems; data-structures
    date: We, Feb  5
    video: https://echo360.org/media/eb2ef42d-3f1d-42d7-badd-2800d985ace2/public
  - lecture: Polymorphism; Constructor injectivity, explosion principle
    date: Mo, Feb 10
    video: https://echo360.org/media/72cef3f3-2ec2-43dc-8c1e-ff312e583c30/public
  - lecture: Logical Connectives
    date: We, Feb 12
    video: https://echo360.org/media/0cc14e1a-7f61-4a18-9cf0-2e694000bfa0/public
  - closure: true
    date: Mo, Feb 17
################################################################################
  - lecture: Mini-test 1 recap
    date: We, Feb 19
    video: https://echo360.org/media/8e83d814-050b-4a8e-bdd3-99da20acbf2b/public
  - module: Regular Languages
  - lecture: Formal languages
    date: Mo, Feb 24
    video: https://echo360.org/media/eafbe08d-649e-4e52-bdb0-6c9b3139b4f9/public
  - lecture: Kleene star, language equivalence
    date: We, Feb 26
  - lecture: Regular expressions <b>(Mini-Test 1)</b>
    date: Mo, Mar  2
  - lecture: Nondeterministic Finite Automata
    date: We, Mar  4
  - lecture: NFA ⇔ REGEX, Deterministic Finite Automata; NFA ⇔ DFA
    date: Mo, Mar  9
  - lecture: Pumping lemma; Non-regular languages
    date: We, Mar 11
  - closure: true
    date: Mo, Mar 16
  - closure: true
    date: We, Mar 18
################################################################################
  - module: Context-free Languages
  - lecture: Context-free grammars <b>(Mini-test 2)</b>
    date: Mo, Mar 23
  - lecture: Pushdown Atomata
    date: We, Mar 25
  - lecture: PDA ⇔ CFG
    date: Mo, Mar 30
  - lecture: Pumping lemma; Non-context-free Languages
    date: We, Apr  1
  - lecture: Turing Machines
    date: Mo, Apr  6
  - lecture: Variants of Turing Machines
    date: We, Apr  8
  - lecture: Acceptance, emptiness and equality tests
    date: Mo, Apr 13
  - lecture: TM Acceptance
    date: We, Apr 15
  - closure: true
    date: Mo, Apr 20
################################################################################
  - module: Decidability
  - lecture: Acceptance, emptiness and equality tests <b>(Mini-test 3)</b>
    date: We, Apr 22
  - lecture: Undecidable problems
    date: Mo, Apr 27
  - lecture: Reduction via Computation Histories
    date: We, Apr 29
  - lecture: Mapping reducibility
    date: Mo, May  4
  - lecture: Mapping reducibility
    date: We, May  6
  - lecture: Mapping reducibility <b>(Mini-test 4)</b>
    date: We, May 11
  - lecture: Course conclusion
    date: We, May 13

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

* [The Turing library](https://gitlab.com/cogumbreiro/turing)
* [Logic Foundations exercises](lf.tgz)

## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.


{% assign l_num = 0 %}
{% assign m_num = 0 %}
<table>
  <thead>
    <tr>
      <th>Date</th>
      <th>#</th>
      <th>Lecture</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
{% for r in page.data %}
<tr>
{% if r.module %}
  {% assign m_num = m_num | plus: 1 %}
  <td></td>
  <td></td>
  <td><b>☙ Module {{m_num}}: {{ r.module }} ❧</b></td>
  <td></td>
{% elsif r.closure %}
  <td class="has-text-grey-light">{{r.date}}</td>
  <td></td>
  <td class="has-text-grey-light">(School closure)</td>
  <td></td>
{% else %}
  {% if r.published %}
    {% assign is_pub = true %}
  {% elsif r.video %}
    {% assign is_pub = true %}
  {% else %}
    {% assign is_pub = false %}
  {% endif %}
  {% assign l_num = l_num | plus: 1 %}
  {% capture num %}{% if l_num < 10 %}0{% endif %}{{ l_num }}{% endcapture %}
  <td>{{ r.date }}</td>
  <td>{{ num }}</td>
  <td>
  {% if is_pub %}
    <a href="lecture{{num}}.html">{{ r.lecture }}</a>
  {% else %}
    {{ r.lecture }}
  {% endif %}
  </td>
  <td>
    {% if is_pub %}
      {% capture s_url %}lecture{{ num }}.pdf{% endcapture %}
      {% if r.skip_exercises %}
        {% assign f_url = nil %}
      {% else %}
        {% capture f_url %}lecture{{ num }}.v{% endcapture %}
      {% endif %}
      <span class="buttons has-addons">{% include button.html url=s_url title="Download lecture slides" icon="book" %}{% include button.html url=r.video icon="file-video" title="Video recording" %}{% include button.html url=f_url icon="box" title="Class exercises" %}</span>
    {% endif %}
  </td>
{% endif %}
</tr>
{% endfor %}
  </tbody>
</table>
