---
author: Tiago Cogumbreiro
semester: Fall 2024
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .rkt
previous_year: ../f23

data:
  - module: Basic Functional Programming
    lecture: Course info, arithmetic in Racket, evaluation
    published: true
  - lecture: Branching and function definitions
    video: https://echo360.org/public/media/ff477918-3668-4ccd-8814-54c0edfd3ae7
  - lecture: Lists and code serialization
    video: https://echo360.org/public/media/ef8157f2-4722-4a74-82da-81078eab1152
################################################################################
    # 4, 5, 6
  - module: Advanced Functional Programming 
    lecture: Recursion, nested definitions
    video: https://echo360.org/public/media/13333e8b-f8ff-490e-ac30-8aedc0dcce5e
  - lecture: Modules, structs, (map) updating lists
    video: https://echo360.org/public/media/1f57347b-f26c-4cea-8022-04bbd27cdf32
  - lecture: Functions as data-structures, currying
    video: https://echo360.org/public/media/ab55368d-afe6-4a06-8295-cc2719f58da8
################################################################################
    # 7, 8, 9
  - module: Optimized Functional Programming
    lecture: foldr, looping first-to-last
    #video: https://echo360.org/public/media/21fe47b3-9e36-4dd7-94fa-8365c93f5007
  - lecture: foldl, looping last-to-first
    #video: https://echo360.org/public/media/f734dba6-99bb-411b-8fa9-6ae26db8aa76
  - lecture: Homework help; tail-recursion
    #video: https://echo360.org/public/media/07be33d6-8efe-4084-bad0-f44267724923
    #skip_exercises: true
################################################################################
  - module: Lazy evaluation
    lecture: "TypedRacket, thunks, and promises"
    #video: https://echo360.org/public/media/fc39936d-baec-40ab-8dd0-485b2366c9ed
  - lecture: "Infinite streams"
    #video: https://echo360.org/public/media/1417e82f-15b8-431c-9607-fcaa96cc3fe4
  - lecture: Finite streams, evaluating expressions
    #video: https://echo360.org/public/media/b84930c3-6199-4d81-9757-134d0a768d41
################################################################################
  - module: Implementing function calls
    lecture: "Language λ<sub>S</sub>: slow function calls"
    #video: https://echo360.org/public/media/29c71ccc-d21a-407f-abeb-f25e12f5e07a
    #skip_exercises: true
  - lecture: "Language λ<sub>E</sub>: fast function calls"
    #skip_exercises: true
    #video: https://echo360.org/public/media/5e67149e-c375-4071-b41e-054b0eaf94da
  - lecture: Exercises
    #skip_exercises: true
    #video: https://echo360.org/public/media/08ee40ee-7c9e-4785-96fd-2c724d01a47b

################################################################################
  - module: Implementing Racket's define
    lecture: "Specifying λ<sub>D</sub>"
    #video: https://echo360.org/public/media/a76560ed-66ac-4667-a3e5-14233a60df3e
  - lecture: Implementing λ<sub>D</sub>
    #video: https://echo360.org/public/media/48b4a11c-d82a-40c0-81d1-4e005195d88e
    #skip_exercises: true
  - lecture: "Exercises"
    #skip_exercises: true
    #video: https://echo360.org/public/media/49d4a7c0-94bc-4d2c-8c56-c662b6e6601b
################################################################################
  - module: Monads and side effects
    lecture: Garbage collection
    #video: https://echo360.org/public/media/e90532b0-2fd2-4336-8879-1127ebb24d9f
    #skip_exercises: true
  - lecture: The state monad
    #video: https://echo360.org/public/media/df514883-7806-464e-a421-02d951088baa
  - lecture: Loops and error monad
    #video: https://echo360.org/public/media/e7c43caf-8a43-457f-bffd-59dae44d9ba9
  
################################################################################
  - module: Abstraction
    lecture: Monadic error; Monadic continuations
    #video: https://echo360.org/public/media/eaf1f31f-ebfe-4a87-a0f6-d8e51ec04eea
  - lecture: Parameters; Generic methods
    #video: https://echo360.org/public/media/c75d6b87-e47f-49e6-805b-0da76bb93c59
  - lecture: Macros
    #video: https://echo360.org/public/media/c58ba9bd-2352-41cc-a23f-682c09013ed5

################################################################################
  - module: Object Oriented Programming
    lecture: LambdaJS
    #skip_exercises: true
    #video: https://echo360.org/public/media/1a8580e1-3a88-4adf-9fd9-d8023a13fa41
  - lecture: JavaScript method and class inheritance
    #video: https://echo360.org/public/media/3fc02e34-d393-4292-a481-be4caa56222b
    #skip_exercises: true
  - lecture: Conclusion
    #video: https://echo360.org/public/media/cd5b4b04-f60d-4f59-b759-92a86a1f5624
    #skip_exercises: true
  - lecture: QA
  - lecture: QA

calendar:
- date: We, Sep 4

- date: Mo, Sep 9
- date: We, Sep 11

- date: Mo, Sep 16
- date: We, Sep 18

- date: Mo, Sep 23
- date: We, Sep 25

- date: Mo, Sep 30
- date: We, Oct 2

- date: Mo, Oct 7
- date: We, Oct 9

- date: Mo, Oct 14
  closure: true
- date: We, Oct 16

- date: Mo, Oct 21
- date: We, Oct 23

- date: Mo, Oct 28
- date: We, Oct 30

- date: Mo, Nov 4
- date: We, Nov 6

- date: Mo, Nov 11
  closure: true
- date: We, Nov 13

- date: Mo, Nov 18
- date: We, Nov 20

- date: Mo, Nov 25
- date: We, Nov 27

- date: Mo, Dec 2
- date: We, Dec 5

- date: Mo, Dec 9
- date: We, Dec 11


---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

**Past editions:**
[**Fall '23**](../f23/),
[**Spring '23**](../s23/),
[**Fall '22**](../f22/),
[**Spring '21**](../s21/),
[**Spring '20**](../s20/),
[**Spring '19**](../s19/)

# Course information
* **Location:** (W01-0005) Room 0005, 1<sup>st</sup> floor, Wheatley
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
    {% else %}
      {% capture h_url %}{{ page.previous_year }}/lecture{{ num }}.html{% endcapture %}
      {% capture s_url %}{{ page.previous_year }}/lecture{{ num }}.pdf{% endcapture %}
      <span class="buttons has-addons">
      {% include button.html url=h_url title="Download lecture slides (HTML)" icon="download" %}
      {% include button.html url=s_url title="Download lecture slides (PDF)" icon="book" %}
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
