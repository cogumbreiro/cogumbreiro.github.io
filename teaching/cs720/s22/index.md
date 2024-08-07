---
author: Tiago Cogumbreiro
semester: Spring 2022
title: "CS 720: Logical Foundations in Computer Science"
layout: single
exercises_ext: .v
data: 
  - lecture: Introduction
    chapters: [Preface, Basics]
    module: Logical Foundations
    volume: lf
    published: true
  - lecture: Functional programming
    chapters: [Basics]
    published: true
  - lecture:  Induction
    chapters: [Induction]
    published: true
    hw: 1 Basics
  - lecture: Polymorphism
    published: true
    chapters: [Lists, Poly]
  - lecture: Lab
    skip_slides: true
    lab: true
    hw: 2 Induction, List
  - lecture: Tactics
    published: true
    chapters: [Tactics]
  - lecture: Tactics
    published: true
    chapters: [Tactics]
  - lecture: Lab
    skip_slides: true
    lab: true
  - lecture: Logic in Coq
    hw: 3 Poly, Tactics
    published: true
    chapters: [Logic]
  - lecture: Logic in Coq
    chapters: [Logic]
    published: true
  - lecture: Inductive propositions
    chapters: [IndProp, ProofObjects]
    published: true
  - lecture: Proof objects
    chapters: [IndProp, ProofObjects]
    published: true
  - lecture: Lab
    skip_slides: true
    lab: true
  - lecture: Imperative languages
    hw: 4 Logic, IndProp
    published: true
    chapters: [Maps, Imp, ImpParser, ImpCEvalFun]
  - lecture: 	More automation
    chapters: [Auto]
    published: true
    skip_exercises: true
################################################################################
    # Block 5
  - module: Programming Language Foundations
    volume: plf
    hw: 5 Imp
    published: true
    skip_exercises: true
    lecture: Program equivalence
    chapters: [Equiv]
  - lecture: Lab
    lab: true
    skip_slides: true
  - lecture: Hoare Logic
    chapters: [Hoare]
    published: true
  - lecture: Hoare Logic (continued)
    hw: 6 Equiv
    chapters: [Hoare2]
    published: true
  - lecture: Small-step operational semantics
    skip_exercises: true
    chapters: [Smallstep]
    published: true
  - lecture: Lab
    lab: true
    skip_slides: true
  - lecture: Type systems
    hw: 7 Hoare and HW8 Smallstep
    published: true
    skip_exercises: true
    chapters: [Types]
  - lecture: Functional languages
    chapters: [Stlc]
    published: true
  - lecture: Properties of the STLC # HW19
    chapters: [StlcProp]
    published: true
  - lecture: Lab
    lab: true
    skip_slides: true
    hw: 9 Types
  - lecture: How to verify?
    chapters: [MoreStlc, Typechecking]
    published: true
  - lecture: Lab
    lab: true
    hw: 10 Stlc, StlcProp
    chapters: [Sub]
  - lecture: Lab
    lab: true
    hw: 11 Proj
  # - lecture: Subtyping
  #   chapters: [Sub]
  # - lecture: Mutable references
  #   chapters: [References] # HW12
  # - lecture: Pres 15, Pres 16, Pres 17, Pres 18
  #   lab: true
  # - lecture: Pres 19, Pres 20, Pres 21, Pres 22
  #   lab: true

calendar:
- date: Mo, Jan 24
- date: We, Jan 26

- date: Mo, Jan 31
- date: We, Feb 2

- date: Mo, Feb 7
- date: We, Feb 9

- date: Mo, Feb 14
- date: We, Feb 16

- date: Mo, Feb 21
  closure: true
- date: We, Feb 23

- date: Mo, Feb 28
- date: We, Mar 2

- date: Mo, Mar 7
- date: We, Mar 9

- date: Mo, Mar 14
  closure: true
- date: We, Mar 16
  closure: true

- date: Mo, Mar 21
- date: We, Mar 23

- date: Mo, Mar 28
- date: We, Mar 30

- date: Mo, Apr 4
- date: We, Apr 6

- date: Mo, Apr 11
- date: We, Apr 13

- date: Mo, Apr 18
  closure: true
- date: We, Apr 20

- date: Mo, Apr 25
- date: We, Apr 27

- date: Mo, May 2
- date: We, May 4

- date: Mo, May 9
- date: Mo, May 11
---

**Past editions:** [**Fall '18**](../f18/)

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

# Course information

* **Location:** (W01-0062) Room 62, 1<sup>st</sup> floor, Wheatley
* **Schedule:** 5:30pm to 6:45pm on Monday, Wednesday

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
    {% assign vol = r.vol %}
<tr>
  <td colspan="4" style="background: #e9f3fc; text-align: center;"><b>&#1421; <a href="https://softwarefoundations.cis.upenn.edu/{{r.volume}}-current/{{r.volume}}.tgz">{{ r.module }} (click to download)</a> &#1421;</b></td>
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
