# IN2 THA CLUSTER

![](images/cluster.jpg)

A *nix/bash friendly introduction to working with the clustered Raspberry Pis at Brahman-ai.ChaTsubo.

### Clustering

> A computer cluster is a set of loosely or tightly connected computers that work together so that, in many respects, they can be viewed as a single system. Unlike grid computers, computer clusters have each node set to perform the same task, controlled and scheduled by software
> 
> ...
> 
> Computer clusters emerged as a result of convergence of a number of computing trends including the availability of low-cost microprocessors, high-speed networks, and software for high-performance distributed computing.
> [-- source: https://en.wikipedia.org/wiki/Computer_cluster](https://en.wikipedia.org/wiki/Computer_cluster)

We don't yet have a cluster in the above sense, but we're working on it. There are tools, such as Kubernetes that can manage the RaspberryPis as nodes in a cluster for the deployment of applications that run in Docker containers.

Until then, I've been using a tool called Ansible to bring all the Raspberry Pis up to the same basic configuration and to manage users.

Today, we'll cover some practical concepts and tools to get you setup to work with Pis in the cluster. Hopefully soon, we'll be able to switch over and provide everyone with access to the cluster to test scenarios that we might find in installations such as the Portal or Abraham.

### Topics

* Networking
* Terminal
* SSH

### Tools/Commands (OSX)

* terminal.app
* bash
* ping
* traceroute
* wireshark
* nmap
* nano
* wget


## Networking

![](images/network.png)

