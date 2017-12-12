1. Obtain an AWS private key using these instructions (if you don't have one already): http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
  - Name the key-pair "spring-petclinic" without quotes
  - Save the .pem file in this directory (spring-petclinic)
2. Obtain your AWS access key and secret access key here (if you don't have them already):
  - https://console.aws.amazon.com/iam/home?#/security_credential
3. Open variables.tf and modify the variables "access_key" and "secret_key" with their respective values from step 2.
4. Setup a security group for future network connections:
  - Navigate to AWS console
  - Click on "EC2"
  - Click on "Security Groups"
  - Create a security group in order to select inbound and outbound traffic later in the process
    - Alternatively, use the default security group (group name "default")
    - At the bottom of the web page, there should be 4 tabs labelled "Description", "Inbound", "Outbound", "Tags" after selecting/clicking the chosen security group
  - Select the "Inbound" tab
  - Click "Edit"
  - Click "Add Rule"
  - For this new rule, set Type to "All TCP"
    - For the Source attribute, if you want universal access to the web application, select "Anywhere"; if you only want your IP allowed, select "My IP"; if you only want a specific IP, select "Custom" and enter the IP
  - Click "Save"
4. Navigate to variables.tf and modify the variable "security_groups" to contain your chosen security groups from step 4.  Simply add their name to the comma-separated list.
5. Download Java and Maven to the spring-petclinic/usbstick/ folder:
  - Download Linux x64 Java 7_75 tar.gz http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html#jdk-7u75-oth-JPR
  - Download Maven http://mirror.nexcess.net/apache/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz
6. Open terminal and run "terraform init" from this directory.
7. Then, enter the command "terraform apply".
8. Setup will create an AWS EC2 instance with 64-bit Linux (takes anywhere from 1-4 minutes).
  - First, it will copy all the files in this directory to the instance.
  - Next, it will run provision.sh.
    - This script installs Java + Maven and starts up a web server
9. Once provision.sh is finished running, the terminal will display an output variable named "url = ".  Copy the following url and enter it into a web browser.  The entire server spends roughly 1 minute 20 seconds on average to present an interface after setting up.
10. You are now connected to petclinic!

NOTE: To take down the server and aws instance, run "terraform destroy" from this directory in a terminal.
