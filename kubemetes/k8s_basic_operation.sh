#!/bin/bash

# 查看部署文件
# kubectl get pod <pod-name> -o yaml -n <namespace>
kubectl get pod hello-world-master-85db7f986b-82bfm -o yaml -n hello
# kubectl get deploy -n <namespace> <pod-name> -o yaml
kubectl get deploy -n hello hello-world-master -o yaml

# 停止和恢复某个pod运行
# kubectl scale deployment <deployment-name> --replicas=<replica-count> -n <namespace>
kubectl scale deployment hello-world-master --replicas=1 -n hello

# 给 node 设置标签
# kubectl label nodes <node-name> <label-key>=<label-value>
kubectl label nodes node-1f03c-177 hello=world dark=day

# 查看日志
kubectl logs hello-world-master-85db7f986b-82bfm -n hello -c gogogo

# 查看定时任务
kubectl get job -n hello --show-labels
kubectl get cronjob -n hello --show-labels

# 删除 pod
# kubectl delete pod <podname> -n <namespace>
kubectl delete pod hello-world-master-85db7f986b-82bfm -n hello

# 重启pod
# Deployment
kubectl rollout restart deployment hello-world-master -n hello
# DaemonSet
kubectl rollout restart ds keepalived -n istio-system

# 修改配置文件
kubectl edit cm hello-world-master.conf -n hello

# 将pod中的文件拷贝到宿主机
# kubectl cp -n namespace podname:pod_container/filename -c container /tmp/filename
kubectl cp -n hello hello-world-master-85db7f986b-82bfm

# 进入容器内
kubectl exec -it hello-world-master-85db7f986b-82bfm -n hello bash -c gogogo

# 查看 pod/node 资源消耗
kubectl top pod hello-world-master-85db7f986b-82bfm -n hello --containers=true
kubectl top node node-1f03c-177

# 查看 pod/node 信息
kubectl describe pod hello-world-master-85db7f986b-82bfm -n hello
kubectl describe node node-1f03c-177

# 查看 pod 内运行的容器名称
# kubectl get pod POD_NAME_HERE -o jsonpath="{.spec['containers','initContainers'][*].name}" -n namespace
kubectl get pod hello-world-master-85db7f986b-82bfm -o jsonpath="{.spec['containers','initContainers'][*].name}" -n hello

# 查看 pod 实例
kubectl get pods -A
kubectl get pod -o wide --show-labels -n hello
