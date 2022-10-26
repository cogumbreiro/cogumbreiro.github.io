---
author: Tiago Cogumbreiro
semester: Fall 2022
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: -exercises.zip

data:
  - module: Basic Functional Programming
    lecture: Course info, arithmetic in Racket, evaluation
    video: https://echo360.org/public/media/058b58dd-bc8a-4905-aa6a-f7072efff421
  - lecture: Branching and function definitions
    video: https://liveumb-my.sharepoint.com/:v:/g/personal/tiago_cogumbreiro_umb_edu/Ed3aY1v_IZJItxsEmeWWb6cBuKXLGvBZv-30AMtfzSc26w?e=uCcEui
  - lecture: Pairs, lists, user structures, and quoting
    video: https://echo360.org/public/media/7be049ac-c63d-4364-b45b-29a91ca29367
################################################################################
    # 4, 5, 6, 7
  - module: Advanced Functional Programming 
    lecture: Nested definitions, tail calls
    video: https://echo360.org/public/media/bc4dbaf7-1a90-4334-9417-1d1a037b7c15
  - lecture: Activation frames, modules, structs, first-class funcs
    video: https://echo360.org/public/media/d1279ab6-08ea-4b10-84ad-2d9ca054d581
  - lecture: Implementing AST's, currying, exists
    video: https://echo360.org/public/media/4af750be-481d-450c-b6a0-6f399581b15c
  - lecture: Filter, append, foldr
    video: https://echo360.org/public/media/6f0e50ed-5edd-4ad8-b21e-8a7fb7145aa4
  - lecture: Reverse, join-strings, foldl, performance
    video: https://echo360.org/public/media/c6b796f0-6c5e-425f-b446-9c8d662c5a92
################################################################################
  - module: Lazy evaluation
    lecture: "Delayed evaluation"
    video: https://echo360.org/public/media/07377fdc-e323-477d-a9b7-0fb0a17028f8
  - lecture: "Streams / Evaluating expressions"
    video: https://echo360.org/public/media/c1c1eb01-7c1e-4e8e-82ef-7fdadfc00ad5
################################################################################
  - module: Formal methods; Lambda calculus
    lecture: "Language λ<sub>S</sub>: slow function calls"
    video: https://echo360.org/public/media/e1f66414-86c4-468b-b73b-5785cc990e77
  - lecture: Lexical/dynamic scoping, function closures
    video: https://echo360.org/public/media/cff8bd0f-f2dc-4c06-a218-5f42bc143213
  - lecture: "Language λ<sub>E</sub>: fast function calls"
    video: https://echo360.org/public/media/a553bbcb-8c29-431d-b50d-409f338b8937
    skip_exercises: true

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
* **Location:** (Y02-2300) Room 2300, 2<sup>nd</sup> floor, University Hall
* **Schedule:** Monday, Wednesday / 5:30PM - 6:45PM

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office hours:** {{ site.office.hours }}

# TA office hours (IN PERSON)

* **Dakai Tzou**, **office hours:** 7:00PM - 7:45PM, Monday and Wednesday @ Y02-2300 (where we have classes)
* **Paul Maynard**, **office hours:**  Monday, Wednesday at 3:00PM-4:00PM; Tuesday 11:00AM-12:00noon @ M03-0201-33 (SVL office)


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
