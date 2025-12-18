---
author: Tiago Cogumbreiro
semester: Fall 2025
title: "CS 450: Structure of Higher Level Languages"
layout: single
exercises_ext: .rkt
previous_year: ../f24

course_info:
  location: W01-0004 (Wheatley)
  schedule: Tuesday/Thursday 11:00AM - 12:15PM
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
  slides_from: f25-1
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
  last_updated: '2025-09-16'
  video: https://echo360.org/public/media/8506583a-77e0-4301-9863-28a9aabac3ea
- lecture: Modules, structs, (map) updating lists
  slides_from: f23
  video: https://echo360.org/public/media/5b4e7e2c-8452-4447-be46-996ed694656b
  last_updated: '2025-09-16'
- lecture: Functions as data-structures, currying
  slides_from: f23
  video: https://echo360.org/public/media/da6374da-7913-4ba0-8ab1-adcda0564daa
  last_updated: '2025-09-22'

- module: Optimized Functional Programming
  lecture: foldr, looping first-to-last
  slides_from: f23
  video: https://echo360.org/public/media/c5b78415-4997-409f-ae8b-59fe130e1137
- lecture: foldl, looping last-to-first
  slides_from: f23
  video: https://echo360.org/public/media/bc9453ed-9106-4a3f-818e-5aa505957d32
- lecture: Homework help; tail-recursion
  slides_from: f23
  video: https://echo360.org/public/media/2ef3f79a-688b-4c1f-81b9-74a84738b5e3
  

- module: Lazy evaluation
  lecture: "TypedRacket, thunks, and promises"
  video: https://echo360.org/public/media/6f273c30-06b8-476f-92c2-6144ca06f573
  slides_from: f23
- lecture: "Infinite streams"
  slides_from: f23
  video: https://echo360.org/public/media/012c3e0c-82b7-4b5a-8c7a-ff0416c9a421
- lecture: Finite streams, evaluating expressions
  video: https://echo360.org/public/media/dafb9f98-3df7-49c7-b2f8-040c72313c75
  slides_from: f23
  

- module: Implementing function calls
  lecture: "Language λ<sub>S</sub>: slow function calls"
  video: https://echo360.org/public/media/2c127bff-e5a9-4214-8e93-e50afd4c95e2
  slides_from: f23
- lecture: "Language λ<sub>E</sub>: fast function calls"
  video: https://echo360.org/public/media/de75ca35-8268-4697-a08e-f052e0553d3f
  slides_from: f23
- lecture: Exercises
  video: https://echo360.org/public/media/851441be-ab43-40af-a598-ee4ae16d5e84
  slides_from: f23

- module: Implementing Racket's define
  lecture: "Specifying λ<sub>D</sub>"
  slides_from: f23
  video: https://echo360.org/public/media/d0962e0e-2ed8-421d-8eab-0fcc57503e7b
- lecture: Implementing λ<sub>D</sub>
  video: https://echo360.org/public/media/ecec3dcd-42de-461e-ad4a-02d1e4b86b08
  slides_from: f23
- lecture: "Exercises"
  video: https://echo360.org/public/media/c2d96171-329b-4cfb-97e0-6b1cb3283a98
  slides_from: f23

- module: Monads and side effects
  lecture: Garbage collection
  video: https://echo360.org/public/media/c2039bbf-e06e-4e1e-87a4-a885535be3ea
  slides_from: f23
- lecture: The state monad
  video: https://echo360.org/public/media/2830306c-f95f-4f42-bc6d-c2821126127a
  slides_from: f23
- lecture: Loops and error monad
  video: https://echo360.org/public/media/9e1b9e62-ca4b-4079-984a-c6ddf4955eee
  slides_from: f23

- module: Abstraction
  lecture: Monadic error; Monadic continuations
  video: https://echo360.org/public/media/f8e3f0f1-60d6-440a-9682-45dc8f85a59b
  slides_from: f23
- lecture: Parameters; Generic methods
  video: https://echo360.org/public/media/c24dda83-8079-4df0-8976-9c9eb8a64e7e
  slides_from: f23
- lecture: Macros
  video: https://echo360.org/public/media/403c07fc-96d9-408f-95fe-d7a672555145
  slides_from: f23

- module: Object Oriented Programming
  lecture: LambdaJS
  slides_from: f23
  video: https://echo360.org/public/media/8c2ded79-9c83-4a39-8c46-cd8437b3eba4
- lecture: JavaScript method and class inheritance
  video: https://echo360.org/public/media/25389661-8be5-45d6-a72a-39188c81a93f
  slides_from: f23
- lecture: Conclusion
  video: https://echo360.org/public/media/36eb8fa8-2bdd-42b1-a9f4-f23b4dc0f803
  slides_from: f23
- lecture: QA
  video: https://echo360.org/public/media/7bfc2730-468f-488c-885a-b8e79d0b3065
  slides_from: f23
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
section: '1'
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
