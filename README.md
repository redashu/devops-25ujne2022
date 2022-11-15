# devops-25ujne2022

### Linux target 

<img src="ln.png" />

### aws cloud target 

<img src="cl.png" />

### K8s Revision 

<img src="rev1.png">

### Namespaces Understanding 

<img src="ns.png">

### Default namespaces in k8s 

<img src="ns1.png">

### importance of kube-system namespace 

```
fire@ashutoshhs-MacBook-Air Desktop % kubectl   get  pod  -n kube-system 
NAME                                       READY   STATUS    RESTARTS      AGE
calico-kube-controllers-58dbc876ff-vjrt8   1/1     Running   7 (14m ago)   28d
calico-node-8sdk7                          1/1     Running   7 (14m ago)   28d
calico-node-d4zcc                          1/1     Running   7 (14m ago)   28d
calico-node-qzvk8                          1/1     Running   7 (13m ago)   28d
coredns-565d847f94-fh6bd                   1/1     Running   7 (14m ago)   28d
coredns-565d847f94-k6dzc                   1/1     Running   7 (14m ago)   28d
etcd-control-plane                         1/1     Running   7 (14m ago)   28d
kube-apiserver-control-plane               1/1     Running   7 (14m ago)   28d
kube-controller-manager-control-plane      1/1     Running   7 (14m ago)   28d
kube-proxy-4kqth                           1/1     Running   7 (14m ago)   28d
kube-proxy-9xrbh                           1/1     Running   7 (13m ago)   28d
kube-proxy-bkldn                           1/1     Running   7 (14m ago)   28d
kube-scheduler-control-plane               1/1     Running   7 (14m ago)   28d
metrics-server-767967fcd-r4ssv             1/1     Running   1 (13m ago)   4d
fire@ashutoshhs-MacBook-Air Desktop % 

```

### creating and set-default to a namespace 

```
fire@ashutoshhs-MacBook-Air Desktop % kubectl  create  namespace  ashu-space --dry-run=client -o yaml 
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: ashu-space
spec: {}
status: {}
fire@ashutoshhs-MacBook-Air Desktop % kubectl  create  namespace  ashu-space                          
namespace/ashu-space created
fire@ashutoshhs-MacBook-Air Desktop % kubectl  get  ns |   grep ashu
ashu-project           Active   4d7h
ashu-space             Active   6s
fire@ashutoshhs-MacBook-Air Desktop % kubectl  config set-context --current --namespace=ashu-space 
Context "kubernetes-admin@kubernetes" modified.
fire@ashutoshhs-MacBook-Air Desktop % 
fire@ashutoshhs-MacBook-Air Desktop % kubectl  get  pods
No resources found in ashu-space namespace.
fire@ashutoshhs-MacBook-Air Desktop % kubectl  get  svc 
No resources found in ashu-space namespace.
fire@ashutoshhs-MacBook-Air Desktop % kubectl  get  secret
No resources found in ashu-space namespace.
fire@ashutoshhs-MacBook-Air Desktop % 

```

