1. Obtain an AWS private key using these instructions (if you don't have one already): http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
  - Make sure to name the key-pair "spring-petclinic" without quotes
  - Also, save the .pem file in this directory
2. Obtain your AWS access key and secret access key here (if you don't have them already):
  - https://console.aws.amazon.com/iam/home?#/security_credential
3. Open variables.tf and modify the variables "access_key" and "secret_key" with their respective values from step 2
4. Set a security group for future network connections:
  - Navigate to AWS console
  - Click on "EC2"
  - Click on "Security Groups"
  - Select default security group (group name "default"); at the bottom of the web page, there should be 4 tabs labelled "Description", "Inbound", "Outbound", "Tags"
  - Select the "Inbound" tab
  - Click "Edit"
  - Click "Add Rule"
  - For this new rule, set Type to "All TCP"
    - For Source, if you want anybody to have a connection, select "Anywhere"; if you only want your IP allowed, select "My IP"; if you want some other specific IP, select "Custom" and enter the IP
  - Click "Save"
4. Open terminal and run "terraform init" from this directory
5. Then, run "terraform apply"
6. Setup will create an AWS EC2 instance with 64-bit Linux (takes anywhere from 1-4 minutes).
  - First, it will copy all the files in this directory to the instance.
  - Next, it will run provision.sh.
    - This script installs Java and Maven and starts up a web server
  - The web server is finished setting up once the script pauses and you see the line "aws_instance.petclinic (remote-exec): INFO: Starting ProtocolHandler ["http-bio-9966"]" in the terminal
  - NOTE: Terraform will continue to say "... still creating..." after everything is installed and the server is setup.  This just means the server is listening for requests.
7. Navigate to the AWS console in your browser, search for EC2, and select the AWS instance you just created.  A public DNS is provided.  
  - Enter that DNS with ":9966.petclinic" concatenated at the end into your browser.
8. You are not connected to petclinic!
