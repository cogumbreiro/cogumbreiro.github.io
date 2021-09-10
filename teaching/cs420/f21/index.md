---
author: Tiago Cogumbreiro
semester: Fall 2021
title: "CS 420: Introduction to the Theory of Computation"
layout: single
exercises_ext: .v
data:
  - module: Logical Foundations
  - closure: true
    date: Mo, Sep 6
  - lecture: Course overview; Coq intro
    video: https://echo360.org/media/3649172a-8974-4912-b092-ca75ec5962f5/public
    date: We, Sep 8
  - lecture: Pattern matching; reflexivity
    date: Mo, Sep 13
  - lecture: Proofs by induction
    date: We, Sep 15
  - lecture: Manipulating theorems; data-structures
    date: Mo, Sep 20
  - lecture: Polymorphism; Constructor injectivity, explosion principle
    date: We, Sep 22
  - lecture: Logical Connectives
    date: Mo, Sep 27
  - lecture: Mini-test 1 recap
    date: We, Sep 29
################################################################################
  - module: Regular Languages
  - lecture: Formal languages
    date: Mo, Oct 4
  - lecture: Kleene star, language equivalence
    date: We, Oct 6
  - closure: true
    date: Mo, Oct 11
  - lecture: Regular expressions <b>(Mini-Test 1)</b>
    date: We, Oct 13
  - lecture: REGEX & Nondeterministic Finite Automata
    date: Mo, Oct 18
  - lecture: NFA ⇔ REGEX
    date: We, Oct 20
  - lecture: Deterministic Finite Automata; NFA ⇔ DFA
    date: Mo, Oct 25
  - lecture: Pumping lemma; Non-regular languages; Mini-test 2 recap
    date: We, Oct 27
################################################################################
  - module: Context-free Languages
  - lecture: Context-free grammars
    date: Mo, Nov 1
  - lecture: Pushdown Atomata
    date: We, Nov 3
  - lecture: PDA ⇔ CFG
    date: Mo, Nov 8
  - lecture: Pumping lemma; Non-context-free Languages; Turing Machines
    date: We, Nov 10
  - lecture: Variants of Turing Machines
    date: Mo, Nov 15
  - lecture: Acceptance, emptiness and equality tests
    date: We, Nov 17
  - lecture: Undecidability
    date: Mo, Nov 22
################################################################################
  - module: Decidability
  - lecture: Undecidable problems
    date: We, Nov 24
  - lecture: Undecidable problems
    date: Mo, Nov 29
  - lecture: Mapping reducibility
    date: We, Dec 1
  - lecture: Mapping reducibility
    date: Mo, Dec 6
  - lecture: QA session
    date: We, Dec 8
  - lecture: QA session
    date: We, Dec 13

---

**Past editions:** [**Spring '20**](../s20/), [**Fall '19**](../f19/)

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

# Course information

* **Location:** (M01-0409) Room 409, 1<sup>st</sup> floor, McCormack
* **Schedule:** 4:00pm to 5:15pm on Monday, Wednesday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

* Dennis Liew
* **Office hours:** 12:30pm to 1:30pm on Tuesday, Wednesday, and Thursday.

* Hannah Zicarelli
* **Office hours:** 5:30pm to 6:30pm on Monday, Tuesday, and Wednesday.

# Resources

* [CS420 Supplementary Material: The Turing library (Coq)](https://gitlab.com/cogumbreiro/turing)
* [CS420 Supplementary Material: NFA/DFA/REGEX algorithms (Python)](https://gitlab.com/cogumbreiro/karakuri/)
* [Logic Foundations exercises](https://softwarefoundations.cis.upenn.edu/lf-current/lf.tgz)
* [Final Grade Calculator (WARNING: the calculated result is **approximated**, because some values are calculated on a curve)](https://docs.google.com/spreadsheets/d/1nNruW7ls0jETG5z9vgfrmZKihjo_-2yx2iM7TmIPhuc/edit?usp=sharing)

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
  {% elsif r.attachments %}
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
        {% capture f_url %}lecture{{ num }}{{ page.exercises_ext }}{% endcapture %}
      {% endif %}
      <span class="buttons has-addons">{% include button.html url=s_url title="Download lecture slides" icon="book" %}{% include button.html url=r.video icon="file-video" title="Video recording" %}{% include button.html url=f_url icon="box" title="Class exercises" %}</span>
    {% endif %}
  </td>
{% endif %}
</tr>
{% if r.attachments %}
    {% for v in r.attachments %}
<tr>
  <td></td>
  <td></td>
    <td>
        <a href="{{ v.url }}">
        <span class="icon is-small"><i class="fas fa-file-{{v.type}}"></i></span>
        {{ v.title }}
        </a>
    </td>
</tr>
    {% endfor %}
{% endif %}

{% endfor %}
  </tbody>
</table>