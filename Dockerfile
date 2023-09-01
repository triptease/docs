FROM ruby
RUN gem install \
    jekyll \
    jekyll-theme-cayman webrick \
    jekyll-coffeescript \
    jekyll-default-layout \
    jekyll-gist \
    jekyll-optional-front-matter \
    jekyll-paginate \
    jekyll-readme-index \
    jekyll-titles-from-headings \
    jekyll-relative-links

VOLUME /usr/src
ENTRYPOINT ["jekyll"]
