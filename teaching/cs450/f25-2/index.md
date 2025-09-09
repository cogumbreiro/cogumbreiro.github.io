---
author: Tiago Cogumbreiro
semester: Fall 2025
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .rkt
previous_year: ../f24

course_info:
  location: W01-0004 (Wheatley)
  schedule: Tuesday/Thursday 4:00PM - 5:15PM
past_editions:
- name: Fall '24
  link: ../f24/
- name: Fall '23
  link: ../f23/
- name: Spring '23
  link: ../s23/
- name: Fall '22
  link: ../f22/
- name: Spring '21
  link: ../s21/
- name: Spring '20
  link: ../s20/
- name: Spring '19
  link: ../s19/
data:
- module: Basic Functional Programming
  lecture: Course info, arithmetic in Racket, evaluation
  video: https://echo360.org/public/media/ef6cf8cf-d920-42fe-835b-deee58cba80e
  #published: true
  slides_from: f25-2
  last_updated: '2025-09-08'
- lecture: Branching and function definitions
  slides_from: f23
  video: https://echo360.org/public/media/8da0a241-1e3e-4e99-b918-16b93ddd10b9
  last_updated: '2025-09-08'
- lecture: Lists and code serialization
  slides_from: f25-1
  video: https://echo360.org/public/media/06583e7a-c801-4fa5-b23e-7c1246f2caf4
  last_updated: '2025-09-09'
- module: Advanced Functional Programming
  lecture: Recursion, nested definitions
  slides_from: f23
- lecture: Modules, structs, (map) updating lists
  slides_from: f23
- lecture: Functions as data-structures, currying
  slides_from: f23
- module: Optimized Functional Programming
  lecture: foldr, looping first-to-last
  slides_from: f23
- lecture: foldl, looping last-to-first
  slides_from: f23
- lecture: Homework help; tail-recursion
  #video: https://echo360.org/public/media/07be33d6-8efe-4084-bad0-f44267724923
  slides_from: f23
- module: Lazy evaluation
  lecture: "TypedRacket, thunks, and promises"
  slides_from: f23
- lecture: "Infinite streams"
  slides_from: f23
- lecture: Finite streams, evaluating expressions
  slides_from: f23
- module: Implementing function calls
  lecture: "Language λ<sub>S</sub>: slow function calls"
  #video: https://echo360.org/public/media/29c71ccc-d21a-407f-abeb-f25e12f5e07a
  slides_from: f23
- lecture: "Language λ<sub>E</sub>: fast function calls"
  slides_from: f23
- lecture: Exercises
  slides_from: f23
- module: Implementing Racket's define
  lecture: "Specifying λ<sub>D</sub>"
  slides_from: f23
- lecture: Implementing λ<sub>D</sub>
  #video: https://echo360.org/public/media/48b4a11c-d82a-40c0-81d1-4e005195d88e
  slides_from: f23
- lecture: "Exercises"
  slides_from: f23
- module: Monads and side effects
  lecture: Garbage collection
  #video: https://echo360.org/public/media/e90532b0-2fd2-4336-8879-1127ebb24d9f
  slides_from: f23
- lecture: The state monad
  #video: https://echo360.org/public/media/df514883-7806-464e-a421-02d951088baa
  slides_from: f23
- lecture: Loops and error monad
  #video: https://echo360.org/public/media/e7c43caf-8a43-457f-bffd-59dae44d9ba9
  slides_from: f23
- module: Abstraction
  lecture: Monadic error; Monadic continuations
  slides_from: f23
- lecture: Parameters; Generic methods
  slides_from: f23
- lecture: Macros
  slides_from: f23
- module: Object Oriented Programming
  lecture: LambdaJS
  slides_from: f23
- lecture: JavaScript method and class inheritance
  #video: https://echo360.org/public/media/3fc02e34-d393-4292-a481-be4caa56222b
  slides_from: f23
- lecture: Conclusion
  #video: https://echo360.org/public/media/cd5b4b04-f60d-4f59-b759-92a86a1f5624
  slides_from: f23
- lecture: QA
- lecture: QA

calendar:
- date: Tue, Sep 2
- date: Thu, Sep 4
- date: Tue, Sep 9
- date: Thu, Sep 11
- date: Tue, Sep 16
- date: Thu, Sep 18
- date: Tue, Sep 23
- date: Thu, Sep 25
- date: Tue, Sep 30
- date: Thu, Oct 2
- date: Tue, Oct 7
- date: Thu, Oct 9
- date: Tue, Oct 14
- date: Thu, Oct 16
- date: Tue, Oct 21
- date: Thu, Oct 23
- date: Tue, Oct 28
- date: Thu, Oct 30
- date: Tue, Nov 4
- date: Thu, Nov 6
- date: Tue, Nov 11
  closure: true
- date: Thu, Nov 13
- date: Tue, Nov 18
- date: Thu, Nov 20
- date: Tue, Nov 25
- date: Thu, Nov 27
  closure: true
- date: Tue, Dec 2
- date: Thu, Dec 4
- date: Tue, Dec 9
- date: Thu, Dec 11
section: '2'
---

<h1 class="has-text-centered">{{ page.title }}{% if page.section %} (Section {{ page.section }}){% endif %}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

**Past editions:**
{% for edition in page.past_editions -%}
[**{{ edition.name }}**]({{ edition.link }})
{%- unless forloop.last %}, {% endunless -%}
{% endfor %}

# Course information
* **Location:** {{ page.course_info.location }}
* **Schedule:** {{ page.course_info.schedule }}

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office hours:** {{ site.office.hours }}
* **Office location:** {{ site.office.location }}

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
  {% if r.slides_from %}
  {% assign l_num = l_num | plus: 1 %}
  {% endif %}
  {% capture num %}{% if l_num < 10 %}0{% endif %}{{ l_num }}{% endcapture %}
  <td title="Date">{{ d.date }}</td>
  {% if r.slides_from %}
  <td title="Lecture number">
    {{ num }}
  </td>
  {% else %}
  <td title="No lecture number">
  —
  </td>
  {% endif %}
  
  <td {% if r.lab %}style="background: #fefede;"{% endif %}>
    {% capture title %}{{ r.lecture }}
    {%- endcapture -%}
    {{ title }}
    {% unless r.slides_from %} <i>(no slides)</i>{% endunless %}
  </td>
  <td>
    <span class="buttons has-addons">
      {% unless r.skip_slides %}
        {% if r.slides_from %}
          {% capture h_url %}../{{ r.slides_from }}/lecture{{ num }}.html{% endcapture %}
          {% capture s_url %}../{{ r.slides_from }}/lecture{{ num }}.pdf{% endcapture %}
          {% include button.html url=h_url title="Download lecture slides (HTML)" icon="download" %}
          {% include button.html url=s_url title="Download lecture slides (PDF)" icon="book" %}
        {% endif %}
      {% endunless %}
      
      {% if r.video %}
        {% include button.html url=r.video icon="file-video" title="Video recording" %}
      {% endif %}
      
      {% if r.show_exercises %}
        {% capture f_url %}lecture{{ num }}{{ page.exercises_ext }}{% endcapture %}
        {% include button.html url=f_url icon="box" title="Download lecture exercises" %}
      {% endif %}
    </span>
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
