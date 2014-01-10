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

### Theme configuration

Theme configuration is a bit tricky.

* [grunt](http://gruntjs.com/): to automate
* [less](http://lesscss.org/): to generate the CSS
* [Node](http://nodejs.org/): for Grunt ([tutorial for Ubuntu](http://howtonode.org/how-to-install-nodejs))
 

## Dependencies

* [Make](https://www.gnu.org/software/make/)
* [Jekyll](http://jekyllrb.com)
* [bibtex2html](https://www.lri.fr/~filliatr/bibtex2html/)
* [Python](http://www.python.org/)
* [rsync](https://rsync.samba.org/) (optional)

## License

This website is free and open source software, distributed under the
[GNU General Public License](https://www.gnu.org/licenses/gpl.html) version 2
or later.
