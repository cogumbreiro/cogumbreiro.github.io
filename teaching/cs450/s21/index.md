---
author: Tiago Cogumbreiro
semester: Spring 2021
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .zip

data:
  - module: Basic Functional Programming
  - lecture: Course overview; arithmetic operations
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcC-fUjlR8wkix5sFYTRMpJ
    date: Mo, Jan 25
  - lecture: Function calls; boolean logic
    date: We, Jan 27
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcfFeQF0LXvuk41H-ok1d5A
  - lecture: Function declarations; function definitions
    date: Fr, Jan 29
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQd04D3iyBHcF_ytGQx611GF
  - lecture: Pairs; lists
    date: Mo, Feb  1
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcLpJZUOxLEbGg4BB21p2rB
  - lecture: Lists; quoting
    date: We, Feb  3
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcS388JYOEMgEbiEdjvbkRe
################################################################################
  - module: Advanced Functional Programming
  - lecture: Nested definitions; caching
    date: Fr, Feb  5
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQd1FspNSp8tkA4ZG3J3qRnW
  - lecture: Tail-call optimization; structs
    date: Mo, Feb 8
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQeOhwS1IQ0larZLSKopENsX
  - lecture: Functions as values (closures)
    date: We, Feb 10
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQe0wRffLM3aIlY8oRhwylOd
  - lecture: "Dynamically-created funcs, storing funcs in lists, currying"
    date: Fr, Feb 12
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcJ-sQf20OiEAfFHD765xS0
  - closure: true
    date: Mo, Feb 15
  - lecture: "Function evaluation, abstract syntactic trees"
    date: We, Feb 17
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQdhMYgIwpCZ2v0q872ZgWsz
  - lecture: "Currying, exists, map"
    date: Fr, Feb 19
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQc90Yd5Oq3GlgDA9slA19ep
  - lecture: "Tail-call optimization,filter"
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQf5LBXF1W9cP4cDgLpJez8q
    date: Mo, Feb 22
  - lecture: "Reduction"
    date: We, Feb 24
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcShjT6W2IWchSVnFUlJeh3

################################################################################
  - module: Lazy evaluation
  - lecture: "Thunks and promises"
    date: Fr, Feb 26
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcFtA6HPUbdfmxoQqGREEsM
  - lecture: "Streams"
    date: Mo, Mar  1
  - lecture: Evaluating expressions; Variable argument functions
    date: We, Mar  3

################################################################################
  - module: Formal methods; Lambda calculus
  - lecture: "Language λ<sub>S</sub>: slow function calls"
    date: Fr, Mar  5
  - lecture: Lexical/dynamic scoping
    date: Mo, Mar  8
  - lecture: "Language λ<sub>E</sub>: fast function calls"
    date: We, Mar 10
  - lecture: Implementing Language λ<sub>E</sub>; Church encoding
    date: Fr, Mar 12
  - closure: true
    date: Mo, Mar 15
  - closure: true
    date: We, Mar 17
  - closure: true
    date: Fr, Mar 19

################################################################################
  - module: Mutable lambda calculus
  - lecture: "Language λ<sub>F</sub>: adding definitions incorrectly"
    date: Mo, Mar 22
  - lecture: Implementing λ<sub>F</sub>
    date: We, Mar 24
  - lecture: "Language λ<sub>D</sub>: adding definitions correctly"
    date: Fr, Mar 26
  - lecture: Implementing λ<sub>D</sub>
    date: Mo, Mar 29
  - lecture: Implementing λ<sub>D</sub> / Why study programming languages?
    date: We, Mar 31

################################################################################
  - module: Monads and side effects
  - lecture: Garbage collection
    date: Fr, Apr  2
  - lecture: Mark and sweep; sets; refactoring evaluation
    date: Mo, Apr  5
  - lecture: Effectful operations
    date: We, Apr  7
  - lecture: Refactoring errors; monads
    date: Fr, Apr  9
  - lecture: Dynamic dispatching
    date: Mo, Apr 12
  - lecture: Dynamic binding
    date: We, Apr 14
  - lecture: Monadic continuations
    date: Fr, Apr 16

################################################################################
  - module: Abstraction
  - lecture: PhD in CS/Pattern-matching
    date: Mo, Apr 19
  - lecture: Generic methods
    date: We, Apr 21
  - lecture: Macros
    date: Fr, Apr 23

################################################################################
  - module: Object Oriented Programming
  - lecture: LambdaJS
    date: Mo, Apr 26
  - lecture: JavaScript method and class inheritance
    date: We, Apr 28
  - lecture: Translating SimpleJS to LambdaJS
    date: Fr, Apr 30
  - lecture: The essence of JavaScript
    date: Mo, May  3
  - lecture: QA Session
    date: Mo, May  5
  - lecture: QA Session
    date: We, May  7

---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
<a class="button is-large is-link" href="https://gitlab.com/cogumbreiro/cs450-s21-qa">Announcements and QA</a>
<a class="button is-large is-link" href="https://www.gradescope.com/courses/226255">Homework submission</a>
</div>

**Past editions:** [**Spring '20**](../s20/), [**Spring '19**](../s19/)

# Course information

* **Schedule:** 3:00pm to 3:50pm, Monday, Wednesday, Friday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

* TBD
* **Office hours:** TBD


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
        {% capture f_url %}lecture{{ num }}-exercises{{ page.exercises_ext }}{% endcapture %}
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