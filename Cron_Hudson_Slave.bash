#/bin/sh

HUDSON_MASTER=http://rgjosih24-gmail-com4.mylabserver.com:8080
source $HOME/.bash_profile

start(){
 cd $HUDSON_HOME
 START="$HUDSON_HOME/jdk/bin/java -jar slave.jar -jnlpUrl $HUDSON_MASTER/computer/$NODE_NAME/slave-agent.jnlp -jnlpCredentials devuser1:devuser1"
 nohup $START >> slave.log 2>&1 &
 echo "STARTING HUDSON SLAVE !!! on: $NODE_NAME"
 echo `ps -ef | grep hudson | grep slave | grep $NODE_NAME| grep -v grep|grep jnlpUrl `
}

status(){
 cd $HUDSON_HOME
 echo "Hudson home is :" $HUDSON_HOME
 echo "Node Name is :"$NODE_NAME
 numproc=0
 echo `ps -ef | grep hudson | grep slave | grep $NODE_NAME| grep -v grep|grep jnlpUrl `
 numproc=`ps -ef | grep hudson | grep slave | grep $NODE_NAME| grep jnlpUrl|grep -v grep | wc -l`
 echo "Value of ps command is : $numproc"
 if [ $numproc -gt 0 ]; then
  echo "Hudson slave is ALIVE !!! on: $NODE_NAME"
  else
  echo "Hudson slave is DOWN !!! on: $NODE_NAME"
  start
 fi
}

status

exit 0
