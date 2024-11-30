1. Створити кластер EKS 
  * Використовуючи AWS Management Console або CLI, створіть кластер EKS 
  * Кластер повинен складатися щонайменше з двох воркер-нод (Node Groups) у публічній підмережі 
  * Застосовуйте EC2 інстанси типу t3.medium 
  
  Cluster Name: my-eks-cluster

  Kubernetes Version: 1.21

  VPC Name: my-eks-vpc

  Subnets: public-subnet-1 (us-east-1a), public-subnet-2 (us-east-1b)

  Security Group Name: my-eks-sg

  Node Group Name: my-node-group

  Instance Type: t3.medium
  
  1.1 Create VPC
  
      ```

      aws ec2 create-vpc --cidr-block 10.0.0.0/16 --tag-specifications 'ResourceType=vpc,Tags=[{Key=Name,Value=my-eks-vpc}]'


      ```
	  
	  
  1.2 Create Subnets
    
      ```

      aws ec2 create-subnet --vpc-id vpc-12345678 --cidr-block 10.0.1.0/24 --availability-zone us-east-1a --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-subnet-1}]'
      aws ec2 create-subnet --vpc-id vpc-12345678 --cidr-block 10.0.2.0/24 --availability-zone us-east-1b --tag-specifications 'ResourceType=subnet,Tags=[{Key=Name,Value=public-subnet-2}]'

      ```
	  
  1.3 Create Security Group
   
      ```

      aws ec2 create-security-group --group-name my-eks-sg --description "Security group for EKS cluster" --vpc-id vpc-12345678


      ```
	  
  1.4 Add Inbound Rule to Security Group
     
      ```

      aws ec2 authorize-security-group-ingress --group-id sg-12345678 --protocol all --port all --cidr 0.0.0.0/0


      ```
	  
  1.5 Create EKS Cluster
       
      ```

      aws eks create-cluster --name my-eks-cluster --region us-east-1 --kubernetes-version 1.21 --role-arn arn:aws:iam::123456789012:role/EKSClusterRole --resources-vpc-config subnetIds=subnet-12345678,subnet-87654321,securityGroupIds=sg-12345678


      ```
	  
  1.6 Create Node Group
        
      ```

      aws eks create-nodegroup --cluster-name my-eks-cluster --nodegroup-name my-node-group --subnets subnet-12345678 subnet-87654321 --instance-types t3.medium --scaling-config minSize=2,maxSize=2,desiredSize=2 --node-role arn:aws:iam::123456789012:role/EKSNodeInstanceRole


      ``` 
	  
	  
  
2. Налаштувати kubectl для доступу до кластера 
  * Підключіть локальний kubectl до вашого кластера 
  * Переконайтеся, що команда kubectl get nodes показує воркер-ноди кластера 
  
  Configure kubectl to Access the Cluster
          
      ```

      aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster
      kubectl get nodes

      ```
  
3. Розгорнути статичний вебсайт 
  * Створіть Deployment, який розгортає статичний вебсайт на основі образу nginx 
  * Використовуйте ConfigMap для передачі файлів вебсайту (наприклад, index.html) 
  * Розгорніть Service типу LoadBalancer, щоб зробити вебсайт доступним через публічний IP 
  Deploy a Static Website
  3.1 Create Deployment
      Please, see the attached nginx-deployment.yaml file
	  
  3.2 Apply the deployment:
          
      ```

      kubectl apply -f nginx-deployment.yaml

      ```  
  3.3 Create ConfigMap
        Please, see the attached nginx-config.yaml file
		
  3.4 Apply the ConfigMap:
          
      ```

      kubectl apply -f nginx-config.yaml

      ```   
  3.5 Create Service
           Please, see the attached nginx-service.yaml file
		   
  3.6 Apply the service:
            
      ```

      kubectl apply -f nginx-service.yaml

      ``` 
  
4. Створити PersistentVolumeClaim для збереження даних 
  * Використовуйте динамічне створення сховища (StorageClass), щоб зробити PersistentVolumeClaim 
  * Розгорніть Pod, який застосовує цей PVC, щоб зберігати дані на EBS-диску 
  
  Create PersistentVolumeClaim
  4.1 Create StorageClass
          Please, see the attached storageclass.yaml file
		  
  4.2 Apply the StorageClass:
               
      ```

      kubectl apply -f storageclass.yaml

      ```   
  4.3 Create PersistentVolumeClaim
            Please, see the attached ebs-pvc.yaml file
			
  4.4 Apply the PVC:
               
      ```

      kubectl apply -f ebs-pvc.yaml

      ```   
  4.5 Create Pod using PVC
              Please, see the attached ebs-pod.yaml file
			  
  4.6 Apply the pod:
                
      ```

      kubectl apply -f ebs-pod.yaml

      ``` 
  
5. Запуск завдання за допомогою Job 
  * Створіть Job, який виконує просту команду, наприклад, echo "Hello from EKS!" 
  * Переконайтеся, що Job виконується успішно 
  
  5.1 Create Job
               Please, see the attached hello-job.yaml file
  5.2 Apply the job:
                  
      ```

      kubectl apply -f hello-job.yaml

      ```
	  
  5.3 Get the jobs status
                    
      ```

      kubectl get jobs

      ```
  
6. Розгорнути тестовий застосунок 
  * Розгорніть застосунок з образу httpd (Apache HTTP Server) або nginx 
  * Використовуйте Deployment для створення двох реплік 
  * Налаштуйте Service типу ClusterIP для доступу до застосунку всередині кластера 
  
  6.1 Create Deployment
  
               Please, see the attached httpd-deployment.yaml file  
			   
  6.2 Apply the deployment:
                   
      ```

      kubectl apply -f httpd-deployment.yaml

      ``` 
	  
  6.3 Create Service
               Please, see the attached httpd-service.yaml file
			   
  6.4 Apply the service:
                     
      ```

      kubectl apply -f httpd-service.yaml

      ``` 
  
  
7. Робота з неймспейсами 
  * Створіть окремий namespace dev і розгорніть у ньому застосунок з 5 репліками на основі образу busybox. Контейнер повинен виконувати команду sleep 3600. 
  
  Work with Namespaces
  7.1 Create Namespace
                       
      ```

      kubectl create namespace dev

      ``` 
  7.2 Deploy Application in Namespace
               Please, see the attached busybox-deployment.yaml file
			   
  7.3 Apply the deployment:
                     
      ```

      kubectl apply -f busybox-deployment.yaml

      ```  
  
8. Очистити ресурси 
   * Deployment, Pod, Service, PVC тощо після завершення роботи
   
   Cleanup Resources
                        
      ```

      kubectl delete deployment nginx-deployment
      kubectl delete service nginx-service
      kubectl delete pvc ebs-pvc
      kubectl delete job hello-job
      kubectl delete deployment httpd-deployment
      kubectl delete service httpd-service
      kubectl delete namespace dev


      ```