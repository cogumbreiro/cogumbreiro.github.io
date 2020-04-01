---
author: Tiago Cogumbreiro
semester: Spring 2020
title: "CS 420: Introduction to the Theory of Computation"
layout: single
ext: .v
data:
  - module: Logical Foundations
  - lecture: Course overview; Coq intro
    date: Mo, Jan 27
    published: true
  - lecture: Pattern matching; reflexivity
    date: We, Jan 29
    video: https://echo360.org/media/28f68251-2762-48b5-836c-b056b50ce793/public
  - lecture: Proofs by induction
    date: Mo, Feb  3
    video: https://echo360.org/media/20cf88a8-c051-4a7c-bbde-33b7cb89b43c/public
  - lecture: Manipulating theorems; data-structures
    date: We, Feb  5
    video: https://echo360.org/media/eb2ef42d-3f1d-42d7-badd-2800d985ace2/public
  - lecture: Polymorphism; Constructor injectivity, explosion principle
    date: Mo, Feb 10
    video: https://echo360.org/media/72cef3f3-2ec2-43dc-8c1e-ff312e583c30/public
  - lecture: Logical Connectives
    date: We, Feb 12
    video: https://echo360.org/media/0cc14e1a-7f61-4a18-9cf0-2e694000bfa0/public
  - closure: true
    date: Mo, Feb 17
################################################################################
  - lecture: Mini-test 1 recap
    date: We, Feb 19
    video: https://echo360.org/media/8e83d814-050b-4a8e-bdd3-99da20acbf2b/public
  - module: Regular Languages
  - lecture: Formal languages
    date: Mo, Feb 24
    video: https://echo360.org/media/eafbe08d-649e-4e52-bdb0-6c9b3139b4f9/public
  - lecture: Kleene star, language equivalence
    date: We, Feb 26
    video: https://echo360.org/media/561be86a-fd93-4308-a959-fbe3c2cf8c90/public
  - lecture: Regular expressions <b>(Mini-Test 1)</b>
    date: Mo, Mar  2
    skip_exercises: true
    video: https://echo360.org/media/97f0ee1d-7cde-4e35-b5a7-ce12ce28c306/public
  - lecture: REGEX & Nondeterministic Finite Automata
    date: We, Mar  4
    video: https://echo360.org/media/0f6e834b-29b9-46c7-b93b-b4edc04d56e4/public
  - lecture: NFA ⇔ REGEX
    date: Mo, Mar  9
    video: https://echo360.org/media/459e0291-c7b4-4638-99a3-a032fb082df9/public
    skip_exercises: true
  - lecture: Deterministic Finite Automata; NFA ⇔ DFA
    date: We, Mar 11
    video: https://echo360.org/media/db41f2e1-c6b7-4664-ba60-30b1048bb247/public
    skip_exercises: true
  - closure: true
    date: Mo, Mar 16
  - closure: true
    date: We, Mar 18
################################################################################
  - module: Context-free Languages
  - lecture: Pumping lemma; Non-regular languages; Mini-test 2 recap
    date: Mo, Mar 23
    attachments:
    - title: Introducing non-regular languages
      url: https://echo360.org/media/5ecab953-af20-4c6b-8653-7566fda75621/public
      type: video
    - title: An intuition of the Pumping lemma
      url: https://echo360.org/media/7e3311d7-f26a-4b19-9472-a70063c329ab/public
      type: video
    - title: The Pumping lemma, formally
      url: https://echo360.org/media/331e5760-9fcf-4882-883c-53d89c2d636c/public
      type: video
    - title: The Pumping language (exercises)
      url: https://echo360.org/media/6a7d3468-bbe4-4ff9-a0d5-0e4492f08ac8/public
      type: video
    - title: Proving that a language is not regular
      url: https://echo360.org/media/6470bc8c-6bb2-4959-9c5d-b75a6a3e6b6a/public
      type: video
    - title: Proving that a language is not regular in Coq
      url: https://echo360.org/media/7f8da469-b9d9-4f22-8572-048d97ee80f0/public
      type: video
  - lecture: Context-free grammars
    date: We, Mar 25
    attachments:
    - title: Grammar motivation
      url: https://echo360.org/media/9e63e788-5d19-4012-9a35-33fd9babbefb/public
      type: video
    - title: Intuition of a grammar
      url: https://echo360.org/media/d7860ccf-2ec4-46f9-8398-089999465ef1/public
      type: video
    - title: Derivation examples
      url: https://echo360.org/media/ae87dc0a-5d0d-4c60-9f76-358a5fd07ff6/public
      type: video
    - title: Parse trees
      url: https://echo360.org/media/c7adb8ef-1462-4c8e-8812-c21c5318d516/public
      type: video
    - title: Formalizing grammars
      url: https://echo360.org/media/38c9d0f6-8287-4489-9019-244cdbb357c0/public
      type: video
  - lecture: Pushdown Atomata
    date: Mo, Mar 30
    skip_exercises: true
    attachments:
    - title: PDA Intuition
      url: https://echo360.org/media/04e724ce-ecf8-4a4d-bde7-2275175b8211/public
      type: video
    - title: Transition exercises
      url: https://echo360.org/media/5d648656-4407-4c88-9008-81ede3d9af48/public
      type: video
    - title: Simplifying the notation
      url: https://echo360.org/media/074785ad-5ca4-42f6-b155-209f872e0051/public
      type: video
    - title: Transition exercises (2)
      url: https://echo360.org/media/92336071-96da-4912-b822-0cbfbfd05f18/public
      type: video
    - title: PDA Accepting example
      url: https://echo360.org/media/905ad6d3-2b57-4dac-b2e6-94f41fb00097/public
      type: video
    - title: Formalizing PDA
      url: https://echo360.org/media/429ade4a-d6eb-448d-94d7-8e61d1f5affd/public
      type: video
    - title: Example PDAs
      url: https://echo360.org/media/8771c861-f0f3-4d34-b9f2-791e94c9b729/public
      type: video
    - title: Formalize acceptance
      url: https://echo360.org/media/fbd8b6b7-bfa9-4450-b8de-48465798020b/public
      type: video
    - title: Example 2.16
      url: https://echo360.org/media/ac7f513a-e5b8-4e87-81d9-34b691f4a535/public
      type: video
    - title: Example 2.16 (2)
      url: https://echo360.org/media/34f36457-442e-47b6-9149-e7a708bea6af/public
      type: video
    - title: QA session
      url: lecture16-qa.zip
      type: audio
  - lecture: PDA ⇔ CFG; Pumping lemma; Non-context-free Languages
    date: We, Apr  1
  - lecture: Turing Machines
    date: Mo, Apr  6
  - lecture: Variants of Turing Machines
    date: We, Apr  8
  - lecture: Acceptance, emptiness and equality tests
    date: Mo, Apr 13
  - lecture: TM Acceptance
    date: We, Apr 15
  - closure: true
    date: Mo, Apr 20
################################################################################
  - module: Decidability
  - lecture: Acceptance, emptiness and equality tests <b>(Mini-test 3)</b>
    date: We, Apr 22
  - lecture: Undecidable problems
    date: Mo, Apr 27
  - lecture: Reduction via Computation Histories
    date: We, Apr 29
  - lecture: Mapping reducibility
    date: Mo, May  4
  - lecture: Mapping reducibility
    date: We, May  6
  - lecture: Mapping reducibility <b>(Mini-test 4)</b>
    date: We, May 11
  - lecture: Course conclusion
    date: We, May 13

---

<h1 class="has-text-centered">{{ page.title }}</h1>
<h2 class="has-text-centered" style="padding-bottom:1em;">{{ page.semester }}</h2>

<div class="buttons is-centered">
<a class="button is-large is-link" href="syllabus.pdf">Syllabus</a>
<a class="button is-large is-link" href="https://piazza.com/class/k5ubsxch57r196">Forum</a>
<a class="button is-large is-link" href="https://www.gradescope.com/courses/81793">Homework submission</a>
<a class="button is-large is-link" href="https://www.estalee.com/">Attendance</a>
</div>

# Course information

* **Location:** (Y01-1100) Room 1100, 1<sup>st</sup> floor, University Hall
* **Schedule:** 4:00pm to 5:15pm, Monday, Wednesday

# Instructor contact
* **Email:** [`Tiago.Cogumbreiro@umb.edu`](mailto:Tiago.Cogumbreiro@umb.edu)
* **Office:** {{ site.office.location }}
* **Office hours:** {{ site.office.hours }}

# Teaching assistants contact
* Son Nam Nguyen
* **Office:** (M03-0152) Room 0152, 3<sup>rd</sup> floor, McCormack
* **Office hours:** 1:30pm to 2:30pm, Monday, Wednesday

# Resources

* [CS420 Supplementary Material: The Turing library (Coq)](https://gitlab.com/cogumbreiro/turing)
* [CS420 Supplementary Material: NFA/DFA/REGEX algorithms (Python)](https://gitlab.com/cogumbreiro/)
* [Logic Foundations exercises](lf.tgz)
karukuri/)

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
  {% if is_pub %}
    <a href="lecture{{num}}.html">{{ r.lecture }}</a>
  {% else %}
    {{ r.lecture }}
  {% endif %}
  </td>
  <td>
    {% if is_pub %}
      {% capture s_url %}lecture{{ num }}.pdf{% endcapture %}
      {% if r.skip_exercises %}
        {% assign f_url = nil %}
      {% else %}
        {% capture f_url %}lecture{{ num }}-exercises.{{ page.ext }}{% endcapture %}
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