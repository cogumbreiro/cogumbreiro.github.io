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
    attachments:
    - title: Implementing Language λ<sub>E</sub>
      url: https://echo360.org/media/63c71856-092a-4baa-875f-ac0d0a31edb3/public
      type: video
    - title: Implementing environments
      url: https://echo360.org/media/095d7465-c797-4fff-9044-95db40edb00c/public
      type: video
    - title: Implementing <code>s:subst</code>
      url: https://echo360.org/media/9f8b2b73-9d31-4a8c-a04d-507a1a81aa4b/public
      type: video
    - title: Implementing <code>s:eval</code>
      url: https://echo360.org/media/aa735eef-47c8-46a6-a003-8536ac9bc2d0/public
      type: video
    - title: Implementing <code>e:eval</code>
      url: https://echo360.org/media/19ac3ecb-a533-483f-87a6-bb0d76901911/public
      type: video
################################################################################
  - module: Mutable lambda calculus
  - lecture: "Language λ<sub>F</sub>: adding definitions incorrectly"
    date: We, Mar 25
    attachments:
    - title: Overview
      url: https://echo360.org/media/29b4275c-4ad2-43fc-80d8-d7b7b2d9cbaa/public
      type: video
    - title: Inductive definitions
      url: https://echo360.org/media/d2d0fd45-80f5-4246-b127-bbb3cfa3299e/public
      type: video
    - title: Syntax
      url: https://echo360.org/media/5cbd64c5-8c4c-4f0d-a7ad-26d8265abf0e/public
      type: video
    - title: Semantics
      url: https://echo360.org/media/91491fc1-c090-4a9e-b86d-67a09555159c/public
      type: video
    - title: Example 1
      url: https://echo360.org/media/4caf81cc-6770-4192-ab9e-3a63a1ef4878/public
      type: video
    - title: Example 2
      url: https://echo360.org/media/2c2c880e-d15f-494c-9cce-0822f28a185a/public
      type: video
  - lecture: Implementing λ<sub>F</sub>
    date: Fr, Mar 27
    attachments:
    - title: How do we represent mutability?
      url: https://echo360.org/media/30ed5564-c608-42e4-a434-fc51d8191700/public
      type: video
    - title: The heap API
      url: https://echo360.org/media/3f55f6f8-c0db-4463-9dc8-da19cb19043e/public
      type: video
    - title: Heap API usage
      url: https://echo360.org/media/0baaf736-186c-48bb-bde5-772ee978cedb/public
      type: video
    - title: Code review Heap API
      url: https://echo360.org/media/dbb499bd-38d0-4196-817f-c411250a9faa/public
      type: video
    - title: Contracts
      url: https://echo360.org/media/2600a04f-5a2b-4c1d-bb24-28cc8cd2bd6e/public
      type: video
  - lecture: "Language λ<sub>D</sub>: adding definitions correctly"
    date: Mo, Mar 30
    attachments:
    - title: Overview
      url: https://echo360.org/media/78f38625-ff7c-4cd1-8423-284b00379a9e/public
      type: video
    - title: Lambda-D
      url: https://echo360.org/media/87497cdf-aa0b-4134-87c9-3068b1a8f2f2/public
      type: video
    - title:  Operations on environments
      url: https://echo360.org/media/9d8e2e46-3e89-461d-ae7c-9c7a83cc1cac/public
      type: video
    - title: Making heap operations explicit
      url: https://echo360.org/media/7322ad2a-9941-4229-8834-bbe602f8ca60/public
      type: video
    - title: Examples
      url: https://echo360.org/media/39e27058-6f28-4d8b-8993-f210287ebe96/public
      type: video
    - title: QA session
      url: lecture23-qa.zip
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
  - lecture: Mark and sweep; sets; refactoring evaluation
    date: We, Apr  8
  - lecture: Effectful operations
    date: Fr, Apr 10
  - lecture: Refactoring errors; monads
    date: Mo, Apr 13
  - lecture: Type-directed monads; dynamic binding
    date: We, Apr 15
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