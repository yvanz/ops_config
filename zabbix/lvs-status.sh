#!/bin/bash
# get lvs connection
 
function AllConn {
        sudo /sbin/ipvsadm -L -n |awk '{print $5}'| awk 'BEGIN{sum=0}{sum+=$1}END{print sum}'
}
function Act12 {
        sudo /sbin/ipvsadm -L -n | grep 20.12:80|awk '{print $5}'
}
function Act13 {
        sudo /sbin/ipvsadm -L -n | grep 20.13:80|awk '{print $5}'
}
function Act14 {
        sudo /sbin/ipvsadm -L -n | grep 20.14:80|awk '{print $5}'
}
function Act15 {
        sudo /sbin/ipvsadm -L -n | grep 20.15:80|awk '{print $5}'
}
function Act16 {
        sudo /sbin/ipvsadm -L -n | grep 20.16:80|awk '{print $5}'
}
function Act17 {
        sudo /sbin/ipvsadm -L -n | grep 20.17:80|awk '{print $5}'
}

function Act39 {
        sudo /sbin/ipvsadm -L -n | grep 20.39:80|awk '{print $5}'
}
function Act40 {
        sudo /sbin/ipvsadm -L -n | grep 20.40:80|awk '{print $5}'
}
function Act41 {
        sudo /sbin/ipvsadm -L -n | grep 20.41:80|awk '{print $5}'
}
function Act42 {
        sudo /sbin/ipvsadm -L -n | grep 20.42:80|awk '{print $5}'
}
function Act43 {
        sudo /sbin/ipvsadm -L -n | grep 20.43:80|awk '{print $5}'
}
function Act44 {
        sudo /sbin/ipvsadm -L -n | grep 20.44:80|awk '{print $5}'
}

function AllInConn {
        sudo /sbin/ipvsadm -L -n |awk '{print $6}'| awk 'BEGIN{sum=0}{sum+=$1}END{print sum}'
}
function InAct12 {
        sudo /sbin/ipvsadm -L -n | grep 20.12:80|awk '{print $6}'
}
function InAct13 {
        sudo /sbin/ipvsadm -L -n | grep 20.13:80|awk '{print $6}'
}
function InAct14 {
        sudo /sbin/ipvsadm -L -n | grep 20.14:80|awk '{print $6}'
}
function InAct15 {
        sudo /sbin/ipvsadm -L -n | grep 20.15:80|awk '{print $6}'
}
function InAct16 {
        sudo /sbin/ipvsadm -L -n | grep 20.16:80|awk '{print $6}'
}
function InAct17 {
        sudo /sbin/ipvsadm -L -n | grep 20.17:80|awk '{print $6}'
}
function InAct39 {
        sudo /sbin/ipvsadm -L -n | grep 20.39:80|awk '{print $6}'
}
function InAct40 {
        sudo /sbin/ipvsadm -L -n | grep 20.40:80|awk '{print $6}'
} 
function InAct41 {
        sudo /sbin/ipvsadm -L -n | grep 20.41:80|awk '{print $6}'
}
function InAct42 {
        sudo /sbin/ipvsadm -L -n | grep 20.42:80|awk '{print $6}'
}
function InAct43 {
        sudo /sbin/ipvsadm -L -n | grep 20.43:80|awk '{print $6}'
}
function InAct44 {
        sudo /sbin/ipvsadm -L -n | grep 20.44:80|awk '{print $6}'
}

# Run the requested function
$1
