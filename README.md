# Tiago Cogumbreiro's scholar web page

Feel free to branch and alter this website.

* website: http://cogumbreiro.github.io/
* source code: https://github.com/cogumbreiro/cogumbreiro.github.io

## Workflow

* alter a page: `git commit`; `git push`
* alter the publications: `make`; `git commit`; `git push`

To edit a page from anywhere in the world you can use
[Prose](http://prose.io/)!

## Configuration

This website uses the awesome Jekyll theme
[Minimal Mistakes](http://mmistakes.github.io/minimal-mistakes). Most
configuration of this website is
[documented there](http://mmistakes.github.io/minimal-mistakes/theme-setup/).

I've added support for the generation a publications page from a bibtex file.
* the bibtex database is located in `_bibliography/publications.bib`;
* the bibtex2html style is located in `_bibliography/style.bst`;
* the rsync upload can be configured in `Makefile`.

## Theme configuration

Theme configuration is split into two parts:

* HTML structure is in `_layouts` and `_includes` (see Jekyll docs).
* The CSS is *generated* from LESS sources; the outcome is
  `assets/css/ie.min.css` and `assets/css/main.min.css`.
* The LESS source code is in `_template/less`.
* The JS source code in `_template/js` is *merged*  into
  `assets/js/scripts.min.js` (this is what is used).

## Theme dependencies

* [less](http://lesscss.org/): to generate CSS from LESS (Ubuntu package `node-less`)
* [uglifyjs](http://lesscss.org/): to merge JS (Ubuntu package `node-uglify`)

## Dependencies

* [Make](https://www.gnu.org/software/make/)
* [Jekyll](http://jekyllrb.com)
* [bibtex2html](https://www.lri.fr/~filliatr/bibtex2html/)
* [Python](http://www.python.org/)

## License

This website is free and open source software, distributed under the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) version 2
or later.
