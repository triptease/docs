FROM ruby
RUN gem install \
    jekyll \
    jekyll-coffeescript \
    jekyll-default-layout \
    jekyll-gist \
    jekyll-optional-front-matter \
    jekyll-paginate \
    jekyll-readme-index \
    jekyll-relative-links \
    jekyll-theme-cayman webrick \
    jekyll-titles-from-headings

VOLUME /usr/src
WORKDIR /usr/src
ENTRYPOINT ["jekyll"]
