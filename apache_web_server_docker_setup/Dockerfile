FROM httpd:latest

RUN echo $HTTPD_PREFIX

COPY ./public-html/ /usr/local/apache2/htdocs/

#https://stackoverflow.com/questions/57607381/how-do-i-change-timezone-in-a-docker-container
RUN apt-get install tzdata -yq
ENV TZ="Asia/Singapore"

# Configure Timezone in the container
RUN ls /usr/share/zoneinfo && \
cp /usr/share/zoneinfo/Singapore /etc/localtime && \
echo "Asia/Singapore" > /etc/timezone 