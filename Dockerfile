FROM silintl/php7  
RUN apt-get update && apt-get install -y php-memcache
#RUN ln /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/proxy.load  && ln /etc/apache2/mods-available/proxy_http.load  /etc/apache2/mods-enabled/proxy_http.load

RUN apt-get -y install cron
CMD sh /root/apache2-foreground 

ADD apache2-foreground /root/
# should make a volume
#RUN mkdir /data/frontend/caipiaoweb-php/log/monolog -p && chmod 0777 /data/frontend/caipiaoweb-php/log/monolog
 
# ADD  file

#CRON
#RUN apt-get install -y cron && touch /var/log/cron.log
# Add crontab file in the cron directory
#ADD ../male/crontabfile /etc/cron.d/hello-cron

# Give execution rights on the cron job
#RUN chmod 0644 /etc/cron.d/hello-cron && crontab /etc/cron.d/hello-cron

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log

COPY . /data/frontend/web/api/

#COPY h5/* /data/frontend/web/

