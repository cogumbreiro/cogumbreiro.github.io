---
author: Tiago Cogumbreiro
semester: Spring 2020
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .zip

data:
  - module: Basic Functional Programming
  - lecture: Course overview; arithmetic operations
    date: Mo, Jan 27
    published: true
  - lecture: Function calls; boolean logic
    date: We, Jan 29
    video: https://echo360.org/media/96f75398-4060-4d4d-857c-ca1bc15282db/public
  - lecture: Function declarations; function definitions
    date: Fr, Jan 31
    video: https://echo360.org/media/4a56f9ea-37a2-453e-912e-ff5764d9eee6/public
  - lecture: Pairs; lists
    date: Mo, Feb  3
    video: https://echo360.org/media/2625074b-6f3f-4742-827a-3249d5b01ad3/public
  - lecture: Lists; quoting
    date: We, Feb  5
    video: https://echo360.org/media/ba0817ce-f3e6-4994-b953-1a0570cee1b4/public
################################################################################
  - module: Advanced Functional Programming
  - lecture: Nested definitions; caching
    date: Fr, Feb  7
    video: https://echo360.org/media/34f2d5d0-7dd1-4ddc-a31e-b7a438ff3e06/public
  - lecture: Tail-call optimization; structs
    date: Mo, Feb 10
    video: https://echo360.org/media/93c0e04b-5412-4e7f-9b70-4ad2a11ad379/public
  - lecture: Functions as values (closures)
    date: We, Feb 12
    video: https://echo360.org/media/7d9d9336-24f1-4f12-91d1-1678201e67a6/public
  - lecture: "Dynamically-created funcs, storing funcs in lists, currying"
    date: Fr, Feb 14
    skip_exercises: true
    video: https://echo360.org/media/f6a4bc29-31c0-4ed1-8a07-580c187764da/public
  - closure: true
    date: Mo, Feb 17
  - lecture: "Function evaluation, abstract syntactic trees"
    date: We, Feb 19
    video: https://echo360.org/media/76c95755-9f51-485d-8f91-c5e7839f9ed3/public
    skip_exercises: true
  - lecture: "Currying, exists, map"
    date: Fr, Feb 21
    video: https://echo360.org/media/fa74a55f-61ed-4be6-8f19-642e486e3f5e/public
  - lecture: "Tail-call optimization,filter"
    date: Mo, Feb 24
    video: https://echo360.org/media/8a82ff77-4c6f-4724-b31f-81af862d41cd/public
  - lecture: "Reduction"
    date: We, Feb 26
    video: https://echo360.org/media/46d8d6a7-82e3-4ca1-aa08-0e74220a7835/public
################################################################################
  - module: Lazy evaluation
  - lecture: "Thunks and promises"
    date: Fr, Feb 28
    video: https://echo360.org/media/cc838272-0681-4c4e-95b0-855763dfe4d1/public
  - lecture: "Streams"
    date: Mo, Mar  2
    video: https://echo360.org/media/9c3e116a-2cec-489a-9ee4-d8de85bcfbca/public
  - lecture: Evaluating expressions; Variable argument functions
    date: We, Mar  4
    video: https://echo360.org/media/ee6840bc-5959-434c-987a-6b2bd73616df/public
################################################################################
  - module: Formal methods; Lambda calculus
  - lecture: "Language λ<sub>S</sub>: slow function calls"
    date: Fr, Mar  6
    skip_exercises: true
    video: https://echo360.org/media/a81cd27c-a37d-49e5-bebe-8fe2148af332/public
  - lecture: Lexical/dynamic scoping
    date: Mo, Mar  9
    video: https://echo360.org/media/5a17d202-bcf7-494d-920e-d9682f6ba14d/public
  - lecture: "Language λ<sub>E</sub>: fast function calls"
    date: We, Mar 11
    video: https://echo360.org/media/712a228e-7253-40f8-aef1-99166c892865/public
    skip_exercises: true
  - closure: true
    date: Fr, Mar 13
  - closure: true
    date: Mo, Mar 16
  - closure: true
    date: We, Mar 18
  - closure: true
    date: Fr, Mar 20
  - lecture: Implementing Language λ<sub>E</sub>; Church encoding
    date: Mo, Mar 23
    skip_exercises: true
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQewCKcwrDwkhKoKOY8lZwPI

################################################################################
  - module: Mutable lambda calculus
  - lecture: "Language λ<sub>F</sub>: adding definitions incorrectly"
    date: We, Mar 25
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQfUjMbGSWTYi-mMTdlC1eV2
  - lecture: Implementing λ<sub>F</sub>
    date: Fr, Mar 27
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQe_8UTx25C2srKf0wjTiSbG
  - lecture: "Language λ<sub>D</sub>: adding definitions correctly"
    date: Mo, Mar 30
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQehC-CGR1I7ZB-OeIOSTSSn
    attachments:
    - title: QA session
      url: https://piazza.com/class_profile/get_resource/k5ubs34raz3ao/k8yw8a3sd52rg
      type: audio
  - lecture: Implementing λ<sub>D</sub>
    date: We, Apr  1
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQfY_lDiGkvf04svbNFS85E5
  - lecture: Implementing λ<sub>D</sub> / Why study programming languages?
    date: Fr, Apr  3
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQeAB5T5zW3fyxJC3dyqYKLj
################################################################################
  - module: Monads and side effects
  - lecture: Garbage collection
    date: Mo, Apr  6
    skip_exercises: true
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQdttBtWGvgEcEhwYwNCand4
    attachments:
    - url: https://piazza.com/class_profile/get_resource/k5ubs34raz3ao/k8yw746fyd812x
      type: audio
      title: QA session
  - lecture: Mark and sweep; sets; refactoring evaluation
    date: We, Apr  8
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQe4XwZKfZkMuaqcSLQc67M1
  - lecture: Effectful operations
    date: Fr, Apr 10
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQcvqbeepDj_FE3GF8q6AOfQ
  - lecture: Refactoring errors; monads
    date: Mo, Apr 13
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQelnFtnkYuQMHo8MQyWlnok
    attachments:
    - type: audio
      url: https://piazza.com/class_profile/get_resource/k5ubs34raz3ao/k8yw746fyd812x
      title: QA session
  - lecture: Dynamic dispatching
    date: We, Apr 15
    video: https://www.youtube.com/playlist?list=PL_fXogTdDGQfSL_szJZyFdC-N8uEhZW4R
  - lecture: Monadic continuations
    date: Fr, Apr 17
  - closure: true
    date: Mo, Apr 20
################################################################################
  - module: Abstraction
  - lecture: What is a PhD?
    date: We, Apr 22
  - lecture: Pattern-matching
    date: Fr, Apr 24
  - lecture: Generic methods
    date: Mo, Apr 27
  - lecture: Macros
    date: We, Apr 29
################################################################################
  - module: Object Oriented Programming
  - lecture: LambdaJS; object method; Class inheritance
    date: Fr, May  1
  - lecture: SimpleJS; translating LambdaJS to SimpleJS
    date: Mo, May  4
  - lecture: Translating SimpleJS to LambdaJS
    date: We, May  6
  - lecture: The essence of JavaScript
    date: Fr, May  8
  - lecture: Parallelism with asynchronous evaluation
    date: Mo, May 11
  - lecture: Victory lap
    date: We, May 13
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
* **Office:** <del>{{ site.office.location }}</del> #cs450 (Discord)
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

* Abdelrahman Obyat, Dennis Liew
* **Office:** <del>(M03-0201-33) Room 0201-33, 3<sup>rd</sup> floor, McCormack</del> #cs450 (Discord)
* **Office hours:** 2:00pm to 4:00pm and 5:15pm to 7:00pm, Tuesday, Thursday

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