---
author: Tiago Cogumbreiro
semester: Fall 2021
title: "CS 420: Introduction to the Theory of Computation"
layout: single
exercises_ext: .v
data:
  - module: Logical Foundations
  - closure: true
    date: Mo, Sep 6
  - lecture: Course overview; Coq intro
    video: https://echo360.org/media/3649172a-8974-4912-b092-ca75ec5962f5/public
    date: We, Sep 8
  - lecture: Pattern matching; reflexivity
    date: Mo, Sep 13
    video: https://echo360.org/media/ceb5e1c9-e9f3-49da-9ad5-61c86950c94b/public
  - lecture: Proofs by induction
    date: We, Sep 15
    video: https://echo360.org/media/f0ea8cb1-7fb8-43d9-9274-11d25c3cc3ed/public
  - lecture: Manipulating theorems; data-structures
    date: Mo, Sep 20
    video: https://echo360.org/media/4779b4aa-dd7f-4d4b-ab85-1d2e7d6cfd1b/public
  - lecture: Polymorphism; Constructor injectivity, explosion principle
    date: We, Sep 22
    video: https://echo360.org/media/6f20d8f6-a6ae-4958-abc4-ae71bf0dd916/public
  - lecture: Logical Connectives
    date: Mo, Sep 27
    video: https://echo360.org/media/5df5a80d-c155-4b89-a814-e42b0b29ecb1/public
  - lecture: Mini-test 1 recap
    date: We, Sep 29
    video: https://echo360.org/media/937921ff-de9e-4c0d-aea2-51abca3b8f54/public
################################################################################
  - module: Regular Languages
  - lecture: Formal languages
    date: Mo, Oct 4
    video: https://echo360.org/media/b521946c-54ec-42f4-85a5-5cb52e098272/public
  - lecture: Kleene star, language equivalence
    date: We, Oct 6
    video: https://echo360.org/media/38717281-d2b9-459b-874a-d7036844fe70/public
  - closure: true
    date: Mo, Oct 11
  - lecture: Recap & exercises
    date: We, Oct 13
    video: https://echo360.org/media/c79ed98a-a956-4ea0-a19c-4252c855546f/public
    skip_slides: true
  - lecture: Regular expressions
    date: Mo, Oct 18
    skip_exercises: true
    video: https://echo360.org/media/f076ad16-4dcf-4518-883a-a23938fc489d/public
  - lecture: REGEX & Nondeterministic Finite Automata
    date: We, Oct 20
    video: https://echo360.org/media/5c960347-39ec-4fa6-8c3a-8e2445a62387/public
    skip_exercises: true
  - lecture: NFA ⇔ REGEX
    date: Mo, Oct 25
    video: https://echo360.org/media/ba6adeb9-702a-4941-87ce-b45d2ef5c0fa/public
    skip_exercises: true
  - lecture: Deterministic Finite Automata; NFA ⇔ DFA
    date: We, Oct 27
    video: https://echo360.org/media/48027c7f-d93d-4ae6-906f-df12a5277021/public
    skip_exercises: true
################################################################################
  - module: Context-free Languages
  - lecture: Pumping lemma; Non-regular languages
    date: Mo, Nov 1
    video: https://echo360.org/media/4bf32dfe-3248-4173-b3a6-35f262ce5f30/public
    skip_exercises: true
    attachments:
    - title: Playlist on proving irregularity with Coq
      url: https://www.youtube.com/playlist?list=PL_fXogTdDGQdpggDhmLSxKxxXGOT-42rM
      type: video
    skip_exercises: true
  - lecture: Context-free grammars
    date: We, Nov 3
    video: https://echo360.org/media/6baf0138-4b55-4824-90c8-ebac1056dad1/public
    skip_exercises: true
  - lecture: Pushdown Automata
    date: Mo, Nov 8
    video: https://echo360.org/media/15b4adf6-048d-4065-81dc-045d1c6a7138/public
    skip_exercises: true
  - lecture: PDA ⇔ CFG
    date: We, Nov 10
    video: https://echo360.org/media/01e6ae44-b046-4ed8-bfca-025653db639e/public
    skip_exercises: true
  - lecture: Pumping lemma; Non-context-free Languages; Turing Machines
    date: Mo, Nov 15
    video: https://echo360.org/media/84d412ca-c141-4afd-bff5-1ef68ffeafb4/public
    skip_exercises: true
  - lecture: Variants of Turing Machines
    date: We, Nov 17
    video: https://echo360.org/media/b79ee861-e7d7-4b30-a32d-2d69ad030b91/public
  - lecture: Acceptance, emptiness and equality tests
    date: We, Nov 17
    video: https://echo360.org/media/b79ee861-e7d7-4b30-a32d-2d69ad030b91/public
################################################################################
  - module: Decidability
  - lecture: Undecidability
    date: Mo, Nov 22
    video: https://echo360.org/media/5e9a4677-3c4c-4b48-8305-5b2cf54ae61c/public
  - lecture: QA session
    date: We, Nov 24
    skip_slides: true
  - lecture: Undecidable problems
    date: Mo, Nov 29
    video: https://echo360.org/media/9c269192-3bf8-41ca-9d64-3cd70bdf0d4c/public
  - lecture: Undecidable problems
    date: We, Dec 1
    video: https://echo360.org/media/1e2f5242-b1ee-4ba7-8291-a0cbf197b9aa/public
  - lecture: Mapping reducibility
    date: Mo, Dec 6
    video: https://echo360.org/media/a82caf03-e9b8-4c83-b680-5170911d2a0d/public
  - lecture: Mapping reducibility
    date: We, Dec 8
  - lecture: QA Session
    date: Mo, Dec 13
---

**Past editions:** [**Spring '20**](../s20/), [**Fall '19**](../f19/)

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
</div>

# Course information

* **Location:** (M01-0409) Room 409, 1<sup>st</sup> floor, McCormack
* **Schedule:** 4:00pm to 5:15pm on Monday, Wednesday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact

* Dennis Liew
* **Office hours:** 12:30pm to 1:30pm on Tuesday, Wednesday, and Thursday.

* Hannah Zicarelli
* **Office hours:** 5:30pm to 6:30pm on Monday, Tuesday, and Wednesday.

# Resources

* [CS420 Supplementary Material: The Turing library (Coq)](https://gitlab.com/cogumbreiro/turing)
* [CS420 Supplementary Material: NFA/DFA/REGEX algorithms (Python)](https://gitlab.com/cogumbreiro/karakuri/)
* [Logic Foundations exercises](https://softwarefoundations.cis.upenn.edu/lf-current/lf.tgz)
* [Final Grade Calculator (WARNING: the calculated result is **approximated**, because some values are calculated on a curve)](https://docs.google.com/spreadsheets/d/1nNruW7ls0jETG5z9vgfrmZKihjo_-2yx2iM7TmIPhuc/edit?usp=sharing)

## Class Schedule

**Note:** Any lecture titles in future dates are considered tentative.


{% assign l_num = 0 %}
{% assign m_num = 0 %}
<table>
  <thead>
    <tr>
      <th>Date</th>
      <th>#</th>
      <th>Lecture</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
{% for r in page.data %}
<tr>
{% if r.module %}
  {% assign m_num = m_num | plus: 1 %}
  <td></td>
  <td></td>
  <td><b>☙ Module {{m_num}}: {{ r.module }} ❧</b></td>
  <td></td>
{% elsif r.closure %}
  <td class="has-text-grey-light">{{r.date}}</td>
  <td></td>
  <td class="has-text-grey-light">(School closure)</td>
  <td></td>
{% else %}
  {% if r.published %}
    {% assign is_pub = true %}
  {% elsif r.video %}
    {% assign is_pub = true %}
  {% elsif r.attachments %}
    {% assign is_pub = true %}
  {% else %}
    {% assign is_pub = false %}
  {% endif %}
  {% assign l_num = l_num | plus: 1 %}
  {% capture num %}{% if l_num < 10 %}0{% endif %}{{ l_num }}{% endcapture %}
  <td>{{ r.date }}</td>
  <td>{{ num }}</td>
  <td>
  {% if is_pub and r.skip_slides != true %}
    <a href="lecture{{num}}.html" title="View slides of lecture #{{num}} (press h for help) ">{{ r.lecture }}</a>
  {% else %}
    {{ r.lecture }}{% if r.skip_slides %} <i>(no slides)</i>{% endif %}
  {% endif %}
  </td>
  <td>
    {% if is_pub %}
      {% if r.skip_slides %}{% assign s_url = nil %}{% else %}
      {% capture s_url %}lecture{{ num }}.pdf{% endcapture %}
      {% endif %}
      {% if r.skip_exercises %}
        {% assign f_url = nil %}
      {% else %}
        {% capture f_url %}lecture{{ num }}{{ page.exercises_ext }}{% endcapture %}
      {% endif %}
      <span class="buttons has-addons">{% include button.html url=s_url title="Download lecture slides" icon="book" %}{% include button.html url=r.video icon="file-video" title="Video recording" %}{% include button.html url=f_url icon="box" title="Class exercises" %}</span>
    {% endif %}
  </td>
{% endif %}
</tr>
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