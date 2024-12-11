Steps to Implement the CloudFormation Template:
1. Save the YAML File:

 - Save the provided CloudFormation template in a file named cloudformation-template.yaml.
![S3_create](images/01_AWS_CloudFormation_S3_create.jpg)

![S3_created](images/02_AWS_CloudFormation_S3_created.jpg)

![S3_template_uploaded](images/03_AWS_CloudFormation_S3_template_uploaded.jpg)


2. Open the AWS Management Console:

 - Go to the AWS Management Console and log in.


3. Navigate to CloudFormation:

 - In the Services menu, search for CloudFormation and select it.
![navigate_cloudformation](images/04_AWS_CloudFormation_navigate_cloudformation.jpg)


4. Create a New Stack:

 - Click on Create stack.

 - Choose With new resources (standard).
![create_stack](images/05_AWS_CloudFormation_create_stack.jpg)

![create_stack](images/06_AWS_CloudFormation_create_stack.jpg)


5. Upload the Template:

 - In the Specify template section, select Upload a template file.

 - Click Choose file and select the cloudformation-template.yaml file you saved earlier.

 - Click Next.

![create_stack](images/07_AWS_CloudFormation_create_stack.jpg)


6. Specify Stack Details:

 - Enter a Stack name ( MyCloudFormationStack).

 - Add any Tags if necessary.

 - Click Next.


7. Configure Stack Options:

 - Configure any additional stack options if needed.

 - Click Next.


8. Review and Create Stack:

 - Review the stack details and click Create stack.


9. Monitor Stack Creation:

   - CloudFormation will begin creating the resources. You can monitor the progress in the Events tab of the stack.

![create_stack_in_progress](images/08_AWS_CloudFormation_create_stack_in_progress.jpg)

![create_stack_in_progress](images/09_AWS_CloudFormation_create_stack_in_progress.jpg)