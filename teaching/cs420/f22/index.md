---
author: Tiago Cogumbreiro
semester: Fall 2022
title: "CS 420: Introduction to the Theory of Computation"
layout: single
exercises_ext: .v
data:
  - module: Logical Foundations
    lecture: Course overview; Coq intro
  - lecture: Pattern matching; reflexivity
  - lecture: Proofs by induction
  - lecture: Manipulating theorems; data-structures
  - lecture: Polymorphism; Constructor injectivity, explosion principle
  - lecture: Logical Connectives
  - lecture: Mini-test 1 recap
################################################################################
  - module: Regular Languages
    lecture: Formal languages
  - lecture: Kleene star, language equivalence
  - lecture: Recap & exercises
  - lecture: Regular expressions
  - lecture: REGEX & Nondeterministic Finite Automata
  - lecture: NFA ⇔ REGEX
  - lecture: Deterministic Finite Automata; NFA ⇔ DFA
################################################################################
  - module: Context-free Languages
    lecture: Pumping lemma; Non-regular languages
  - lecture: Context-free grammars
  - lecture: Pushdown Automata
  - lecture: PDA ⇔ CFG
  - lecture: Pumping lemma; Non-context-free Languages; Turing Machines
  - lecture: Variants of Turing Machines
  - lecture: Acceptance, emptiness and equality tests
################################################################################
  - module: Decidability
    lecture: Undecidability
  - lecture: QA session
  - lecture: Undecidable problems
  - lecture: Undecidable problems
  - lecture: Mapping reducibility
  - lecture: QA Session
  - lecture: QA Session

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

**Past editions:** [**Fall '21**](../f21/), [**Spring '20**](../s20/), [**Fall '19**](../f19/)

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

# Course information

* **Location:** (Y01-1350) Room 1350, 1<sup>st</sup> floor, University Hall
* **Schedule:** 4:00pm to 5:15pm on Monday, Wednesday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

To be announced...

# Resources

* [CS420 Supplementary Material: The Turing library (Coq)](https://gitlab.com/cogumbreiro/turing)
* [CS420 Supplementary Material: NFA/DFA/REGEX algorithms (Python)](https://gitlab.com/cogumbreiro/karakuri/)
* [Logic Foundations exercises](https://softwarefoundations.cis.upenn.edu/lf-current/lf.tgz)

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