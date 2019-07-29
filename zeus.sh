#!/bin/sh
#Hi,welcome to use script,you can control your program life,like running,stop,status. if you have any question,please contact me by QQ648830605

## java env
export JAVA_HOME=/home/yancheng/dev-soft/jdk1.8.0_201
export JRE_HOME=$JAVA_HOME/jre
 
# your jar file name,please put this sh file to your jar of path
API_NAME=project-daluu-mini-1.0-SNAPSHOT
JAR_NAME=$API_NAME\.jar

PID=$API_NAME\.pid
 
#Usage
usage() {
    echo "Usage: sh zeus.sh [start|stop|restart|status]"
    exit 1
}
 
# check process exist
is_exist(){
  pid=`ps -ef|grep $JAR_NAME|grep -v grep|awk '{print $2}' `
 
  if [ -z "${pid}" ]; then
   return 1
  else
    return 0
  fi
}
 
#start your program
start(){
  is_exist
  if [ $? -eq "0" ]; then 
    echo ">>> ${JAR_NAME} is already running PID=${pid} <<<" 
  else 
    nohup $JRE_HOME/bin/java -Xms256m -Xmx512m -jar $JAR_NAME >/dev/null 2>&1 &
    echo $! > $PID
    echo ">>> start $JAR_NAME successed PID=$! <<<" 
   fi
  }
 
#stop your program
stop(){
  #is_exist
  pidf=$(cat $PID)
  #echo "$pidf"  
  echo ">>> api PID = $pidf begin kill $pidf <<<"
  kill $pidf
  rm -rf $PID
  sleep 2
  is_exist
  if [ $? -eq "0" ]; then 
    echo ">>> api 2 PID = $pid begin kill -9 $pid  <<<"
    kill -9  $pid
    sleep 2
    echo ">>> $JAR_NAME process stopped <<<"  
  else
    echo ">>> ${JAR_NAME} is not running <<<"
  fi  
}
 
#print program run status
status(){
  is_exist
  if [ $? -eq "0" ]; then
    process=`ps -ef|grep project-daluu-mini-1.0-SNAPSHOT|grep -v grep|awk '{print;}'`
    echo ">>> ${JAR_NAME} is running PID is ${pid} <<<"
    echo ">>>$process" 
  else
    echo ">>> ${JAR_NAME} is not running <<<"
  fi
}
 
#restart program
restart(){
  stop
  start
}
 
# execute this method from your input string
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "restart")
    restart
    ;;
  *)
    usage
    ;;
esac
exit 0
