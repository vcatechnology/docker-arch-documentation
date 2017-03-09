FROM vcatechnology/arch-ci:latest
MAINTAINER VCA Technology <developers@vcatechnology.com>

# Build-time metadata as defined at http://label-schema.org
ARG PROJECT_NAME
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="$PROJECT_NAME" \
      org.label-schema.description="An up-to-date Arch Linux image with packages for documentation building" \
      org.label-schema.url="https://www.archlinux.org/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/vcatechnology/docker-arch-documentation" \
      org.label-schema.vendor="VCA Technology" \
      org.label-schema.version=$VERSION \
      org.label-schema.license=MIT \
      org.label-schema.schema-version="1.0"

# Install packages
RUN sudo vca-install-package \
  git \
  openssh \
  make \
  rsync \
  tar \
  bzip2 \
  gzip \
  xz \
  pandoc \
  python-pandocfilters \
  python-pypandoc \
  optipng \
  python-pylint \
  yapf \
  zopfli \
  jq \
  texlive-most \
  npm

# Install NPM packages
RUN sudo npm install -g markdownlint-cli inquirer
