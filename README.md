Resume
======

Python resume generator. From YAML to PDF and static HTML in Docker.

# Requirements

* [Docker](https://www.docker.com/)
* [Docker Compose](https://docs.docker.com/compose/install/)
* To forego using Docker a Python 3.6+ environment is required.

# Installing

1. First, fork this repo!
2. Look at resume examples in the `resumes` folder and create your own.

# Use

With Docker:

1. Set a build arg for `RESUME` in the root level docker-compose.yml file to your resume and run `docker-compose up`.
2. Navigate to `localhost:8080` and view your resume.

Without Docker:

1. Setup a Python virtual environment using the requirements.txt file.
2. Copy `config.make.example` to `config.make` and update it with your settings.
3. Run `make` to build HTML and PDF files that will go to the `build` directory.

PDF generation:

A PDF is automatically generated along with HTML when running `make`.
To just create a PDF file you can run: `make pdf`

The PDF file name that is output to the `build` directory is defined by the `pdf_file` property in the `config` section of your resume `yaml` file.

# Customizing

This repo contains a compact, a simple, and a modern theme.

Add your own theme by creating `themes/<your-theme>` folder with `index.jinja2` template file.
Every other (non-jinja2) file from theme directory will be copied to final `build/` destination.

You can control which theme is used by setting `theme` property in the resume's `config` section.

Example Themes:

* [simple](http://resume.hanula.com/)
* [modern](https://resume.jordanpiel.net/)

# License

[MIT License](https://github.com/JBenPiel/resume/blob/master/LICENSE)
