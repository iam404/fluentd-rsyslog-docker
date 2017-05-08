FROM fluent/fluentd:stable-onbuild
MAINTAINER Prabuddha <prabuddha.nike13@gmail.com>
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

USER root
RUN apk --update --yes add build-base ruby-dev && \
    gem install fluent-plugin-elasticsearch --no-rdoc --no-ri && \
    gem install fluent-plugin-copy_ex --no-rdoc --no-ri && \
    gem install fluent-plugin-forest --no-rdoc --no-ri && \


RUN mkdir -p /home/fluent/data

EXPOSE 42185

USER root
CMD  fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
