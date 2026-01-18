---
author: Tiago Cogumbreiro
semester: Spring 2026
title: "CS 720: Logical Foundations in Computer Science"
layout: single
exercises_ext: .v
previous_year: ../s24

data:
  # Module 1
  - module: Fundamentals
    lecture: Introduction
    #chapters: [Preface, Basics]
    #volume: lf
    #published: true
    slides_from: s24
  - lecture: Functional programming
    chapters: [Basics]
    slides_from: s24  
  # Module 2
  - module: Introduction to Induction
    lecture:  Proofs by Induction
    slides_from: s24
    chapters: [Induction]
    #published: true
  - lecture: QA
  # Module 3
  - module: Generalized Induction
    lecture: Polymorphism
    chapters: [Lists, Poly]
    published: true
  - lecture: Tactics
    chapters: [Tactics]
    published: true
  - module: Inductive Propositions
    lecture: Tactics
    published: true
  # Module 4
  - lecture: Defining logic connectives
    chapters: [Logic]
    published: true
  - chapters: [Logic, IndProp]
    published: true
    lecture: Defining logic connectives
    chapters: [Logic]
  - lecture: Inductive propositions
    chapters: [IndProp, ProofObjects]
    published: true
  - lecture: Proof objects
    chapters: [IndProp, ProofObjects]
    published: true
  - module: Big-step Operational Semantics
    chapters: [Maps, Imp, ImpParser, ImpCEvalFun, Auto]
    lecture: Imperative languages
    #hw: 4 #Logic, IndProp
    #chapters: [Maps, Imp, ImpParser, ImpCEvalFun]
    #published: true
  - lecture: More automation
    chapters: [Auto]
    published: true
  - lecture: Presentations
    skip_slides: true
    lab: true



################################################################################
    # Block 5
  - module: Program Equivalence
    #module: Programming Language Foundations
    volume: plf
    hw: 5 #Imp
    lecture: Program equivalence
    chapters: [Equiv]
    published: true
  - lecture: Lab
    lab: true
    skip_slides: true
  - lecture: Presentations
    lab: true
    skip_slides: true

  - module: Hoare Logic
    lecture: Hoare Logic
    chapters: [Hoare]
    published: true
  - lecture: Hoare Logic (continued)
    hw: 6 #Equiv
    chapters: [Hoare2]
    published: true
    skip_exercises: true
  - lecture: Presentations
    skip_slides: true
    lab: true


# HW 
  - module: Small-step operational semantics
    lecture: Small-step operational semantics
    chapters: [Smallstep]
    published: true
    skip_exercises: true
  - lecture: Lab
    lab: true
  - lecture: Presentations
    lab: true
    hw: 11 #Proj
  ###################### HW9 ##########################
  - module: Type systems
    chapters: [Types, Stlc]
    #hw: 9
    lecture: Type systems
    #hw: 7 #Hoare and HW8 Smallstep
    chapters: [Types]
    published: true

  - lecture: Lab
    lab: true

  - lecture: Functional languages
    chapters: [Stlc]
    published: true

  - lecture: Properties of the STLC # HW19
    chapters: [StlcProp]
    published: true


  - chapters: [MoreStlc, Typechecking, Sub]
    hw: 9
    lecture: How to verify?
    chapters: [MoreStlc, Typechecking]
    published: true
  - lecture: Lab
    lab: true
    skip_slides: true
    hw: 9 #Types

  - lecture: Presentation
    lab: true
    #hw: 10 #Stlc, StlcProp
    chapters: [Sub]
    skip_slides: true

  - lecture: QA

calendar:
- date: Tue, Jan 27
- date: Thu, Jan 29
- date: Tue, Feb 3
- date: Thu, Feb 5
- date: Tue, Feb 10
- date: Thu, Feb 12
- date: Tue, Feb 17
- date: Thu, Feb 19
- date: Tue, Feb 24
- date: Thu, Feb 26
- date: Tue, Mar 3
- date: Thu, Mar 5
- date: Tue, Mar 10
- date: Thu, Mar 12
- date: Tue, Mar 17
  closure: true
- date: Thu, Mar 19
  closure: true
- date: Tue, Mar 24
- date: Thu, Mar 26
- date: Tue, Mar 31
- date: Thu, Apr 2
- date: Tue, Apr 7
- date: Thu, Apr 9
- date: Tue, Apr 14
- date: Thu, Apr 16
- date: Tue, Apr 21
- date: Thu, Apr 23
- date: Tue, Apr 28
- date: Thu, Apr 30
- date: Tue, May 5
- date: Thu, May 7
- date: Tue, May 12
course_info:
  location: W01-0062 (Wheatley)
  schedule: Tuesday/Thursday 12:30PM - 1:45PM
past_editions:
- name: Spring '24
  link: ../s24/
- name: Spring '22
  link: ../s22/
- name: Fall '18
  link: ../f18/
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

<!--
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
* [Textbook: Volume 2](https://softwarefoundations.cis.upenn.edu/plf-current/plf.tgz)
# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}
-->
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
