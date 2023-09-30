---
author: Tiago Cogumbreiro
semester: Fall 2023
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .zip

data:
  - module: Basic Functional Programming
    lecture: Course info, arithmetic in Racket, evaluation
    published: true
  - lecture: Branching and function definitions
    video: https://echo360.org/public/media/b176611d-f92a-4343-8ffc-50b2faeb01b6
  - lecture: Lists and code serialization
    video: https://echo360.org/public/media/03bb81ef-1012-49d7-bf93-ae8fbfa51db9
################################################################################
    # 4, 5, 6
  - module: Advanced Functional Programming 
    lecture: Recursion, nested definitions
    video: https://echo360.org/public/media/3a1b403e-477d-4999-a0d3-baee57704630
  - lecture: Modules, structs, (map) updating lists
    video: https://echo360.org/public/media/8a08499b-7e1a-479a-9b60-363a0f51e0f9
  - lecture: Functions as data-structures, currying
    video: https://echo360.org/public/media/34e7f999-b13b-4efa-8b54-2ee30191d0fc
################################################################################
    # 7, 8, 9
  - module: Optimized Functional Programming
    lecture: foldr, looping first-to-last
    video: https://echo360.org/public/media/ce95ec91-7e57-4ed6-a278-983178196433
  - lecture: foldl, looping last-to-first
  - lecture: Homework help; tail-recursion
################################################################################
  - module: Lazy evaluation
    lecture: "TypedRacket, thunks, and promises"
  - lecture: "Infinite streams"
  - lecture: Finite streams, evaluating expressions
################################################################################
  - module: Implementing function calls
    lecture: "Language λ<sub>S</sub>: slow function calls"
    skip_exercises: true
  - lecture: "Language λ<sub>E</sub>: fast function calls"
    skip_exercises: true
  - lecture: Exercises
    skip_exercises: true

################################################################################
  - module: Implementing Racket's define
    lecture: "Specifying λ<sub>D</sub>"
  - lecture: Implementing λ<sub>D</sub>
    skip_exercises: true
  - lecture: "Exercises"
    skip_exercises: true
################################################################################
  - module: Monads and side effects
    lecture: Garbage collection
    skip_exercises: true
  - lecture: The state monad
  - lecture: Loops and error monad
  
################################################################################
  - module: Abstraction
    lecture: Monadic error; Monadic continuations
  - lecture: Parameters; Generic methods
  - lecture: Macros

################################################################################
  - module: Object Oriented Programming
    lecture: LambdaJS
    skip_exercises: true
  - lecture: JavaScript method and class inheritance
    skip_exercises: true
  - lecture: Conclusion
    skip_exercises: true
  - lecture: QA
  - lecture: QA

calendar:
- date: We, Sept 6

- date: Mo, Sept 11
- date: We, Sept 13

- date: Mo, Sept 18
- date: We, Sept 20

- date: Mo, Sept 25
- date: We, Sept 27

- date: Mo, Oct 2
- date: We, Oct 4

- date: Mo, Oct 9
  closure: true
- date: We, Oct 11

- date: Mo, Oct 16
- date: We, Oct 18

- date: Mo, Oct 23
- date: We, Oct 25

- date: Mo, Oct 30
- date: We, Nov 1

- date: Mo, Nov 6
- date: We, Nov 8

- date: Mo, Nov 13
- date: We, Nov 15

- date: Mo, Nov 20
- date: We, Nov 22

- date: Mo, Nov 27
- date: We, Nov 29

- date: Mo, Dec 4
- date: We, Dec 6

- date: Mo, Dec 11
- date: We, Dec 13

#- date: Mo, Dec 2
#- date: We, Dec 4

#- date: Mo, Dec 9

---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

**Past editions:** 
  [**Spring '23**](../s23),
  [**Fall '22**](../f22/),
  [**Spring '21**](../s21/),
  [**Spring '20**](../s20/),
  [**Spring '19**](../s19/)

# Course information
* **Location:** University Hall, Y02-2120
* **Schedule:** Monday/Wednesday 5:30PM - 6:45PM

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office hours:** {{ site.office.hours }}


## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.

{% assign l_num = 0 %}
{% assign m_num = 1 %}
{% assign idx = 0 %}
{% assign vol = "" %}
<table>
  <thead>
    <tr>
      <th>Date</th>
      <th>#</th>
      <th>Lecture</th>
      <th>Download</th>
    </tr>
  </thead>
  <tbody>

{% for d in page.calendar %}

{% if d.closure %}
<tr>
  <td class="has-text-grey-light">{{d.date}}</td>
  <td></td>
  <td class="has-text-grey-light">(School closure)</td>
  <td></td>
</tr>
{% else %}
  {% assign r = page.data[idx] %}
  {% assign idx = idx | plus: 1 %}

{% if r.module %}
    {% assign vol = r.vol %}
<tr>
  <td colspan="4" style="background: #e9f3fc; text-align: center;"><b><span class="has-text-grey-light">&#x1F659;</span> {{m_num}}. {{ r.module }} <span class="has-text-grey-light">&#x1F65A;</span></b></td>
  {% assign m_num = m_num | plus: 1 %}
</tr>
{% endif %}

<tr>

  {% if r.published %}
    {% assign is_pub = true %}
  {% elsif r.video %}
    {% assign is_pub = true %}
  {% elsif r.attachments %}
    {% assign is_pub = true %}
  {% else %}
    {% assign is_pub = false %}
  {% endif %}
  {% unless r.skip_slides %}
  {% assign l_num = l_num | plus: 1 %}
  {% endunless %}
  {% capture num %}{% if l_num < 10 %}0{% endif %}{{ l_num }}{% endcapture %}
  <td title="Date">{{ d.date }}</td>
  {% if r.skip_slides %}
  <td title="Skipped lecture number">
  —
  </td>
  {% else %}
  <td title="Lecture number">
    {{ num }}
  </td>
  {% endif %}
  
  <td {% if r.lab %}style="background: #fefede;"{% endif %}>
    {% capture title %}{{ r.lecture }}
    {%- if r.hw %} <b>HW{{ r.hw }} due!</b>{%- endif %}
    {%- endcapture -%}
    {{ title }}
    {% if is_pub and r.skip_slides %}
        {% if r.skip_slides %} <i>(no slides)</i>{% endif %}
    {% endif %}
  </td>
  <td>
    {% if is_pub %}
      {% capture h_url %}lecture{{ num }}.html{% endcapture %}

      {% if r.skip_slides %}{% assign s_url = nil %}{% else %}
        {% capture s_url %}lecture{{ num }}.pdf{% endcapture %}
      {% endif %}

      {% if r.skip_exercises %}
        {% assign f_url = nil %}
      {% else %}
        {% capture f_url %}lecture{{ num }}{{ page.exercises_ext }}{% endcapture %}
      {% endif %}

      <span class="buttons has-addons">
      {% include button.html url=h_url title="Download lecture slides (HTML)" icon="download" %}
      {% include button.html url=s_url title="Download lecture slides (PDF)" icon="book" %}
      {% include button.html url=r.video icon="file-video" title="Video recording" %}
      {% include button.html url=f_url icon="box" title="Download lecture exercises" %}
      </span>
    {% endif %}
  </td>
</tr>
{% endif %}
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
