FROM jenkins

LABEL maintainer="LordGift"

USER root

RUN apt-get update && apt-get install -y android-sdk

ENV JENKINS_HOME /var/jenkins_home
ENV ANDROID_HOME /usr/lib/android-sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Download and untar Android SDK tools
# RUN mkdir -p $ANDROID_HOME
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip -O sdk-tools.zip
RUN unzip -o sdk-tools.zip -d $ANDROID_HOME
RUN rm sdk-tools.zip

# Update and install using sdkmanager 
# RUN $ANDROID_HOME/tools/bin/sdkmanager "tools" "platform-tools"
# RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;28.0.0" "build-tools;27.0.3"
# RUN $ANDROID_HOME/tools/bin/sdkmanager "platforms;android-28" "platforms;android-27"
# RUN $ANDROID_HOME/tools/bin/sdkmanager "extras;android;m2repository" "extras;google;m2repository"
RUN yes | sdkmanager "platform-tools" "platforms;android-28"


ARG jenkins_defualt_port=8080
EXPOSE ${jenkins_defualt_port}