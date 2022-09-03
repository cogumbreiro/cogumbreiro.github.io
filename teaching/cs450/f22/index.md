---
author: Tiago Cogumbreiro
semester: Fall 2022
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .zip

data:
  - module: Basic Functional Programming
    lecture: Course info, arithmetic in Racket, evaluation
  - lecture: Branching and function definitions
  - lecture: Pairs, lists, user structures, and quoting
################################################################################
    # 4, 5, 6, 7
  - module: Advanced Functional Programming 
    lecture: Nested definitions, tail calls
  - lecture: Activation frames, modules, structs, first-class funcs
  - lecture: Implementing AST's, currying, exists
  - lecture: Filter, append, foldr

################################################################################
  - module: Lazy evaluation
    lecture: "Delayed evaluation"
  - lecture: "Streams / Evaluating expressions"

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
  - lecture: Exceptions
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
  - lecture: The essence of JavaScript
  - lecture: QA

calendar:
- date: Mo, Sep 5
  closure: true
- date: We, Sep 7

- date: Mo, Sep 12
- date: We, Sep 14

- date: Mo, Sep 19
- date: We, Sep 21

- date: Mo, Sep 26
- date: We, Sep 28

- date: Mo, Oct 3
- date: We, Oct 5

- date: Mo, Oct 10
  closure: true
- date: We, Oct 12

- date: Mo, Oct 17
- date: We, Oct 19

- date: Mo, Oct 24
- date: We, Oct 26

- date: Mo, Oct 31
- date: We, Nov 2

- date: Mo, Nov 7
- date: We, Nov 9

- date: Mo, Nov 14
- date: We, Nov 16

- date: Mo, Nov 21
- date: We, Nov 23

- date: Mo, Nov 28
- date: We, Nov 30

- date: Mo, Dec 5
- date: We, Dec 7

- date: Mo, Dec 12
- date: We, Dec 14

---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

**Past editions:** [**Spring '21**](../s21/), [**Spring '20**](../s20/), [**Spring '19**](../s19/)

# Course information
* **Location:** Room 2300, 2<sup>nd</sup> floor, University Hall (Y02-2300)
* **Schedule:** Monday, Wednesday @ 5:30PM - 6:45PM

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

To be announced...

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
  <td colspan="4" style="background: #e9f3fc; text-align: center;"><b>&#1421; {{ r.module }} &#1421;</b></td>
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
      {% comment %}
      {% include button.html url=r.video icon="file-video" title="Video recording" %}
      {% endcomment %}
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