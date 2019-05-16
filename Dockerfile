FROM camunda/camunda-bpm-platform:tomcat-7.10.0

RUN wget http://central.maven.org/maven2/redis/clients/jedis/2.9.0/jedis-2.9.0.jar -P lib/ && \
    wget http://repo1.maven.org/maven2/de/javakaffee/msm/memcached-session-manager/2.3.2/memcached-session-manager-2.3.2.jar -P lib/ && \
    wget http://repo1.maven.org/maven2/de/javakaffee/msm/memcached-session-manager-tc9/2.3.2/memcached-session-manager-tc9-2.3.2.jar -P lib/

RUN sed -i '/^<\/Context>/i \
    <Manager className="de.javakaffee.web.msm.MemcachedBackupSessionManager" \
    memcachedNodes="redis://redis:6379" \
    sticky="false" \
    sessionBackupAsync="false" \
    storageKeyPrefix="context" \
    lockingMode="auto" \
    />' conf/context.xml
