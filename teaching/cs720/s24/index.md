---
author: Tiago Cogumbreiro
semester: Spring 2024
title: "CS 720: Logical Foundations in Computer Science"
layout: single
exercises_ext: .v
data: 
  - lecture: Introduction
    chapters: [Preface, Basics]
    module:
      chapters: [Basics]
      hw: 1
    volume: lf
    published: true
  - lecture: Functional programming
    chapters: [Basics]
    published: true

  - module:
      chapters: [Induction]
      hw: 2
    lecture:  Proofs by Induction
    chapters: [Induction]
    published: true

  - lab: true
    lecture: Lab
    skip_slides: true
    published: true

  - module:
      chapters: [Lists, Poly]
      hw: 3
    lecture: Polymorphism
    chapters: [Lists, Poly]
    published: true

  - lecture: Tactics
    chapters: [Tactics]
    published: true
  - module:
      chapters: [Tactics]
      hw: 4
    lecture: Tactics
    chapters: [Tactics]
  
  - lecture: Defining logic connectives
    chapters: [Logic]
  - module:
      chapters: [Logic,IndProp,]
      hw: 4
    lecture: Defining logic connectives
    chapters: [Logic]

  - lecture: Inductive propositions
    chapters: [IndProp, ProofObjects]
  - module:
      chapters: [IndProp, ProofObjects]
      hw: 4
    lecture: Proof objects
    chapters: [IndProp, ProofObjects]

  - lecture: Lab
    skip_slides: true
    lab: true

  - module:
      chapters: [Maps, Imp, ImpParser, ImpCEvalFun, Auto]
      hw: 5
    lecture: Imperative languages
    hw: 4 #Logic, IndProp
    chapters: [Maps, Imp, ImpParser, ImpCEvalFun]
  - lecture: 	More automation
    chapters: [Auto]
    skip_exercises: true
################################################################################
    # Block 5
  - module:
      chapters: [Equiv]
      hw: 6
    #module: Programming Language Foundations
    volume: plf
    hw: 5 #Imp
    skip_exercises: true
    lecture: Program equivalence
    chapters: [Equiv]
  - lecture: Lab
    lab: true
    skip_slides: true

  - module:
      chapters: [Hoare, Hoare2]
      hw: 7
    lecture: Hoare Logic
    chapters: [Hoare]
  - lecture: Hoare Logic (continued)
    hw: 6 #Equiv
    chapters: [Hoare2]

  - module:
      chapters: [Smallstep]
      hw: 8
    lecture: Small-step operational semantics
    skip_exercises: true
    chapters: [Smallstep]
  - lecture: Lab
    lab: true
    skip_slides: true

  - module:
      chapters: [Types, Stlc]
      hw: 9
    lecture: Type systems
    hw: 7 #Hoare and HW8 Smallstep
    skip_exercises: true
    chapters: [Types]
  - lecture: Functional languages
    chapters: [Stlc]

  - module:
      chapters: [StlcProp]
      hw: 9
    lecture: Properties of the STLC # HW19
    chapters: [StlcProp]
  - lecture: Lab
    lab: true
    skip_slides: true
    hw: 9 #Types

  - module:
      chapters: [MoreStlc, Typechecking, Sub]
      hw: 9
    lecture: How to verify?
    chapters: [MoreStlc, Typechecking]
  - lecture: Lab
    lab: true
    #hw: 10 #Stlc, StlcProp
    chapters: [Sub]

  - module:
      title: "Presentations"
    lecture: Lab
    lab: true
  - lecture: Lab
    skip_slides: true
    lab: true

  - module:
      title: "Presentations"
    lecture: Lab
    lab: true
    hw: 11 #Proj
  # - lecture: Subtyping
  #   chapters: [Sub]
  # - lecture: Mutable references
  #   chapters: [References] # HW12
  # - lecture: Pres 15, Pres 16, Pres 17, Pres 18
  #   lab: true
  # - lecture: Pres 19, Pres 20, Pres 21, Pres 22
  #   lab: true

calendar:
- date: Tu, Jan 23
- date: Th, Jan 25

- date: Tu, Jan 30
- date: Th, Feb 1

- date: Tu, Feb 6
- date: Th, Feb 8

- date: Tu, Feb 13
- date: Th, Feb 15
  closure: true

- date: Tu, Feb 20
- date: Th, Feb 22

- date: Tu, Feb 27
- date: Th, Feb 29

- date: Tu, Mar 5
- date: Th, Mar 7

- date: Tu, Mar 12
  closure: true
- date: Th, Mar 14
  closure: true

- date: Tu, Mar 19
- date: Th, Mar 21

- date: Tu, Mar 26
- date: Th, Mar 28

- date: Tu, Apr 2
- date: Th, Apr 4

- date: Tu, Apr 9
- date: Th, Apr 11

- date: Tu, Apr 16
- date: Th, Apr 18

- date: Tu, Apr 23
- date: Th, Apr 25

- date: Tu, Apr 30
- date: Th, May 2

- date: Tu, May 7
#- date: Th, May 11
---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

# Course information

* **Location:** (W01-0012) Room 12, 1<sup>st</sup> floor, Wheatley
* **Schedule:** 11:00am to 12:15pm on Tuesday, Thursday
* **Archives:** [**Spring '22**](../s22/), [**Fall '18**](../f18/)
* [Textbook: Volume 1](https://softwarefoundations.cis.upenn.edu/lf-current/lf.tgz)
* [Textbook: Valume 2](https://softwarefoundations.cis.upenn.edu/plf-current/plf.tgz)
# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
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
  {% if r.volume %}
    {% assign vol = r.volume %}
  {% endif %}

<tr>
  <td colspan="4" style="background: #e9f3fc; text-align: center;"><b>Week {{ m_num }}:</b>
  {% if r.module.chapters %}Reading material:
  {% for x in r.module.chapters %}
  [<a href="https://softwarefoundations.cis.upenn.edu/{{ vol }}-current/{{ x }}.html">{{x}}</a>]
  {% endfor %}{% else %}{{ r.module.title }}{% endif %}
  {% if r.module.hw %} | HW{{ r.module.hw }}{% endif %} 
  </td>
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
    {% capture title %}{{ r.lecture }}{%- endcapture -%}
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
