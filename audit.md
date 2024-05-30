## Audit Questions

### Batch 1:

**1. What is container orchestration, and what are its benefits?**

Container orchestration is the automated management, deployment, scaling, and networking of containerized applications. Its benefits include:

- **Automated Deployment:** Simplifies the deployment of applications.
- **Scaling:** Automatically adjusts the number of running containers based on demand.
- **Load Balancing:** Distributes network traffic across multiple containers.
- **Resource Management:** Optimizes resource usage to ensure efficient operation.
- **Self-Healing:** Automatically restarts failed containers and manages updates without downtime.

**2. What is Kubernetes, and what is its main role?**

Kubernetes is an open-source platform for automating the deployment, scaling, and management of containerized applications.

**3. What is K3s, and what is its main role?**

K3s is a lightweight Kubernetes distribution. Its main role is to provide an easy-to-install, resource-efficient Kubernetes.

Sure, here are the shorter versions of questions 1 and 2:

---

### Batch 2:

**1. What is infrastructure as code and what are the advantages of it?**

Infrastructure as Code (IaC) uses scripts to manage and provision infrastructure. Advantages include:

- **Consistency:** Ensures identical setup every time.
- **Speed:** Automates and accelerates setup.
- **Version Control:** Tracks changes effectively.
- **Scalability:** Easily replicates environments.
- **Cost Efficiency:** Reduces manual errors and costs.

**2. Explain what is a K8s manifest.**

A K8s (Kubernetes) manifest is a YAML or JSON file that defines the desired state of objects in a Kubernetes cluster.

**3. Explain each K8s manifest.**

- Read the comments in the files.

---

### Batch 3:

**1. What is StatefulSet in K8s?**

StatefulSet manages stateful applications, ensuring each pod has a unique, stable identity and persistent storage.

**2. What is deployment in K8s?**

Deployment manages stateless applications, ensuring the desired number of pod replicas are running.

**3. What is the difference between deployment and StatefulSet in K8s?**

Deployment is for stateless applications; StatefulSet is for stateful applications with stable identities and storage.

**4. What is scaling, and why do we use it?**

Scaling is adjusting the number of running pods. We use it to handle changes in load, ensuring the application can manage varying amounts of traffic and maintain performance.

**5. What is a load balancer, and what is its role?**

A load balancer distributes incoming network traffic across multiple pods. We use it to prevent any single pod from being overwhelmed, ensuring reliability and availability of the application.

**6. Why don't we put the database as a deployment?**

Databases need stable identities and persistent storage, which are provided by StatefulSets, not deployments.

---

### Audit Part Without Any Instruction

**1. Stop the billing-app container**

```sh
kubectl get pods -l app=billing-app
```

```sh
kubectl scale statefulset billing-app --replicas=0
```

```sh
kubectl get pods -l app=billing-app
```

**2. Can you confirm the billing-app container was correctly stopped?**

Check the output of the second `kubectl get pods -l app=billing-app` command to ensure there are no running pods for the billing-app.

**3. Start the billing-app container**

```sh
kubectl scale statefulset billing-app --replicas=1
```

```sh
kubectl get pods -l app=billing-app
```

--

### Batch 4:

### Kubernetes Components and Their Roles

1. **Etcd**:
   - **Role**: Stores all the data about the cluster, like a big database.

2. **API Server**:
   - **Role**: The main entry point for all commands sent to the cluster. Think of it as the cluster’s receptionist.

3. **Scheduler**:
   - **Role**: Decides which computer (node) will run a new application (pod). It's like a job planner.

4. **Controller Manager**:
   - **Role**: Makes sure the cluster is in the correct state, fixing things if needed. It's like a repairman.

5. **Kubelet**:
   - **Role**: Runs on every computer (node) in the cluster to manage containers. It's like a local manager.

6. **Kube Proxy**:
   - **Role**: Manages network rules so all parts of the application can talk to each other. Think of it as a traffic controller.

7. **Container Runtime**:
   - **Role**: Runs the containers (like mini-apps). Examples include Docker.

8. **Cluster DNS**:
   - **Role**: Helps parts of the application find each other by name, like a phonebook.

9. **Ingress Controller**:
   - **Role**: Manages external access to the applications, like a doorman.

10. **Volumes**:
    - **Role**: Provides storage for data that needs to be saved, like a hard drive.

11. **Network Plugins (CNI)**:
    - **Role**: Sets up networking for the applications so they can communicate, like network cables.

12. **Dashboard**:
    - **Role**: A web-based interface to manage and see what’s happening in the cluster, like a control panel.