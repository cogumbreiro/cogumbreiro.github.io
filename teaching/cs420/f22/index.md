---
author: Tiago Cogumbreiro
semester: Fall 2022
title: "CS 420: Introduction to the Theory of Computation"
layout: single
exercises_ext: .v
data:
  - module: (HW1) Logical Foundations
    lecture: Course overview; Coq intro
    video: https://echo360.org/public/media/72b488d6-ad90-4aa1-89ba-330d7be76964
  - lecture: (HW1) Pattern matching; reflexivity
    video: https://liveumb-my.sharepoint.com/:v:/g/personal/tiago_cogumbreiro_umb_edu/EQ3rRWQ6m5FDvFc-G_R7DXgBWlDrLIpuX89eO3_yj9HNwQ
  - lecture: (HW1) Proofs by induction
    attachments:
    - title: Classroom recording (S21)
      url: https://echo360.org/media/f0ea8cb1-7fb8-43d9-9274-11d25c3cc3ed/public
      type: video

  - lecture: (HW1/HW2) Manipulating theorems; data-structures
    attachments:
    - title: Classroom recording (S21)
      url: https://echo360.org/media/4779b4aa-dd7f-4d4b-ab85-1d2e7d6cfd1b/public
      type: video

  - lecture: (HW2) Polymorphism; Constructor injectivity, explosion principle
    video: https://echo360.org/public/media/e08a7505-1be3-4490-adfb-9ac42e174163
  - lecture: (HW2) Logical Connectives
    video: https://echo360.org/public/media/1c7b85ec-082f-42a2-b18f-a0ece85bfa0c
  - lecture: (HW2) Mini-test 1 recap
    video: https://echo360.org/public/media/35908250-a939-433d-b4cc-0f0e38fc34fc
################################################################################
  - module: Regular Languages
    lecture: Formal languages
    video: https://echo360.org/public/media/0f876659-46e6-4519-8b55-a208857aa2d6
  - lecture: Kleene star, language equivalence
    video: https://echo360.org/public/media/c575399c-eaba-4462-9fec-68edb61d8e34
  - lecture: Recap & exercises
    video: https://echo360.org/public/media/021ad153-ed90-4134-b131-58a79d1ddecb
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
* **Schedule:** Monday, Wednesday / 4:00pm to 5:15pm

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

* **Kleopatra Gjini (REMOTE):** Mondays and Wednesdays 11am-12pm; Fridays 10am-11am

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
