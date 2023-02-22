---
author: Tiago Cogumbreiro
semester: Spring 2023
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .zip

data:
  - module: Basic Functional Programming
    lecture: Course info, arithmetic in Racket, evaluation
    published: true
  - lecture: Branching and function definitions
    published: true
  - lecture: Lists and code serialization
    published: true
################################################################################
    # 4, 5, 6
  - module: Advanced Functional Programming 
    lecture: Recursion, nested definitions
    video: https://echo360.org/public/media/967f8e5c-5808-4e26-bb87-63cff58190b5
  - lecture: Modules, structs, updating lists
    video: https://echo360.org/public/media/35fa8d24-74b8-4293-a73a-8cf6ec139ee6
  - lecture: Map, functions as data-structures, currying
    video: https://echo360.org/public/media/821e701c-4abc-4e8f-8741-414c1f99bbb5
################################################################################
    # 7, 8, 9
  - module: Optimized Functional Programming
    lecture: foldr, looping first-to-last
    video: https://echo360.org/public/media/21fe47b3-9e36-4dd7-94fa-8365c93f5007
  - lecture: foldl, looping last-to-first
    video: https://echo360.org/public/media/f734dba6-99bb-411b-8fa9-6ae26db8aa76
  - lecture: Homework help; tail-recursion
    video: https://echo360.org/public/media/07be33d6-8efe-4084-bad0-f44267724923
    skip_exercises: true
################################################################################
  - module: Lazy evaluation
    lecture: "Delayed evaluation"
  - lecture: "Streams / Evaluating expressions"
  - lecture: Exercises
################################################################################
  - module: Formal methods; Lambda calculus
    lecture: "Language λ<sub>S</sub>: slow function calls"
  - lecture: Lexical/dynamic scoping, function closures
  - lecture: "Language λ<sub>E</sub>: fast function calls"

################################################################################
  - module: Mutable lambda calculus
    lecture: "Language λ<sub>F</sub>: adding definitions incorrectly"
  - lecture: Implementing λ<sub>F</sub>
  - lecture: "Language λ<sub>D</sub>: adding definitions correctly"
################################################################################
  - module: Monads and side effects
    lecture: Garbage collection
  - lecture: Effectful operations
  - lecture: Monadic error/list; generics; parameters
  - lecture: Monadic continuations
  
################################################################################
  - module: Abstraction
    lecture: Pattern-matching
  - lecture: Generic methods
  - lecture: Macros

################################################################################
  - module: Object Oriented Programming
    lecture: LambdaJS
  - lecture: JavaScript method and class inheritance
  - lecture: Translating SimpleJS to LambdaJS
  - lecture: QA
  - lecture: QA

calendar:
- date: Tu, Jan 24
- date: Th, Jan 26

- date: Tu, Jan 31
- date: Th, Feb 2

- date: Tu, Feb 7
- date: Th, Feb 9

- date: Tu, Feb 14
- date: Th, Feb 16

- date: Tu, Feb 21
- date: Th, Feb 23

- date: Tu, Feb 28
- date: Th, Mar 2

- date: Tu, Mar 7
- date: Th, Mar 9

- date: Tu, Mar 14
  closure: true
- date: Th, Mar 16
  closure: true

- date: Tu, Mar 21
- date: Th, Mar 23

- date: Tu, Mar 28
- date: Th, Mar 30

- date: Tu, Apr 4
- date: Th, Apr 6

- date: Tu, Apr 11
- date: Th, Apr 13

- date: Tu, Apr 18
- date: Th, Apr 20

- date: Tu, Apr 25
- date: Th, Apr 27

- date: Tu, May 2
- date: Th, May 4

- date: Tu, May 9

---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

**Past editions:** [**Fall '22**](../f22/), [**Spring '21**](../s21/), [**Spring '20**](../s20/), [**Spring '19**](../s19/)

# Course information
* **Location:** (W01-0004) Room 0004, 1<sup>st</sup> floor, Wheatley
* **Schedule:** Tuesday/Thursday 11:00AM - 12:15PM

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
