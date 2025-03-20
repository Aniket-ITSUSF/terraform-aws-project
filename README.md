# FINAL OUTPUT

- List of our ips\
  ![img_2.png](img_2.png)


- Login into the bastian host using our own personal ssh key
![img.png](img.png)


- AWS Console EC2 Verification
![img_1.png](img_1.png) 

  
- Login to private subnet IPs through our public ip server
- First login to Bastian Host then through Bastion Host Log in to the private subnet ips
![img_3.png](img_3.png)


## NOTE: THE RSA SSH-KEY CREATED WHEN BUILDING AMI THROUGH PACKER IS REQUIRED

## Configure:
-   ### Step 1: Your public rsa key.
    - In the main.tf in the root folder
    - Search for <span style="color:red"> **YOUR_PUBLIC_KEY_HERE** </span> and replace it with the same key used to create the AMI.

- ### Step 2 : IP Address:
  - In the file terraform.tfvars
  - Enter your IP Address and append /32 to it.

- ### Step 3 : Run
  > terraform init 
  > terraform plan
  > terraform apply

- ### Step 4: Verify Output
   >  bastion_public_ip = "13.XXX.XX.26" \
    instance_private_ips = [\
    "10.0.3.XXX", \
    "10.0.4.XXX",\
    "10.0.3.XXX",\
    "10.0.4.XX",\
    "10.0.3.XX",\
    "10.0.4.XXX",\
    ]\
    vpc_id = "vpc-XXXX06b1994612462" 

- ### SSH Into the bastion/public ec2 using the PRIVATE key 
    > ssh -i <span style="color:red">**PRIVATE KEY PATH**</span> ec2-user@<span style="color:red">**BASTION IP**</span>
  - #### Once loged in to bastion/publiv server you just need to ssh into private subnet
    > ssh ec2-user@<span style="color:red">**PRIVATE IP**</span>
  
    - #### Known Problems
      - Might face permission denied to login into the private ip through bastion
      - To fix it logout of the bastion ec2 and then run
        > ssh-add ~/.ssh/id_rsa \
         ssh -A ec2-user@<span style="color:red">**BASTION IP**</span>
      
